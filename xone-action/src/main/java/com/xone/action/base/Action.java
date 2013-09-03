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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.xone.model.persistence.Pager;
import com.xone.model.utils.ConfigUtils;
import com.xone.model.utils.MyDateUtils;

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
	public static final String USER = "com.xone.user";
	protected static Log log = LogFactory.getLog(Action.class);
	
	protected HttpServletResponse response;
	protected HttpServletRequest request;
	
	private List<Map<String, Object>> items = new ArrayList<Map<String, Object>>();
	
	private Map<String, Object> mapValue = new HashMap<String, Object>();
	
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
	
	public final String getStaticRoot() {
		return (String)request.getAttribute("STATIC_ROOT");
	}
	
	public HttpSession getSession() {
		return request.getSession();
	}

	/**
	 * @return the userMap
	 */
	@SuppressWarnings("unchecked")
	public final Map<String, String> getUserMap() {
		Object object = getSession().getAttribute(USER);
		if (null == object) {
			return Collections.emptyMap();
		}
		return (Map<String, String>)object;
	}
	
	public final Long getUserId() {
		try {
			return Long.parseLong(getUserMap().get("id"));
		} catch (Exception e) {}
		return 0l;
	}
	
	public final String getUserIdString() {
		return getUserMap().get("id");
	}
	
	public final String getUsername() {
		return getUserMap().get("username");
	}
	
	public final String getUniqueId() {
		return getRandomChar() + UUID.randomUUID().toString().toUpperCase().replaceAll("-", String.valueOf(getRandomChar())) + MyDateUtils.format(new Date(), "yyyyMMddHHmmssS");
	}
	
	public final char getRandomChar() {
		return (char)(65 + new Random().nextInt(26));
	}
	
	@SuppressWarnings("unchecked")
	public final Map<String, String> getRequestMap() {
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
	public final List<Map<String, Object>> getItems() {
		return items;
	}

	/**
	 * @param items the items to set
	 */
	public final void setItems(List<Map<String, Object>> items) {
		this.items = items;
	}
	
	/**
	 * @return the pager
	 */
	public final Pager getPager() {
		return pager;
	}

	/**
	 * @param pager the pager to set
	 */
	public final void setPager(Pager pager) {
		this.pager = pager;
	}
	
	public final void writeMessage(String message) {
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
	public final Map<String, Object> getMapValue() {
		return mapValue;
	}

	/**
	 * @param mapValue the mapValue to set
	 */
	public final void setMapValue(Map<String, Object> mapValue) {
		this.mapValue = mapValue;
	}
	
	public final long getIdentify() {
		return System.currentTimeMillis();
	}
	
	/**
	 * 是不是推荐支持的浏览器
	 * @return
	 */
	public final boolean isSupportBrowser() {
		Map<String, String> binfo = getBrowserInfo();
		if ("Chrome".equalsIgnoreCase(binfo.get("name"))
				|| "Firefox".equalsIgnoreCase(binfo.get("name"))
				|| "Opera".equalsIgnoreCase(binfo.get("name"))
				|| "Safari".equalsIgnoreCase(binfo.get("name"))) {
			return true;
		}
		return false;
	}
	
	/**
	 * 取得浏览器访问的类型与版本
	 * @return
	 */
	public final Map<String, String> getBrowserInfo() {
		String browserInfo = request.getHeader("User-Agent");
		String browserName = "";
		String browserVersion = "";
		String info[] = null;
		if (browserInfo.contains("MSIE")) {
			String substring = browserInfo.substring(browserInfo.indexOf("MSIE"));
			info = (substring.split(";")[0]).split(" ");
		} else if (browserInfo.contains("Firefox")) {
			String substring = browserInfo.substring(browserInfo.indexOf("Firefox"));
			info = (substring.split(" ")[0]).split("/");
		} else if (browserInfo.contains("Chrome")) {
			String substring = browserInfo.substring(browserInfo.indexOf("Chrome"));
			info = (substring.split(" ")[0]).split("/");
		} else if (browserInfo.contains("Opera")) {
			String substring = browserInfo.substring(browserInfo.indexOf("Opera"));
			info = (substring.split(" ")[0]).split("/");
		} else if (browserInfo.contains("Safari")) {
			String substring = browserInfo.substring(browserInfo.indexOf("Safari"));
			info = (substring.split(" ")[0]).split("/");
		}
		Map<String, String> map = new HashMap<String, String>();
		if (null != info && info.length >= 2) {
			browserName = info[0];
			browserVersion = info[1];
			map.put("name", browserName);
			map.put("version", browserVersion);
		}
		map.put("info", browserInfo);
		return map;
	}
	
}
