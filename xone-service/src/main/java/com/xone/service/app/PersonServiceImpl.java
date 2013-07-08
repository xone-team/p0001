/**
 * PersonServiceImpl.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-12
 *
 */
package com.xone.service.app;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.xone.model.hibernate.app.PersonDao;
//import com.xone.model.persistence.sqldb.dao.app.PersonDao;
//import com.xone.model.persistence.sqldb.entries.app.Person;
import com.xone.model.hibernate.entity.Person;

/**
 * @TODO 请Hunny添加代码注释 
 *
 * @author Hunny
 * @created 2011-3-12 下午08:50:25
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
@Transactional
public class PersonServiceImpl implements PersonService {
    
    @Autowired
    private PersonDao personDao;
    
    /**
	 * @return the personDao
	 */
	public PersonDao getPersonDao() {
		return personDao;
	}

	/**
	 * @param personDao the personDao to set
	 */
	public void setPersonDao(PersonDao personDao) {
		this.personDao = personDao;
	}
	
	public List<Person> findAllByPerson(Person person) {
		if (null == person) {
			return Collections.emptyList();
		}
		return personDao.findAllByName(person.getUsername(), 0, 1);
	}

	/* (non-Javadoc)
	 * @see com.hunny.service.app.PersonService#save(com.hunny.model.persistence.sqldb.entries.app.Person)
	 */
	@Override
	public Person save(Person p) {
		if (null != p) {
			return this.personDao.save(p);
		}
		return null;
	}
	
}
