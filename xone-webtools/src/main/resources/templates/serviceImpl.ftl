package com.xone.service.app;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
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
    public ${tableName} findByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(${tableName}.class);
        List<${tableName}> l = get${tableName}Dao().findListByDetachedCriteria(detachedCriteria, 0, 1);
        if (null == l) {
            return new ${tableName}();
        }
        return l.get(0);
    }

	@Override
	public List<${tableName}> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(${tableName}.class);
        detachedCriteria.addOrder(Order.desc("dateCreated"));
		return get${tableName}Dao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(${tableName}.class);
		int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
		return get${tableName}Dao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}

	public ${tableName}Dao get${tableName}Dao() {
		return ${tableVarName}Dao;
	}

	public void set${tableName}Dao(${tableName}Dao ${tableVarName}Dao) {
		this.${tableVarName}Dao = ${tableVarName}Dao;
	}
	
}
