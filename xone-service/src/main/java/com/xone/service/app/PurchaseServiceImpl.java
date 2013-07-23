package com.xone.service.app;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ImageUploadedDao;
import com.xone.model.hibernate.app.PurchaseDao;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	protected PurchaseDao purchaseDao;
	
	@Autowired
	protected ImageUploadedDao imageUploadedDao;
	
	public PurchaseDao getPurchaseDao() {
		return purchaseDao;
	}


	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

	public ImageUploadedDao getImageUploadedDao() {
		return imageUploadedDao;
	}

	public void setImageUploadedDao(ImageUploadedDao imageUploadedDao) {
		this.imageUploadedDao = imageUploadedDao;
	}

	@Override
	public Purchase save(Purchase entity) {
		return getPurchaseDao().save(entity);
	}
	
	@Override
	public List<Purchase> save(List<Purchase> entity) {
		return getPurchaseDao().save(entity);
	}
	
	@Override
	public Purchase save(Purchase entity, ImageUploaded imageUploaded) {
		entity = getPurchaseDao().save(entity);
		imageUploaded.setRefId(entity.getId());
		imageUploaded.setRefType(ImageUploaded.RefType.PURCHASE.getValue());
		imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL.getValue());
		imageUploaded = getImageUploadedDao().save(imageUploaded);
		entity.getIds().add(imageUploaded.getId());
		return entity;
	}
	
	@Override
	public Purchase save(Purchase entity, List<ImageUploaded> imageUploadeds) {
		entity = getPurchaseDao().save(entity);
		for (ImageUploaded imageUploaded : imageUploadeds) {
			imageUploaded.setRefId(entity.getId());
			imageUploaded.setRefType(ImageUploaded.RefType.PURCHASE.getValue());
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
	
	public Purchase update(Purchase entity, List<ImageUploaded> imageUploadeds, List<Long> imageIds) {
		entity = getPurchaseDao().update(entity);
		for (ImageUploaded imageUploaded : imageUploadeds) {
			imageUploaded.setRefId(entity.getId());
			imageUploaded.setRefType(ImageUploaded.RefType.PURCHASE.getValue());
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
	public List<Purchase> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Purchase.class);
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
		detachedCriteria.addOrder(Order.desc("dateCreated"));
		List<Purchase> list = getPurchaseDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
		if (null != list && !list.isEmpty()) {
			List<Long> ids = new ArrayList<Long>();
			for (Purchase p : list) {
				ids.add(p.getId());
			}
			Map<Long, List<Long>> maps = getImageUploadedDao().findAllIdsByRefIds(ids, ImageUploaded.RefType.PURCHASE, 0, ids.size() * 3);
			for (int i = 0; i < ids.size(); i++) {
				Purchase ip = list.get(i);
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
	public Purchase findByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Purchase.class);
		String id = params.get("id");
		if (!StringUtils.isBlank(id)) {
			detachedCriteria.add(Restrictions.eq("id", Long.parseLong(id)));
		}
		List<Purchase> l = getPurchaseDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
		if (null == l || l.isEmpty()) {
			return new Purchase();
		}
		Purchase p = l.get(0);
		List<Long> ids = getImageUploadedDao().findAllIdsByRefId(p.getId(), ImageUploaded.RefType.PURCHASE);
		p.setIds(ids);
		return p;
	}

	@Override
	public Purchase update(Purchase entity) {
		return getPurchaseDao().update(entity);
	}
	
	@Override
	public void delete(Purchase entity) {
		getPurchaseDao().deleteById(entity.getId());
	}
	
	@Override
	public Purchase findById(Long id) {
		return getPurchaseDao().findById(id);
	}

	@Override
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Purchase.class);
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getPurchaseDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
}
