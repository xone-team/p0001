package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Resources;
import com.xone.model.hibernate.entity.Roles;

public interface RolesService {

	public Roles save(Roles entity);
	
	public Roles update(Roles entity);

	public Roles findById(Long id);
	
	public void delete(Roles entity);

	public List<Roles> findAllByMap(Map<String, String> params);
	
	public List<Roles> findAllByUser(Person person);
	
	public List<Resources> findAllByRoles(List<Roles> roles);
}