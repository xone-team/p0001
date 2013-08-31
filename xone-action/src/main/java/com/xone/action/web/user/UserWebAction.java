package com.xone.action.web.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.RolesService;
import com.xone.service.app.UserService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class UserWebAction extends Action {

    /**
	 * 
	 */
	private static final long serialVersionUID = -881027609944260400L;
	@Autowired
    protected UserService userService;
    protected Person user = new Person();
    protected List<Person> list = new ArrayList<Person>();
    protected Pagination pagination = new Pagination();
    
    protected RolesService rolesService;

    public Enum<?>[] getFlagDeleted() {
        return Person.FlagDeleted.values();
    }

    public Enum<?>[] getCredit() {
        return Person.Credit.values();
    }

    public Enum<?>[] getUserLevel() {
        return Person.UserLevel.values();
    }

	
	public String register() throws Exception {
		return SUCCESS;
	}
    
    public String userList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        params.put("pageSize", String.valueOf(getPagination().getPageSize()));
        params.put("pageNo", String.valueOf(getPagination().getPageNo()));
        Pagination p = getUserService().findByParams(params);
        setPagination(p);
        return SUCCESS;
    }

    public String userItem() throws Exception {
        if (getUserId() < 1) {
            return ERROR;
        }
        getUser().setId(getUserId());

        Person entity = getUserService().findById(getUser().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setUser(entity);
        return SUCCESS;
    }

    public String userCreate() throws Exception {
        return SUCCESS;
    }

    public String userEdit() throws Exception {
        if (getUserId() < 1) {
            return ERROR;
        }
        getUser().setId(getUserId());

        Person entity = getUserService().findById(getUser().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setUser(entity);
        return SUCCESS;
    }

    public String userSave() throws Exception {
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return INPUT;
        }
        
        if(getUser().getUsername() == null || getUser().getUsername().trim().length() > 20 || getUser().getUsername().trim().length() < 6 ){
        	addFieldError("user.username", "请输入用户名，长度在6－20位之间");
        	return INPUT;
        }
        if(getUser().getPassword() == null || getUser().getPassword().trim().length() > 20 || getUser().getPassword().trim().length() < 6 ){
        	addFieldError("user.password", "请输入密码，长度在6－20位之间");
        	return INPUT;
        }
        Map<String, String> params = new HashMap<String, String>();
        params.put("username", getUser().getUsername().trim());
        List<Person> l = userService.findAllByMap(params);
        if(l.size() > 0){
        	addFieldError("user.username", "用户名［"+getUser().getUsername().trim()+"］已存在，请换一个用户名");
        	return INPUT;
        }
    	
        getUser().setCredit(Person.Credit.NO.getValue());
        getUser().setUserLevel(Person.UserLevel.C.getValue());

        getUser().setUserCreated(getUserId());
        getUser().setUserUpdated(getUserId());

        getUser().setUserApply(getUserId());
        getUser().setDateApply(new Date());

        setUser(getUserService().saveMember(getUser()));
        
        return SUCCESS;
    }

    public String userUpdate() throws Exception {
        if (getUserId() < 1) {
            return ERROR;
        }
        getUser().setId(getUserId());

        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return ERROR;
        }
        String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
        if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
            Person entity = getUserService().findById(getUser().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            getUserService().delete(entity);
            return ERROR;
        }
        if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
            Person entity = getUserService().findById(getUser().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            MyBeanUtils.copyProperties(getUser(), entity, Person.class, null, new CopyRules() {
                @Override
                public boolean myCopyRules(Object value) {
                    return (null != value);
                }
            });

            getUser().setUserUpdated(getUserId());
            getUser().setLastUpdated(new Date());

            setUser(getUserService().update(entity));
        }
        return SUCCESS;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public List<Person> getList() {
        return list;
    }

    public void setList(List<Person> list) {
        this.list = list;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public Person getUser() {
        return user;
    }

    public void setUser(Person person) {
        this.user = person;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

	public RolesService getRolesService() {
		return rolesService;
	}

	public void setRolesService(RolesService rolesService) {
		this.rolesService = rolesService;
	}
    
    
}
