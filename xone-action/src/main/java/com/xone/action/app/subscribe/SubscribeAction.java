package com.xone.action.app.subscribe;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.SubscribeService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

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
		getSubscribe().setUserCreated(getUserId());
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
			params.put("gtDateCreated", MyDateUtils.format(getSubscribe().getDateCreated()));
		} else if ("up".equals(map.get("itemaction"))) {
			params.put("ltDateCreated", MyDateUtils.format(getSubscribe().getDateCreated()));
		}
		params.put("refId", getUserId().toString());
		params.put("userCreated", String.valueOf(getUserId()));
		setList(getSubscribeService().findAllByMap(params));
		return SUCCESS;
	}
	
	public String update() {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		if (!StringUtils.isBlank(getRequestMap().get("delete"))) {
			Subscribe entity = getSubscribeService().findById(getSubscribe().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			if (!getUserId().equals(entity.getUserCreated())) {//状态为已经交易状态的不可以删除
				return ERROR;
			}
			getSubscribeService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(getRequestMap().get("update"))) {
			Subscribe entity = getSubscribeService().findById(getSubscribe().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			if (!(getUserId().equals(entity.getUserCreated()))) {//状态为已经交易状态的不可以编辑
				return ERROR;
			}
			MyBeanUtils.copyProperties(getSubscribe(), entity, Subscribe.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			setSubscribe(getSubscribeService().update(entity));
		}
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
