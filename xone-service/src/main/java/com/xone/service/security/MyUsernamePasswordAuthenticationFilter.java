package com.xone.service.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

public class MyUsernamePasswordAuthenticationFilter extends
		UsernamePasswordAuthenticationFilter {
	public static final String VALIDATE_CODE = "validateCode";
	public static final String VALIDATE_CODE_SERVER = "IDENTIFY_CODE_KEY";
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";

//	@Autowired
//	private PersonService personService;

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request,
			HttpServletResponse response) throws AuthenticationException {
		if (!request.getMethod().equals("POST")) {
			throw new AuthenticationServiceException(
					"Authentication method not supported: "
							+ request.getMethod());
		}
		// 检测验证码
		checkValidateCode(request);

		String username = obtainUsername(request);
		String password = obtainPassword(request);
		if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
			request.setAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, "用户名或者密码输入不正确！");
			throw new AuthenticationServiceException("用户名或者密码输入不正确！");
		}

		// 验证用户账号与密码是否对应
		username = username.trim();
//		Map<String, String> params = new HashMap<String, String>();
//		params.put("username", username);
//		Person person = getPersonService().findByMap(params);
//
//		if (person == null) {
			/*
			 * 在我们配置的simpleUrlAuthenticationFailureHandler处理登录失败的处理类在这么一段
			 * 这样我们可以在登录失败后，向用户提供相应的信息。 if (forwardToDestination) {
			 * request.setAttribute(WebAttributes.AUTHENTICATION_EXCEPTION,
			 * exception); } else { HttpSession session =
			 * request.getSession(false);
			 * 
			 * if (session != null || allowSessionCreation) {
			 * request.getSession(
			 * ).setAttribute(WebAttributes.AUTHENTICATION_EXCEPTION,
			 * exception); } }
			 */
//			if (getFailureHandler().isUseForward()) {
//				request.setAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, "");
//			} else {
//				HttpSession session = request.getSession(false);
//				if (session != null || getAllowSessionCreation()) {
//					request.getSession().setAttribute(
//							WebAttributes.AUTHENTICATION_EXCEPTION, "");
//				}
//			}
//			throw new AuthenticationServiceException("用户名或者密码错误！");
//		}

		// UsernamePasswordAuthenticationToken实现 Authentication
		UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(
				username, password);
		// Place the last username attempted into HttpSession for views

		// 允许子类设置详细属性
		setDetails(request, authRequest);

		// 运行UserDetailsService的loadUserByUsername 再次封装Authentication
		return this.getAuthenticationManager().authenticate(authRequest);
	}

	protected void checkValidateCode(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String sessionValidateCode = obtainSessionValidateCode(session);
		// 让上一次的验证码失效
		session.setAttribute(VALIDATE_CODE, null);
		String validateCodeParameter = obtainValidateCodeParameter(request);
		if (StringUtils.isEmpty(validateCodeParameter)
				|| !sessionValidateCode.equalsIgnoreCase(validateCodeParameter)) {
			throw new AuthenticationServiceException("验证码错误！");
		}
	}

	private String obtainValidateCodeParameter(HttpServletRequest request) {
		Object obj = request.getParameter(VALIDATE_CODE);
		return null == obj ? "" : obj.toString();
	}

	protected String obtainSessionValidateCode(HttpSession session) {
		Object obj = session.getAttribute(VALIDATE_CODE_SERVER);
		return null == obj ? "" : obj.toString();
	}

//	public PersonService getPersonService() {
//		return personService;
//	}
//
//	public void setPersonService(PersonService personService) {
//		this.personService = personService;
//	}

	@Override
	protected String obtainUsername(HttpServletRequest request) {
		Object obj = request.getParameter(USERNAME);
		return null == obj ? "" : obj.toString();
	}

	@Override
	protected String obtainPassword(HttpServletRequest request) {
		Object obj = request.getParameter(PASSWORD);
		return null == obj ? "" : obj.toString();
	}
}
