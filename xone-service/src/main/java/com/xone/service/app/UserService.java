package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.support.Pagination;

public interface UserService {

	public Person save(Person entity);
	
	public Person update(Person entity);

	public Person findById(Long id);
	
	public void delete(Person entity);

	public List<Person> findAllByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);

	public Person saveMember(Person entity);
	
}
