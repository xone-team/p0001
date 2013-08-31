package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.generic.HibernateDao;

public interface DeliveryDao extends HibernateDao<Delivery> {
	public int deleteLogicById(Long id);
}
