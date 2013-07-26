package com.xone.action.web.resources;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Resources;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.ResourcesService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class ResourcesWebAction extends Action {
	
	@Autowired
	protected ResourcesService resourcesService;
	protected Resources resources = new Resources();
	protected List<Resources> list = new ArrayList<Resources>();
	protected Pagination pagination = new Pagination();
	
	public String resourcesList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getResourcesService().findByParams(params);
//		List<Resources> l = getResourcesService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
	public String resourcesItem() throws Exception {
		Resources entity = getResourcesService().findById(getResources().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setResources(entity);
		return SUCCESS;
	}
	
	public String resourcesCreate() throws Exception {
		return SUCCESS;
	}
	
	public String resourcesEdit() throws Exception {
		Resources entity = getResourcesService().findById(getResources().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setResources(entity);
		return SUCCESS;
	}
	
	public String resourcesSave() throws Exception {
		setResources(getResourcesService().save(getResources()));
		return SUCCESS;
	}
	
	public String resourcesUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			Resources entity = getResourcesService().findById(getResources().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getResourcesService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			Resources entity = getResourcesService().findById(getResources().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getResources(), entity, Resources.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			setResources(getResourcesService().update(entity));
		}
		return SUCCESS;
	}

	public ResourcesService getResourcesService() {
		return resourcesService;
	}

	public void setResourcesService(ResourcesService resourcesService) {
		this.resourcesService = resourcesService;
	}

	public List<Resources> getList() {
		return list;
	}

	public void setList(List<Resources> list) {
		this.list = list;
	}

	public Resources getResources() {
		return resources;
	}

	public void setResources(Resources resources) {
		this.resources = resources;
	}
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
