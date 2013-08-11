package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.ProductGroup;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class ProductGroupDaoImpl extends AbstractHibernateDao<ProductGroup> implements ProductGroupDao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + ProductGroup.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			ProductGroup.FlagDeleted.DELETED.getValue(), id
		});
	}

}