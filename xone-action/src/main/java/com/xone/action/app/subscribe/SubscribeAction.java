package com.xone.action.app.subscribe;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.utils.DateUtils;
import com.xone.service.app.SubscribeService;

public class SubscribeAction extends Action {

	private static final long serialVersionUID = 5598354233973203661L;

	@Autowired
	protected SubscribeService subscribeService;
	
	protected Subscribe subscribe = new Subscribe();
	protected List<Subscribe> list = new ArrayList<Subscribe>();
	
	public String add() {
		return SUCCESS;
	}
	
	public String list() {
		return SUCCESS;
	}
	
	public String create() {
		getSubscribe().setRefId(getUserId());
		setSubscribe(getSubscribeService().save(getSubscribe()));
		return SUCCESS;
	}
	
	public String item() {
		setSubscribe(getSubscribeService().findById(getSubscribe().getId()));
		return SUCCESS;
	}
	
	public String items() {
		Map<String, String> map = getRequestMap();
		Map<String, String> params = new HashMap<String, String>();
		if ("down".equals(map.get("itemaction"))) {
			params.put("gtDateCreated", DateUtils.format(getSubscribe().getDateCreated()));
		} else if ("up".equals(map.get("itemaction"))) {
			params.put("ltDateCreated", DateUtils.format(getSubscribe().getDateCreated()));
		}
		params.put("refId", getUserId().toString());
		setList(getSubscribeService().findAllByMap(params));
		return SUCCESS;
	}

	public List<Subscribe> getList() {
		return list;
	}

	public void setList(List<Subscribe> list) {
		this.list = list;
	}

	public Subscribe getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(Subscribe subscribe) {
		this.subscribe = subscribe;
	}

	public SubscribeService getSubscribeService() {
		return subscribeService;
	}

	public void setSubscribeService(SubscribeService subscribeService) {
		this.subscribeService = subscribeService;
	}
	
}
