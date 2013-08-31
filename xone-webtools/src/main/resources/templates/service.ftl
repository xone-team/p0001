package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.${tableName};
import com.xone.model.hibernate.support.Pagination;

public interface ${tableName}Service {

	public ${tableName} save(${tableName} entity);
	
	public ${tableName} update(${tableName} entity);

	public ${tableName} findById(Long id);
	
	public void delete(${tableName} entity);

	public List<${tableName}> findAllByMap(Map<String, String> params);
	
	public ${tableName} findByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
	
}
