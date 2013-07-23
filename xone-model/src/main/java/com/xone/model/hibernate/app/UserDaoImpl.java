package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class UserDaoImpl extends AbstractHibernateDao<Person> implements UserDao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + Person.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			"1", id
		});
	}

}