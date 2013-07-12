/**
 * LoginRefAction.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-19
 *
 */
package com.xone.action.app.loginref;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.action.base.EncryptRef;
import com.xone.model.hibernate.entity.Person;
import com.xone.service.app.PersonService;


/**
 * @TODO 请Hunny添加代码注释 
 *
 * @author Hunny
 * @created 2011-3-19 下午10:26:26
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class LoginRefAction extends Action {
	
	private static final long serialVersionUID = -6619796711772558844L;
	
	private String redirect;
	protected Person person;
	
	@Autowired
	private PersonService personService;

	/**
	 * @return the redirect
	 */
	public String getRedirect() {
		return redirect;
	}
	
	

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	/**
	 * @param redirect the redirect to set
	 */
	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	/**
	 * @return the personService
	 */
	public PersonService getPersonService() {
		return personService;
	}

	/**
	 * @param personService the personService to set
	 */
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	public String init() {
		if (!getUserMap().isEmpty() && null != getUserMap().get("user")) {
			setRedirect("login/main.html");
			return "redirect";
		}
		return SUCCESS;
	}
	
	public String indexRegister() {
		return SUCCESS;
	}
	
	public String main() {
		return SUCCESS;
	}
	
	@SuppressWarnings("rawtypes")
	public String login() {
		String loginHtml = "login/index.html";
		if (null == getPerson().getUsername() || null == getPerson().getPassword()) {
			if (StringUtils.isBlank(getRedirect())) {
				setRedirect(loginHtml);
			}
			return SUCCESS;
		}
		if (!getUserMap().isEmpty() && null != getUserMap().get("user")) {
			setRedirect("login/main.html");
			return SUCCESS;
		}
		Person p = new Person();
		p.setUsername(getPerson().getUsername());
		List<Person> pList = personService.findAllByPerson(p);
		if (pList.size() > 1 || pList.size() <= 0) {//没有记录或者能匹配到多个记录,都要求重新登陆
			setRedirect(loginHtml);
			return SUCCESS;
		}
		p = pList.get(0);
		if (EncryptRef.SHA1(getPerson().getPassword()).equals(p.getPassword())) {
			Map<String, Object> map = new HashMap<String, Object>();
			Map porperties = null;
			try {
				porperties = BeanUtils.describe(p);
				System.out.println(porperties);
			} catch (Exception e) {
				porperties = Collections.EMPTY_MAP;
				e.printStackTrace();
			}
			map.put("user", porperties);
			getSession().setAttribute(USER, map);
//			getUserMap().put("", value)
		} else {
			setRedirect(loginHtml);
			return SUCCESS;
		}
		setRedirect("login/main.html");
		return SUCCESS;
	}
	
	public String logout() {
		getSession().setAttribute(USER, Collections.emptyMap());
		return SUCCESS;
	}
	
	public String initRegister() {
		return SUCCESS;
	}
	
	public String register() {
		HttpServletResponse response = getResponse();
		Person p = new Person();
		p.setUsername(getPerson().getUsername());
		List<Person> pList = personService.findAllByPerson(p);
		if (pList.size() > 1) {//没有记录或者能匹配到多个记录,都要求重新登陆
			writer(response, "该用户已经存在");
			return ERROR;
		}
		p.setPassword(EncryptRef.SHA1(getPerson().getPassword()));
		personService.save(p);
		writer(response, "OK");
		return SUCCESS;
	}
	
	private void writer(HttpServletResponse response, String message) {
		try {
			response.getWriter().write(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} 

}
