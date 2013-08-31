package com.xone.action.back.userroles;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.UserRoles;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.UserRolesService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class UserRolesBackAction extends Action {
	
	@Autowired
	protected UserRolesService userRolesService;
	protected UserRoles userRoles = new UserRoles();
	protected List<UserRoles> list = new ArrayList<UserRoles>();
	protected Pagination pagination = new Pagination();
	
	public String userRolesList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getUserRolesService().findByParams(params);
//		List<UserRoles> l = getUserRolesService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
	public String userRolesItem() throws Exception {
		UserRoles entity = getUserRolesService().findById(getUserRoles().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setUserRoles(entity);
		return SUCCESS;
	}
	
	public String userRolesCreate() throws Exception {
		return SUCCESS;
	}
	
	public String userRolesEdit() throws Exception {
		UserRoles entity = getUserRolesService().findById(getUserRoles().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setUserRoles(entity);
		return SUCCESS;
	}
	
	public String userRolesSave() throws Exception {
		setUserRoles(getUserRolesService().save(getUserRoles()));
		return SUCCESS;
	}
	
	public String userRolesUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			UserRoles entity = getUserRolesService().findById(getUserRoles().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getUserRolesService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			UserRoles entity = getUserRolesService().findById(getUserRoles().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getUserRoles(), entity, UserRoles.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			setUserRoles(getUserRolesService().update(entity));
		}
		return SUCCESS;
	}

	public UserRolesService getUserRolesService() {
		return userRolesService;
	}

	public void setUserRolesService(UserRolesService userRolesService) {
		this.userRolesService = userRolesService;
	}

	public List<UserRoles> getList() {
		return list;
	}

	public void setList(List<UserRoles> list) {
		this.list = list;
	}

	public UserRoles getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(UserRoles userRoles) {
		this.userRoles = userRoles;
	}
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
