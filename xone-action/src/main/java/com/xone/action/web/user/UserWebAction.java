package com.xone.action.web.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.UserService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class UserWebAction extends Action {
	
	@Autowired
	protected UserService userService;
	protected Person person = new Person();
	protected List<Person> list = new ArrayList<Person>();
	protected Pagination pagination = new Pagination();
	
	public String userList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getUserService().findByParams(params);
//		List<User> l = getUserService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		setPagination(p);
		return SUCCESS;
	}
	
	public String userItem() throws Exception {
		Person entity = getUserService().findById(getPerson().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setPerson(entity);
		return SUCCESS;
	}
	
	public String userCreate() throws Exception {
		return SUCCESS;
	}
	
	public String userEdit() throws Exception {
		Person entity = getUserService().findById(getPerson().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setPerson(entity);
		return SUCCESS;
	}
	
	public String userSave() throws Exception {
		setPerson(getUserService().save(getPerson()));
		return SUCCESS;
	}
	
	public String userUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			Person entity = getUserService().findById(getPerson().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getUserService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			Person entity = getUserService().findById(getPerson().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getPerson(), entity, Person.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			setPerson(getUserService().update(entity));
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

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
