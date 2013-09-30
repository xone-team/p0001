package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.UserLinks;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class UserLinksDaoImpl extends AbstractHibernateDao<UserLinks> implements UserLinksDao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + UserLinks.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			UserLinks.FlagDeleted.DELETED.getValue(), id
		});
	}

}