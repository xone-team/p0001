package com.xone.action.app.adbanner;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.service.app.AdbannerService;

public class AdBannerAction extends Action {
	
	private static final long serialVersionUID = -2554675564068314137L;
	
	@Autowired
	protected AdbannerService adbannerService;
	
	protected List<Adbanner> list = new ArrayList<Adbanner>();

	public String index() {
		Map<String, String> params = getRequestMap();
		List<Adbanner> l = adbannerService.findAllByMap(params);
		if (null != l && !l.isEmpty()) {
			getList().addAll(l);
		}
		return SUCCESS;
	}
	
	public String list() {
		Map<String, String> params = getRequestMap();
		System.err.println("AdBanner params:" + params);
		return SUCCESS;
	}

	public List<Adbanner> getList() {
		return list;
	}

	public void setList(List<Adbanner> list) {
		this.list = list;
	}

	public AdbannerService getAdbannerService() {
		return adbannerService;
	}

	public void setAdbannerService(AdbannerService adbannerService) {
		this.adbannerService = adbannerService;
	}

}
