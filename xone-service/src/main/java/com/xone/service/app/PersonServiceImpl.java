/**
 * PersonServiceImpl.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-12
 *
 */
package com.xone.service.app;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.xone.model.persistence.sqldb.dao.app.PersonDao;
import com.xone.model.persistence.sqldb.entries.app.Person;

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

	@SuppressWarnings("unchecked")
    public List<Person> findAll() {
        return personDao.findAll(Person.class);
    }
	
	public List<Person> findAllByPerson(Person person) {
		return personDao.findAllByEntity(person);
	}

	/* (non-Javadoc)
	 * @see com.hunny.service.app.PersonService#save(com.hunny.model.persistence.sqldb.entries.app.Person)
	 */
	@Override
	public void save(Person p) {
		if (null != p) {
			this.personDao.save(p);
		}
	}
	
}
