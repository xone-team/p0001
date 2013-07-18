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
import java.util.ArrayList;
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
		if (null != getUserMap() && !getUserMap().isEmpty()) {
			setRedirect("login/main.html");
			return "redirect";
		}
		return SUCCESS;
	}
	
	public String indexRegister() {
		return SUCCESS;
	}
	
	public String main() {
		if (null == getUserMap() || getUserMap().isEmpty()) {
			setRedirect("login/index.html");
			return "redirect";
		}
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
		String msg = "用户不存在或者密码不正确。";
		Person p = new Person();
		p.setUsername(getPerson().getUsername());
		List<Person> pList = personService.findAllByPerson(p);
		if (pList.size() > 1 || pList.size() <= 0) {//没有记录或者能匹配到多个记录,都要求重新登陆
			getMapValue().put("msg", msg);
//			setRedirect(loginHtml);
			return ERROR;
		}
		p = pList.get(0);
		if (EncryptRef.SHA1(getPerson().getPassword()).equals(p.getPassword())) {
			Map<String, Object> map = new HashMap<String, Object>();
			Map porperties = null;
			try {
				porperties = BeanUtils.describe(p);
			} catch (Exception e) {
				porperties = Collections.EMPTY_MAP;
				e.printStackTrace();
			}
			map.put("user", porperties);
			getSession().setAttribute(USER, porperties);
//			getUserMap().put("", value)
		} else {
			getMapValue().put("msg", msg);
//			setRedirect(loginHtml);
			return ERROR;
		}
		setRedirect("login/main.html");
		return SUCCESS;
	}
	
	public String logout() {
		getSession().setAttribute(USER, Collections.emptyMap());
		return SUCCESS;
	}
	
	public String indexUpdate() {
		setMapValue(new HashMap<String, Object>());
		Person p = new Person();
		p.setUsername(getUsername());
		List<Person> pList = personService.findAllByPerson(p);
		if (pList.size() < 1) {//没有记录或者能匹配到多个记录,都要求重新登陆
			getMapValue().put("msg", "用户不存在:");
			return ERROR;
		}
		setPerson(pList.get(0));
		return SUCCESS;
	}
	
	public String register() {
		setMapValue(new HashMap<String, Object>());
		if (StringUtils.isBlank(getPerson().getPassword())) {
			getMapValue().put("msg", "密码不能为空");
			return ERROR;
		}
		if (StringUtils.isBlank(getPerson().getUsername())) {
			getMapValue().put("msg", "用户不能为空");
			return ERROR;
		}
		if (!getPerson().getPassword().equals(getPerson().getRepassword())) {
			getMapValue().put("msg", "两次密码不一致");
			return ERROR;
		}
		Person p = new Person();
		p.setUsername(getPerson().getUsername());
		List<Person> pList = personService.findAllByPerson(p);
		if (pList.size() >= 1) {//没有记录或者能匹配到多个记录,都要求重新登陆
			getMapValue().put("msg", "该用户已经存在:" + getPerson().getUsername());
			return ERROR;
		}
		p.setPassword(EncryptRef.SHA1(getPerson().getPassword()));
		p.setUserLevel("C");
		p = personService.save(p);
		getMapValue().put("msg", "注册成功");
		getMapValue().put("user", p);
		return SUCCESS;
	}
	
	public String update() {
		if (StringUtils.isBlank(getPerson().getPassword())) {
			getMapValue().put("msg", "密码不能为空");
			return ERROR;
		}
		if (StringUtils.isBlank(getPerson().getUsername())) {
			getMapValue().put("msg", "用户不能为空");
			return ERROR;
		}
		if (!getPerson().getPassword().equals(getPerson().getRepassword())) {
			getMapValue().put("msg", "两次密码不一致");
			return ERROR;
		}
		Person p = new Person();
		p.setUsername(getPerson().getUsername());
		List<Person> pList = personService.findAllByPerson(p);
		if (pList.size() < 1) {//没有记录或者能匹配到多个记录,都要求重新登陆
			getMapValue().put("msg", "该用户不存在:" + getPerson().getUsername());
			return ERROR;
		}
//		BeanUtils.copyProperties(dest, orig);
		Person up = pList.get(0);
		up.setPassword(EncryptRef.SHA1(getPerson().getPassword()));
		up.setCellphone(getPerson().getCellphone());
		up.setContactor(getPerson().getContactor());
		up.setQq(getPerson().getQq());
		up.setEmail(getPerson().getEmail());
//		up.setAddress(getPerson().getAddress());
		p = personService.update(up);
		getMapValue().put("msg", "用户更新成功");
		getMapValue().put("user", p);
		return SUCCESS;
	}
	
	protected void writer(HttpServletResponse response, String message) {
		try {
			response.getWriter().write(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} 

}
