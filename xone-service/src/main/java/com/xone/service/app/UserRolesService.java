package com.xone.service.app;

import java.util.List;
import java.util.Map;
import com.xone.model.hibernate.entity.UserRoles;
import com.xone.model.hibernate.support.Pagination;
public interface UserRolesService {

	public UserRoles save(UserRoles entity);
	
	public UserRoles update(UserRoles entity);
	public UserRoles findById(Long id);
	
	public void delete(UserRoles entity);
	public List<UserRoles> findAllByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
}