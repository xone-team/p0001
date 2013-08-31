package com.xone.model.hibernate.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.generic.HibernateDao;

public interface PersonDao extends HibernateDao<Person> {
	
	public List<Person> findAllByName(String username, int fetchSize, int maxResults);
	
	public Person findByParams(Map<String, String> params);
	
	public List<Person> findAllByParams(Map<String, String> params);
	
}
