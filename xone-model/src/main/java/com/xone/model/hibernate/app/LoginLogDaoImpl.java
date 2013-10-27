package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.LoginLog;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class LoginLogDaoImpl extends AbstractHibernateDao<LoginLog> implements LoginLogDao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + LoginLog.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			LoginLog.FlagDeleted.DELETED.getValue(), id
		});
	}

}