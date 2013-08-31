package com.xone.action.web.rolesresources;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.RolesResources;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.RolesResourcesService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class RolesResourcesWebAction extends Action {
	
	@Autowired
	protected RolesResourcesService rolesResourcesService;
	protected RolesResources rolesResources = new RolesResources();
	protected List<RolesResources> list = new ArrayList<RolesResources>();
	protected Pagination pagination = new Pagination();
	
	public String rolesResourcesList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getRolesResourcesService().findByParams(params);
//		List<RolesResources> l = getRolesResourcesService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
	public String rolesResourcesItem() throws Exception {
		RolesResources entity = getRolesResourcesService().findById(getRolesResources().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setRolesResources(entity);
		return SUCCESS;
	}
	
	public String rolesResourcesCreate() throws Exception {
		return SUCCESS;
	}
	
	public String rolesResourcesEdit() throws Exception {
		RolesResources entity = getRolesResourcesService().findById(getRolesResources().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setRolesResources(entity);
		return SUCCESS;
	}
	
	public String rolesResourcesSave() throws Exception {
		setRolesResources(getRolesResourcesService().save(getRolesResources()));
		return SUCCESS;
	}
	
	public String rolesResourcesUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			RolesResources entity = getRolesResourcesService().findById(getRolesResources().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getRolesResourcesService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			RolesResources entity = getRolesResourcesService().findById(getRolesResources().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getRolesResources(), entity, RolesResources.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			setRolesResources(getRolesResourcesService().update(entity));
		}
		return SUCCESS;
	}

	public RolesResourcesService getRolesResourcesService() {
		return rolesResourcesService;
	}

	public void setRolesResourcesService(RolesResourcesService rolesResourcesService) {
		this.rolesResourcesService = rolesResourcesService;
	}

	public List<RolesResources> getList() {
		return list;
	}

	public void setList(List<RolesResources> list) {
		this.list = list;
	}

	public RolesResources getRolesResources() {
		return rolesResources;
	}

	public void setRolesResources(RolesResources rolesResources) {
		this.rolesResources = rolesResources;
	}
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
