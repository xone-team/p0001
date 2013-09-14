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

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		if (isprd) {
			String userAgent = req.getHeader("User-Agent");
			logger.debug("=====> UserAgent:" + userAgent);
			logger.debug("=====> Request URL:" + req.getRequestURL());
			logger.debug("=====> Request URI:" + req.getRequestURI());
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
				resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
				return;
			}
		}
		if (!isMyRulePass(req, resp)) {
			resp.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
			resp.sendRedirect(req.getContextPath() + "/assistant/redirect.html");
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
