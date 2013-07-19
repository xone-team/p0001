package com.xone.action.web.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.opensymphony.xwork2.ActionContext;
import com.xone.action.base.Action;

public class LoginWebAction extends Action {
	
	private static final long serialVersionUID = 2316404862441984223L;
	private String error;
	private String lastname;
	private String message;
	private String name;

	public String login() throws Exception {
		Map<String, ?> session = ActionContext.getContext().getSession();
		this.lastname = (String) session.get("SPRING_SECURITY_LAST_USERNAME");
		try {
			Exception e = (Exception) session
					.get("SPRING_SECURITY_LAST_EXCEPTION");
			this.message = e.getMessage();
		} catch (Exception e) {
		}

		if (this.message == null && this.lastname != null) {
			return SUCCESS;
		} else {
			if (this.message != null) {
				session.put("SPRING_SECURITY_LAST_EXCEPTION", null);
			}
			return INPUT;
		}

	}
	
	public String welcome() throws Exception {
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		HttpServletRequest request = ServletActionContext.getRequest();  
        this.setName(request.getUserPrincipal().getName());  
        this.setMessage("Successful Struts spring secuirty authentication"); 
		return SUCCESS;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 *            the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @return the error
	 */
	public String getError() {
		return error;
	}

	/**
	 * @param error
	 *            the error to set
	 */
	public void setError(String error) {
		this.error = error;
	}

	/**
	 * @return the lastname
	 */
	public String getLastname() {
		return lastname;
	}

	/**
	 * @param lastname
	 *            the lastname to set
	 */
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
