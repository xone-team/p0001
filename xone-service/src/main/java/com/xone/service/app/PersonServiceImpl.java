/**
 * PersonServiceImpl.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-12
 *
 */
package com.xone.service.app;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
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

	@Override
	public Person save(Person p) {
		if (null != p) {
			return this.personDao.save(p);
		}
		return null;
	}

	@Override
	public Person update(Person p) {
		if (null != p) {
			return this.personDao.update(p);
		}
		return null;
	}
	
	@Override
	public Person findByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Person.class);
		String id = params.get("id");
		if (!StringUtils.isBlank(id)) {
			detachedCriteria.add(Restrictions.eq("id", Long.parseLong(id)));
		}
		String username = params.get("username");
		if (!StringUtils.isBlank(username)) {
			detachedCriteria.add(Restrictions.eq("username", username));
		}
		List<Person> l = getPersonDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
		if (null == l || l.isEmpty()) {
			return new Person();
		}
		Person p = l.get(0);
		return p;
	}

    @Override
    public Person findById(Serializable id) {
        return personDao.findById(id);
    }

    @Override
    public void deleteById(Serializable id) {
        personDao.deleteById(id);
    }

    @Override
    public List<Person> findAll() {
        return personDao.findAll();
    }

    @Override
    public Person saveOrUpdate(Person p) {
        return personDao.saveOrUpdate(p);
    }

}
