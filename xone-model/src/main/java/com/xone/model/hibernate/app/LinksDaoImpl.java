package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.Links;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class LinksDaoImpl extends AbstractHibernateDao<Links> implements LinksDao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + Links.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			Links.FlagDeleted.DELETED.getValue(), id
		});
	}

}