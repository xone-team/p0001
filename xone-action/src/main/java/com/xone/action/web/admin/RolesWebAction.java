package com.xone.action.web.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Roles;
import com.xone.service.app.RolesService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRoles;

public class RolesWebAction extends Action {
	
	private static final long serialVersionUID = 5350031325136827957L;
	
	@Autowired
	protected RolesService rolesService;
	protected Roles roles = new Roles();
	protected List<Roles> list = new ArrayList<Roles>();
	
	public String rolesList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		List<Roles> l = getRolesService().findAllByMap(params);
		if (null != l && !l.isEmpty()) {
			getList().addAll(l);
		}
		return SUCCESS;
	}
	
	public String rolesItem() throws Exception {
		Roles entity = getRolesService().findById(getRoles().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setRoles(entity);
		return SUCCESS;
	}
	
	public String rolesCreate() throws Exception {
		return SUCCESS;
	}
	
	public String rolesEdit() throws Exception {
		Roles entity = getRolesService().findById(getRoles().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setRoles(entity);
		return SUCCESS;
	}
	
	public String rolesSave() throws Exception {
		setRoles(getRolesService().save(getRoles()));
		return SUCCESS;
	}
	
	public String rolesUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			Roles entity = getRolesService().findById(getRoles().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getRolesService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			Roles entity = getRolesService().findById(getRoles().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getRoles(), entity, Roles.class, null, new CopyRoles() {
				@Override
				public boolean myCopyRoles(Object value) {
					return (null != value);
				}
			});
			setRoles(getRolesService().update(entity));
		}
		return SUCCESS;
	}

	public RolesService getRolesService() {
		return rolesService;
	}

	public void setRolesService(RolesService rolesService) {
		this.rolesService = rolesService;
	}

	public List<Roles> getList() {
		return list;
	}

	public void setList(List<Roles> list) {
		this.list = list;
	}

	public Roles getRoles() {
		return roles;
	}

	public void setRoles(Roles roles) {
		this.roles = roles;
	}
	
}
