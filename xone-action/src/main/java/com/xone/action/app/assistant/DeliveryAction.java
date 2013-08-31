package com.xone.action.app.assistant;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.DeliveryService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class DeliveryAction extends Action {
	
	private static final long serialVersionUID = -5902592774553044445L;
	public Logger logger = Logger.getLogger(getClass());
	
	protected List<Delivery> list = new ArrayList<Delivery>();
	protected Delivery delivery;
	
	@Autowired
	protected DeliveryService deliveryService;
	
	public String index() {
		return SUCCESS;
	}
	
	public String edit() {
		return SUCCESS;
	}
	
	public String create() {
		Date loadtime = MyDateUtils.parseDate(getRequestMap().get("delivery.loadtime"), "yyyy-MM-dd HH:mm");
		if (null != loadtime) {
			getDelivery().setLoadtime(loadtime);
		}
		getDelivery().setUserCreated(getUserId());
		setDelivery(deliveryService.save(getDelivery()));
		return SUCCESS;
	}
	
	public String listIndex() {
		return SUCCESS;
	}
	
	public String listItems() {
		Map<String, String> map = getRequestMap();
		Map<String, String> params = new HashMap<String, String>();
		if (null != getDelivery() && null != getDelivery().getDateCreated()) {
			if ("down".equals(map.get("itemaction"))) {
				params.put("gtDateCreated", MyDateUtils.format(getDelivery().getDateCreated()));
			} else if ("up".equals(map.get("itemaction"))) {
				params.put("ltDateCreated", MyDateUtils.format(getDelivery().getDateCreated()));
			}
		}
		params.put("userCreated", String.valueOf(getUserId()));
		setList(deliveryService.findAllByMap(params));
		return SUCCESS;
	}
	
	public String itemDetails() {
		Map<String, String> map = getRequestMap();
		String id = map.get("id");
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
//		if (null != getUserId()) {
//			params.put("userCreated", String.valueOf(getUserId()));
//		}
		setDelivery(deliveryService.findByMap(params));
		return SUCCESS;
	}
	
	public String update() {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		if (!StringUtils.isBlank(getRequestMap().get("delete"))) {
			Delivery entity = getDeliveryService().findById(getDelivery().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			if (Delivery.FlagPass.TRADED.getValue().equals(entity.getFlagPass()) || !getUserId().equals(entity.getUserCreated())) {//状态为已经交易状态的不可以删除
				return ERROR;
			}
			getDeliveryService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(getRequestMap().get("update"))) {
			Delivery entity = getDeliveryService().findById(getDelivery().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			if (Delivery.FlagPass.TRADED.getValue().equals(entity.getFlagPass()) || !(getUserId().equals(entity.getUserCreated()))) {//状态为已经交易状态的不可以编辑
				return ERROR;
			}
			Date loadtime = MyDateUtils.parseDate(getRequestMap().get("delivery.loadtime"), "yyyy-MM-dd HH:mm");
			if (null != loadtime) {
				getDelivery().setLoadtime(loadtime);
			}
			MyBeanUtils.copyProperties(getDelivery(), entity, Delivery.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			setDelivery(getDeliveryService().update(entity));
		}
		return SUCCESS;
	}
	
	public String itemPage() {
		return SUCCESS;
	}
	
	public List<Delivery> getList() {
		return list;
	}

	public void setList(List<Delivery> list) {
		this.list = list;
	}

	public DeliveryService getDeliveryService() {
		return deliveryService;
	}

	public void setDeliveryService(DeliveryService deliveryService) {
		this.deliveryService = deliveryService;
	}

	public Delivery getDelivery() {
		return delivery;
	}

	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}
	
}
