package com.xone.action.web.subscribe;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.SubscribeService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class SubscribeWebAction extends Action {
	
	@Autowired
	protected SubscribeService subscribeService;
	protected Subscribe subscribe = new Subscribe();
	protected List<Subscribe> list = new ArrayList<Subscribe>();
	protected Pagination pagination = new Pagination();
	
	public String subscribeList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getSubscribeService().findByParams(params);
//		List<Subscribe> l = getSubscribeService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
	public String subscribeItem() throws Exception {
		Subscribe entity = getSubscribeService().findById(getSubscribe().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setSubscribe(entity);
		return SUCCESS;
	}
	
	public String subscribeCreate() throws Exception {
		return SUCCESS;
	}
	
	public String subscribeEdit() throws Exception {
		Subscribe entity = getSubscribeService().findById(getSubscribe().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setSubscribe(entity);
		return SUCCESS;
	}
	
	public String subscribeSave() throws Exception {
		setSubscribe(getSubscribeService().save(getSubscribe()));
		return SUCCESS;
	}
	
	public String subscribeUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			Subscribe entity = getSubscribeService().findById(getSubscribe().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getSubscribeService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			Subscribe entity = getSubscribeService().findById(getSubscribe().getId());
			if (null == entity || null == entity.getId()) {
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

	public SubscribeService getSubscribeService() {
		return subscribeService;
	}

	public void setSubscribeService(SubscribeService subscribeService) {
		this.subscribeService = subscribeService;
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
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
