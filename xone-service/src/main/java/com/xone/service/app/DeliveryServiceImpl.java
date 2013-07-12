package com.xone.service.app;

import java.text.ParseException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.lang.xwork.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.DeliveryDao;
import com.xone.model.hibernate.entity.Delivery;

public class DeliveryServiceImpl implements DeliveryService {
	
	@Autowired
	protected DeliveryDao deliveryDao;

	public DeliveryDao getDeliveryDao() {
		return deliveryDao;
	}

	public void setDeliveryDao(DeliveryDao deliveryDao) {
		this.deliveryDao = deliveryDao;
	}

	@Override
	public Delivery save(Delivery delivery) {
		return getDeliveryDao().save(delivery);
	}

	@Override
	public List<Delivery> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Delivery.class);
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
		return getDeliveryDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
	}

	@Override
	public Delivery findByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Delivery.class);
		String id = params.get("id");
		if (!StringUtils.isBlank(id)) {
			detachedCriteria.add(Restrictions.eq("id", Long.parseLong(id)));
		}
		List<Delivery> l = getDeliveryDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
		if (null == l) {
			return new Delivery();
		}
		return l.get(0);
	}

}
