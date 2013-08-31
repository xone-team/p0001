package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class DeliveryDaoImpl extends AbstractHibernateDao<Delivery> implements DeliveryDao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + Delivery.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			Delivery.FlagDeleted.DELETED.getValue(), id
		});
	}
}
