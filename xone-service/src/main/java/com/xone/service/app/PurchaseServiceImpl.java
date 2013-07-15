package com.xone.service.app;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.lang.xwork.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ImageUploadedDao;
import com.xone.model.hibernate.app.PurchaseDao;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Purchase;

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
	public Purchase save(Purchase entity, ImageUploaded imageUploaded) {
		entity = getPurchaseDao().save(entity);
		imageUploaded.setRefId(entity.getId());
		imageUploaded = getImageUploadedDao().save(imageUploaded);
		entity.getIds().add(imageUploaded.getId());
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
			Map<Long, List<Long>> maps = getImageUploadedDao().findAllIdsByRefIds(ids, 0, ids.size() * 3);
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
		if (null == l) {
			return new Purchase();
		}
		return l.get(0);
	}

}
