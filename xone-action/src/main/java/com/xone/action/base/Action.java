/**
 * Action.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-30
 *
 */
package com.xone.action.base;

import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.xone.model.persistence.Pager;
import com.xone.model.utils.ConfigUtils;

/**
 * @TODO 请Hunny添加代码注释 
 *
 * @author Hunny
 * @created 2011-3-30 下午07:18:16
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class Action extends ActionSupport implements Preparable, ServletRequestAware, ServletResponseAware {

	private static final long serialVersionUID = 911975992713654543L;
	public static final String USER = "com.hunny.user";
	
	protected HttpServletResponse response;
	protected HttpServletRequest request;
	
	private List<Map<String, Object>> items;
	
	private Map<String, Object> mapValue;
	
	protected Pager pager;

	/* (non-Javadoc)
	 * @see org.apache.struts2.interceptor.ServletResponseAware#setServletResponse(javax.servlet.http.HttpServletResponse)
	 */
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	/**
	 * @return the response
	 */
	public HttpServletResponse getResponse() {
		return response;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.interceptor.ServletRequestAware#setServletRequest(javax.servlet.http.HttpServletRequest)
	 */
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	/**
	 * @return the request
	 */
	public HttpServletRequest getRequest() {
		return request;
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.Preparable#prepare()
	 */
	public void prepare() throws Exception {
		String requestURL = request.getRequestURL().toString();
		String contextPath = request.getContextPath();
		int length = requestURL.indexOf(contextPath);
		request.setAttribute("ROOT", requestURL.substring(0, length + contextPath.length()));
		request.setAttribute("HTML_ID", new Date().getTime());
		request.setAttribute("STATIC_ROOT", ConfigUtils.getStaticRoot(requestURL.substring(0, length)));
	}
	
	public HttpSession getSession() {
		return request.getSession();
	}

	/**
	 * @return the userMap
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getUserMap() {
		Object object = getSession().getAttribute(USER);
		if (null == object) {
			return Collections.emptyMap();
		}
		return (Map<String, Object>)object;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, String> getRequestMap() {
		Map<String, String> requestMap = new HashMap<String, String>();
		Map<String, String[]> paramsMap =  getRequest().getParameterMap();
		for (Map.Entry<String, String[]> m : paramsMap.entrySet()) {
			requestMap.put(m.getKey(), m.getValue()[0]);
		}
		return requestMap;
	}
	

	/**
	 * @return the items
	 */
	public List<Map<String, Object>> getItems() {
		return items;
	}

	/**
	 * @param items the items to set
	 */
	public void setItems(List<Map<String, Object>> items) {
		this.items = items;
	}
	
	/**
	 * @return the pager
	 */
	public Pager getPager() {
		return pager;
	}

	/**
	 * @param pager the pager to set
	 */
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
	public void writeMessage(String message) {
		if (null == message) {
			return;
		}
		try {
			this.response.getWriter().write(message);
			this.response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @return the mapValue
	 */
	public Map<String, Object> getMapValue() {
		return mapValue;
	}

	/**
	 * @param mapValue the mapValue to set
	 */
	public void setMapValue(Map<String, Object> mapValue) {
		this.mapValue = mapValue;
	}
	
}
