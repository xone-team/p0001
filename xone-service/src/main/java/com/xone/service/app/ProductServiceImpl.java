package com.xone.service.app;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.lang.xwork.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ImageUploadedDao;
import com.xone.model.hibernate.app.ProductDao;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Product;

public class ProductServiceImpl implements ProductService {

	@Autowired
	protected ProductDao productDao;
	
	@Autowired
	protected ImageUploadedDao imageUploadedDao;

	@Override
	public Product save(Product entity) {
		return getProductDao().save(entity);
	}

	@Override
	public Product findById(Long id) {
		return getProductDao().findById(id);
	}
	
	@Override
	public Product save(Product entity, ImageUploaded imageUploaded) {
		entity = getProductDao().save(entity);
		imageUploaded.setRefId(entity.getId());
		imageUploaded.setRefType(ImageUploaded.RefType.PRODUCT.getValue());
		imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL.getValue());
		imageUploaded = getImageUploadedDao().save(imageUploaded);
		entity.getIds().add(imageUploaded.getId());
		return entity;
	}
	
	@Override
	public Product save(Product entity, List<ImageUploaded> imageUploadeds) {
		entity = getProductDao().save(entity);
		for (ImageUploaded imageUploaded : imageUploadeds) {
			imageUploaded.setRefId(entity.getId());
			imageUploaded.setRefType(ImageUploaded.RefType.PRODUCT.getValue());
			imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL.getValue());
		}
		imageUploadeds = getImageUploadedDao().save(imageUploadeds);
		List<Long> ids = new ArrayList<Long>();
		for (ImageUploaded imageUploaded : imageUploadeds) {
			ids.add(imageUploaded.getId());
		}
		entity.setIds(ids);
		return entity;
	}
	
	public Product update(Product entity, List<ImageUploaded> imageUploadeds, List<Long> imageIds) {
		entity = getProductDao().update(entity);
		for (ImageUploaded imageUploaded : imageUploadeds) {
			imageUploaded.setRefId(entity.getId());
			imageUploaded.setRefType(ImageUploaded.RefType.PRODUCT.getValue());
			imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL.getValue());
		}
		imageUploadeds = getImageUploadedDao().save(imageUploadeds);
		Map<Long, Boolean> imageIdMap = new HashMap<Long, Boolean>();
		List<Long> ids = new ArrayList<Long>();
		for (Long id : imageIds) {
			imageIdMap.put(id, true);
		}
		for (Long id : entity.getIds()) {
			if (null == imageIdMap.get(id)) {
				getImageUploadedDao().deleteLogicById(id);
			} else {
				ids.add(id);
			}
		}
		for (ImageUploaded imageUploaded : imageUploadeds) {
			ids.add(imageUploaded.getId());
		}
		entity.setIds(ids);
		return entity;
	}
	
	@Override
	public List<Product> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Product.class);
		String gtDateCreated = params.get("gtDateCreated");
		if (!StringUtils.isBlank(gtDateCreated)) {
			try {
				detachedCriteria.add(Restrictions.gt("dateCreated", DateUtils.parseDate(gtDateCreated, new String[] {
						"yyyy-MM-dd HH:mm:ss"
				})));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		String ltDateCreated = params.get("ltDateCreated");
		if (!StringUtils.isBlank(ltDateCreated)) {
			try {
				detachedCriteria.add(Restrictions.lt("dateCreated", DateUtils.parseDate(ltDateCreated, new String[] {
						"yyyy-MM-dd HH:mm:ss"
				})));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		String saleType = params.get("saleType");
		if (!StringUtils.isBlank(saleType)) {
			detachedCriteria.add(Restrictions.eq("saleType", saleType));
		}
		detachedCriteria.addOrder(Order.desc("dateCreated"));
		List<Product> list = getProductDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
		if (null != list && !list.isEmpty()) {
			List<Long> ids = new ArrayList<Long>();
			for (Product p : list) {
				ids.add(p.getId());
			}
			Map<Long, List<Long>> maps = getImageUploadedDao().findAllIdsByRefIds(ids, ImageUploaded.RefType.PRODUCT, 0, ids.size() * 3);
			for (int i = 0; i < ids.size(); i++) {
				Product ip = list.get(i);
				List<Long> imageIds = maps.get(ip.getId());
				if (null != imageIds) {
					ip.setIds(maps.get(ip.getId()));
				}
				list.set(i, ip);
			}
		}
		return list;
	}
	
	@Override
	public Product findByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Product.class);
		String id = params.get("id");
		if (!StringUtils.isBlank(id)) {
			detachedCriteria.add(Restrictions.eq("id", Long.parseLong(id)));
		}
		List<Product> l = getProductDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
		if (null == l || l.isEmpty()) {
			return new Product();
		}
		Product p = l.get(0);
		List<Long> ids = getImageUploadedDao().findAllIdsByRefId(p.getId(), ImageUploaded.RefType.PRODUCT);
		p.setIds(ids);
		return p;
	}

	public ImageUploadedDao getImageUploadedDao() {
		return imageUploadedDao;
	}

	public void setImageUploadedDao(ImageUploadedDao imageUploadedDao) {
		this.imageUploadedDao = imageUploadedDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
}