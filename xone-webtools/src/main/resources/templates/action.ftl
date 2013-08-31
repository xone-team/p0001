package com.xone.action.web.${packageName};

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.${tableName};
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.${tableName}Service;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class ${tableName}WebAction extends Action {
	
	@Autowired
	protected ${tableName}Service ${tableVarName}Service;
	protected ${tableName} ${tableVarName} = new ${tableName}();
	protected List<${tableName}> list = new ArrayList<${tableName}>();
	protected Pagination pagination = new Pagination();
	
	public String ${tableVarName}List() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = get${tableName}Service().findByParams(params);
//		List<${tableName}> l = get${tableName}Service().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
	public String ${tableVarName}Item() throws Exception {
		${tableName} entity = get${tableName}Service().findById(get${tableName}().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		set${tableName}(entity);
		return SUCCESS;
	}
	
	public String ${tableVarName}Create() throws Exception {
		return SUCCESS;
	}
	
	public String ${tableVarName}Edit() throws Exception {
		${tableName} entity = get${tableName}Service().findById(get${tableName}().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		set${tableName}(entity);
		return SUCCESS;
	}
	
	public String ${tableVarName}Save() throws Exception {
		set${tableName}(get${tableName}Service().save(get${tableName}()));
		return SUCCESS;
	}
	
	public String ${tableVarName}Update() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			${tableName} entity = get${tableName}Service().findById(get${tableName}().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			get${tableName}Service().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			${tableName} entity = get${tableName}Service().findById(get${tableName}().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(get${tableName}(), entity, ${tableName}.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			set${tableName}(get${tableName}Service().update(entity));
		}
		return SUCCESS;
	}

	public ${tableName}Service get${tableName}Service() {
		return ${tableVarName}Service;
	}

	public void set${tableName}Service(${tableName}Service ${tableVarName}Service) {
		this.${tableVarName}Service = ${tableVarName}Service;
	}

	public List<${tableName}> getList() {
		return list;
	}

	public void setList(List<${tableName}> list) {
		this.list = list;
	}

	public ${tableName} get${tableName}() {
		return ${tableVarName};
	}

	public void set${tableName}(${tableName} ${tableVarName}) {
		this.${tableVarName} = ${tableVarName};
	}
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
