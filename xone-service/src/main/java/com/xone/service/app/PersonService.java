/**
 * PersonService.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-12
 *
 */
package com.xone.service.app;

import java.util.List;

import com.xone.model.persistence.sqldb.entries.app.Person;

/**
 * @TODO 请Hunny添加代码注释 
 * @author Hunny
 * @created 2011-3-12 下午08:48:49
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 */

public interface PersonService {
	
	public List<Person> findAll();
	
	public List<Person> findAllByPerson(Person person);
	
	public void save(Person p);
}
