package com.xone.action.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrepareHandlerFilter implements Filter {

	protected FilterConfig config;
	protected String agent;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.config = filterConfig;
		agent = config.getInitParameter("agent");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if ("true".equals(agent)) {
			HttpServletRequest req = (HttpServletRequest)request;
			String userAgent = req.getHeader("User-Agent");
			System.out.println("=========> UserAgent:" + userAgent + " Request URL:" + req.getRequestURL().toString());
			if (null != userAgent && userAgent.endsWith("ZHANGCHANG.CO.,LTD.")) {
				chain.doFilter(request, response);
				return;
			} else {
				HttpServletResponse resp = (HttpServletResponse)response;
				resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
				return;
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}

}
