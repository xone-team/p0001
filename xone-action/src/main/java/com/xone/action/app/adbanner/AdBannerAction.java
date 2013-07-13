package com.xone.action.app.adbanner;

import java.util.Map;

import com.xone.action.base.Action;

public class AdBannerAction extends Action {
	
	private static final long serialVersionUID = -2554675564068314137L;

	public String index() {
		Map<String, String> params = getRequestMap();
		System.err.println("AdBanner params:" + params);
		return SUCCESS;
	}
	
	public String list() {
		Map<String, String> params = getRequestMap();
		System.err.println("AdBanner params:" + params);
		return SUCCESS;
	}

}
