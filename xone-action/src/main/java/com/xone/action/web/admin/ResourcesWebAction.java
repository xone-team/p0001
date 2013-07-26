package com.xone.action.web.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Resources;
import com.xone.service.app.ResourcesService;

public class ResourcesWebAction extends Action {
	
	private static final long serialVersionUID = 5350031325136827957L;
	
	@Autowired
	protected ResourcesService resourcesService;
	
	protected List<Resources> list = new ArrayList<Resources>();
	
	public String resourcesList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		List<Resources> l = getResourcesService().findAllByMap(params);
		if (null != l && !l.isEmpty()) {
			getList().addAll(l);
		}
		return SUCCESS;
	}

	public ResourcesService getResourcesService() {
		return resourcesService;
	}

	public void setResourcesService(ResourcesService resourcesService) {
		this.resourcesService = resourcesService;
	}

	public List<Resources> getList() {
		return list;
	}

	public void setList(List<Resources> list) {
		this.list = list;
	}
	
	
}
