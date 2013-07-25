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
	private static final Log log = LogFactory.getLog(${tableName}ServiceImpl.class);

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
				
		handleCriteriaByParams(detachedCriteria, params);
				
		return get${tableName}Dao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(${tableName}.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return get${tableName}Dao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
		<#list tableProperties as p>
			<#if p.columnClassName == "java.lang.Long">
		String ${p.javaVarName} = params.get("${p.javaVarName}");
        if (!StringUtils.isBlank(${p.javaVarName})) {
            criteria.add(Restrictions.eq("${p.javaVarName}", Long.parseLong(${p.javaVarName})));
        }
			</#if>
			<#if p.columnClassName == "java.lang.String">
		String ${p.javaVarName} = params.get("${p.javaVarName}");
        if (!StringUtils.isBlank(${p.javaVarName})) {
            criteria.add(Restrictions.like("${p.javaVarName}", "%" + ${p.javaVarName} + "%"));
        }
			</#if>
			<#if p.columnClassName == "java.util.Date">
        String ${p.javaVarName}Min = params.get("${p.javaVarName}Min");
        if (!StringUtils.isBlank(${p.javaVarName}Min)) {
            try {
                criteria.add(Restrictions.ge("${p.javaVarName}", DateUtils.parseDate(${p.javaVarName}Min, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[${p.javaVarName}Min] parsed exception :", e);
            }
        }
        String ${p.javaVarName}Max = params.get("${p.javaVarName}Max");
        if (!StringUtils.isBlank(${p.javaVarName}Max)) {
            try {
                criteria.add(Restrictions.lt("${p.javaVarName}", DateUtils.addDays(DateUtils.parseDate(${p.javaVarName}Max, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[${p.javaVarName}Max] parsed exception :", e);
            }
        }
			</#if>
		</#list>
        
        criteria.addOrder(Order.desc("dateCreated"));
	}

	public ${tableName}Dao get${tableName}Dao() {
		return ${tableVarName}Dao;
	}

	public void set${tableName}Dao(${tableName}Dao ${tableVarName}Dao) {
		this.${tableVarName}Dao = ${tableVarName}Dao;
	}
	
}
