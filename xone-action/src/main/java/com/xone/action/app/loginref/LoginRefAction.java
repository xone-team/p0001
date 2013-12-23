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
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.IdentifyCodeServlet;
import com.xone.action.base.LogicAction;
import com.xone.action.utils.Shared;
import com.xone.model.hibernate.entity.LoginLog;
import com.xone.model.hibernate.entity.Person;
import com.xone.service.app.LoginLogService;
import com.xone.service.app.PersonService;
import com.xone.service.app.utils.EncryptRef;


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
public class LoginRefAction extends LogicAction {
	
	private static final long serialVersionUID = -6619796711772558844L;
	
	private String redirect;
	protected Person person;
	protected String actionName;
	protected String namespace;
	
	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}
	
	public String getNamespace() {
		return namespace;
	}

	public void setNamespace(String namespace) {
		this.namespace = namespace;
	}

	@Autowired
	private PersonService personService;
	
	@Autowired
	private LoginLogService loginLogService;

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
			setActionName("main");
			setNamespace("login");
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
			setActionName("index");
			setNamespace("login");
			return "redirect";
		}
		return SUCCESS;
	}
	
	private boolean doLogin() {
		String msg = "用户不存在或者密码不正确。";
		String code = getRequest().getParameter("identifyCode");
		if (StringUtils.isBlank(code)) {
			getMapValue().put("msg", "请输入验证码");
			return false;
		}
		String scode = (String)getRequest().getSession().getAttribute(IdentifyCodeServlet.IDENTIFY_CODE_KEY);
		if (!code.equalsIgnoreCase(scode)) {
			getMapValue().put("msg", "验证码不正确");
			return false;
		}
		Person p = new Person();
		p.setUsername(getPerson().getUsername());
		List<Person> pList = getPersonService().findAllByPerson(p);
		if (pList.size() > 1 || pList.size() <= 0) {//没有记录或者能匹配到多个记录,都要求重新登陆
			getMapValue().put("msg", msg);
			return false;
		}
		p = pList.get(0);
		if (EncryptRef.SHA1(getPerson().getPassword()).equals(p.getPassword())) {
			LoginLog loginLog = new LoginLog();
			loginLog.setUserId(p.getId());
			loginLog.setIp(Shared.getClientIpAddr(getRequest()));
			loginLog.setUserAgent(getRequest().getHeader("User-Agent"));
			loginLog.setCategory(LoginLog.LoginCatetory.MOBILE.getValue());
			if (loginUser(p)) {
				Map<String, String> params = getRequestMap();
				p.setUserUpdated(p.getId());
				p.setLastMacUpdated(params.get("_m"));
				loginLog.setMac(p.getLastMacUpdated());
				getPersonService().update(p);
			}
			getLoginLogService().save(loginLog);
		} else {
			getMapValue().put("msg", msg);
			return false;
		}
		return true;
	}
	
	public String loginjson() {
		if (doLogin()) {
			
		}
		return SUCCESS;
	}
	
	public String login() {
		setActionName("index");
		setNamespace("login");
		String loginHtml = "login/index.html";
		if (null == getPerson() || null == getPerson().getUsername() || null == getPerson().getPassword()) {
			if (StringUtils.isBlank(getRedirect())) {
				setRedirect(loginHtml);
			}
			return SUCCESS;
		}
		if (!getUserMap().isEmpty() && null != getUserMap().get("user")) {
			setRedirect("login/main.html");
			setActionName("main");
			setNamespace("login");
			return SUCCESS;
		}
		if (!doLogin()) {
			return ERROR;
		}
		setRedirect("login/main.html");
		setActionName("main");
		setNamespace("login");
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
		/**
		 * 密码加密已经在service中完成
		 */
//		p.setPassword(EncryptRef.SHA1(getPerson().getPassword()));
		p.setPassword(getPerson().getPassword());
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
		/**
		 * 密码加密已经在service中完成
		 */
//		up.setPassword(EncryptRef.SHA1(getPerson().getPassword()));
		up.setPassword(getPerson().getPassword());
		up.setRepassword(getPerson().getRepassword());
		up.setNickName(getPerson().getNickName());
		up.setCellphone(getPerson().getCellphone());
		up.setContactor(getPerson().getContactor());
		up.setQq(getPerson().getQq());
		up.setEmail(getPerson().getEmail());
		up.setAddress(getPerson().getAddress());
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

	public LoginLogService getLoginLogService() {
		return loginLogService;
	}

	public void setLoginLogService(LoginLogService loginLogService) {
		this.loginLogService = loginLogService;
	} 

}
