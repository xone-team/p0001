package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.${tableName}Dao;
import com.xone.model.hibernate.entity.${tableName};
import com.xone.model.hibernate.support.Pagination;

public class ${tableName}ServiceImpl implements ${tableName}Service {

	@Autowired
	protected ${tableName}Dao ${tableVarName}Dao;

	@Override
	public ${tableName} save(${tableName} entity) {
		return get${tableName}Dao().save(entity);
	}
	
	@Override
	public ${tableName} update(${tableName} entity) {
		return get${tableName}Dao().update(entity);
	}
	
	@Override
	public void delete(${tableName} entity) {
		get${tableName}Dao().deleteById(entity.getId());
	}

	@Override
	public ${tableName} findById(Long id) {
		return get${tableName}Dao().findById(id);
	}

	@Override
	public List<${tableName}> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(${tableName}.class);
		return get${tableName}Dao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(${tableName}.class);
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return get${tableName}Dao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}

	public ${tableName}Dao get${tableName}Dao() {
		return ${tableVarName}Dao;
	}

	public void set${tableName}Dao(${tableName}Dao ${tableVarName}Dao) {
		this.${tableVarName}Dao = ${tableVarName}Dao;
	}
	
}
