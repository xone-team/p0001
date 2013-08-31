/**
 * LoginFilter.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-19
 *
 */
package com.xone.action.filters;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xone.action.base.Action;

/**
 * @TODO 请Hunny添加代码注释 
 *
 * @author Hunny
 * @created 2011-3-19 下午10:00:19
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class LoginFilter implements Filter {

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		String LOGIN_PATH = "/login/index.html";
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		String servletPath = httpServletRequest.getServletPath();
		if (servletPath.endsWith(".html") || servletPath.endsWith(".htm")) {
			HttpServletResponse httpServletResponse = (HttpServletResponse) response;
			String contextPath = httpServletRequest.getContextPath();
			HttpSession sesson = httpServletRequest.getSession();
			Map<String, Object> map = null;
			if (null != sesson) {
				map = (Map<String, Object>)sesson.getAttribute(Action.USER);
			} 
			if (LOGIN_PATH.equals(servletPath)) {
				if (null != map && !map.isEmpty()) {
					httpServletResponse.sendRedirect(contextPath + "/index.html");
					return;
				}
			} else if (!("/login/login.html").equals(servletPath)) {
				if (null == map || map.isEmpty()) {
					httpServletResponse.sendRedirect(contextPath + LOGIN_PATH);
					return;
				}
			}
		}
		chain.doFilter(request, response);
		
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
