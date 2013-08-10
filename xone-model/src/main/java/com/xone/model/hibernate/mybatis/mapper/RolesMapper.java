package com.xone.model.hibernate.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Roles;

public interface RolesMapper {
	
	public List<Roles> findRolesWithUser(Map<String, Object> params);

	public Integer countRolesWithUser(Map<String, Object> params);
	
	public List<Roles> findRolesWithResources(Map<String, Object> params);
	
	public Integer countRolesWithResources(Map<String, Object> params);

}
