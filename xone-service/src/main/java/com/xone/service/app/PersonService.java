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
import java.util.Map;

import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.support.Pagination;


/**
 * @TODO 请Hunny添加代码注释 
 * @author Hunny
 * @created 2011-3-12 下午08:48:49
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 */

public interface PersonService {
	
    public Person save(Person entity);
    
    public Person update(Person entity);
    
    public Person update(Person entity, List<Long> roleIds);

    public Person findById(Long id);
    
    public void delete(Person entity);
    
    public List<Person> findAllByMap(Map<String, String> params);
    
    public Person findByMap(Map<String, String> params);

    public Pagination findByParams(Map<String, String> params);
    
    public List<Person> findAllByPerson(Person person);

    public List<Person> findAll();

    public Person save(Person entity, List<Long> roleIds);
	
}
