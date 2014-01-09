package com.xone.action.filters;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xone.action.base.Action;
import com.xone.action.base.IdentifyCode;

public class PrepareHandlerFilter implements Filter {
	
	static final Log logger = LogFactory.getLog(PrepareHandlerFilter.class);

//	protected FilterConfig config;
//	protected String agent;
	protected List<String> urls = new ArrayList<String>();
	protected boolean isprd = true;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
//		this.config = filterConfig;
//		agent = config.getInitParameter("agent");
//		urls.add("/login/index.html");
//		urls.add("/login/login.html");
//		urls.add("/login/logout.html");
//		urls.add("/login/register.html");
//		urls.add("/login/indexRegister.html");
//		urls.add("/purchase/index.html");
//		urls.add("/purchase/listItems.html");
//		urls.add("/purchase/item.html");
//		urls.add("/purchase/listOverheadItems.html");
//		urls.add("/product/index.html");
//		urls.add("/product/listSales.html");
//		urls.add("/product/listGroups.html");
//		urls.add("/product/listItems.html");
//		urls.add("/product/listProduct.html");
//		urls.add("/product/item.html");
//		urls.add("/product/listOverheadItems.html");
//		urls.add("/assistant/index.html");
//		urls.add("/assistant/image.html");
//		urls.add("/assistant/companyInfo.html");
//		urls.add("/assistant/subscribe.html");
//		urls.add("/assistant/redirect.html");
//		urls.add("/assistant/guide.html");
//		urls.add("/adbanner/index.html");
		String fileName = filterConfig.getInitParameter("configFile");
		InputStream input = filterConfig.getServletContext().getResourceAsStream(fileName);
		if (null != input) {
			try {
				BufferedReader reader = new BufferedReader(new InputStreamReader(input));
				String line = null;
				urls.clear();
				while ((line = reader.readLine()) != null) {
					urls.add(line);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String debug = System.getProperty("debugapp");
		isprd = (null == debug || !"true".equals(debug));
	}
	
	public String getClientIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		resp.setHeader("Access-Control-Allow-Origin", "*");
		String ip = getClientIpAddr(req);
		logger.info("=====> Request Address IP:" + ip + ", URI:" + req.getRequestURI());
		if (isprd) {
			String userAgent = req.getHeader("User-Agent");
			logger.debug("=====> UserAgent:" + userAgent + "=====> Request URL:" + req.getRequestURL());
			if (null != userAgent && userAgent.endsWith("ZHANGCHANG.CO.,LTD.")) {
				if (!isMyRulePass(req, resp)) {
					resp.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
					resp.sendRedirect(req.getContextPath() + "/assistant/redirect.html");
					return;
				}
				chain.doFilter(request, response);
				return;
			} else {
				resp = (HttpServletResponse)response;
				resp.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
				return;
			}
		}
		if (!isMyRulePass(req, resp)) {
			resp.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
			resp.setHeader("login", "false");//需要登录
			//取请求头部的信息
			//返回的值应该是XMLHttpRequest,代表是异步请求发送过来的请求
			//需要处理异步登录发送过来的请求，如果没有登录，则需要返回状态码，要求重新登录，代码待处理
			//此处还需要优化为：
			//1. 从Header中取得移动设备的标识
			//2. Set-Cookie的标识判断是否要放到Header中去
			if ("appjson".equalsIgnoreCase(req.getHeader("X-Requested-With"))) {
				String identifyCode = new IdentifyCode().randomGenerator(6);
				req.getSession().setAttribute("IDENTIFY_CODE_KEY", identifyCode);
				resp.setHeader("ID-Code", identifyCode);//验证码传递
			} else {
				resp.sendRedirect(req.getContextPath() + "/assistant/redirect.html");
			}
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}
	
	@SuppressWarnings("unchecked")
	protected boolean isMyRulePass(HttpServletRequest request, HttpServletResponse response) {
		String uri = request.getRequestURI();
		uri = uri.replaceFirst(request.getContextPath(), "");
		if (urls.contains(uri)) {
			return true;
		}
		Object object = request.getSession().getAttribute(Action.USER);
		if (null == object) {
			return false;
		}
		Map<String, String> userMap = (Map<String, String>)object;
		if (null != userMap && !StringUtils.isBlank(userMap.get("id"))) {
			return true;
		}
		return false;
	}

}
