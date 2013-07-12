package com.xone.action.app.assistant;

import com.xone.action.base.Action;

public class AssistantAction extends Action {
	
	protected String redirect;

	public String main() {
		if (getUserMap().isEmpty() || null == getUserMap().get("user")) {
			setRedirect("assistant/index.html");
			return "redirect";
		}
		return SUCCESS;
	}

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}
	
}
