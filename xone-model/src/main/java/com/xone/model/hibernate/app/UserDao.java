package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.generic.HibernateDao;

public interface UserDao extends HibernateDao<Person> {

	public int deleteLogicById(Long id);
	
}
