package com.xone.action.back.roles;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.MyModel;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.RolesService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class RolesBackAction extends Action {
	
	/**
     * 
     */
    private static final long serialVersionUID = -8123862446025502037L;
    @Autowired
	protected RolesService rolesService;
	protected Roles roles = new Roles();
	protected List<Roles> list = new ArrayList<Roles>();
	protected Pagination pagination = new Pagination();

    public Enum<?>[] getFlagDeleted() {
        return Roles.FlagDeleted.values();
    }
    public Enum<?>[] getEnable() {
        return Roles.Enable.values();
    }

    public String rolesList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
	    MyBeanUtils.copyPropertiesToMap(getRoles(), params, new CopyRules() {
	        @Override
	        public boolean myCopyRules(Object value) {
	          return null != value;
	        }
	      }, new AssignRules() {
	        @Override
	        public String myAssignRules(Object value) {
	          return value.toString();
	        }
	      }, null);
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getRolesService().findByParams(params);
		setPagination(p);
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
	    roles.setEnable(Roles.Enable.YES.getValue());
	    
	    roles.setUserCreated(getUserId());
	    roles.setUserUpdated(getUserId());
	    
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
			MyBeanUtils.copyProperties(getRoles(), entity, Roles.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			
			entity.setUserUpdated(getUserId());
			setRoles(getRolesService().update(entity));
		}
		return SUCCESS;
	}

    public String rolesSelect() throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        MyBeanUtils.copyPropertiesToMap(getRoles(), params, new CopyRules() {
            @Override
            public boolean myCopyRules(Object value) {
                return null != value;
            }

        }, new AssignRules() {
            @Override
            public String myAssignRules(Object value) {
                return value.toString();
            }
        }, null);
        params.put("enable", Roles.Enable.YES.getValue());
        List<Roles> list = getRolesService().findAllByMap(params);
        setList(list);
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
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
}
