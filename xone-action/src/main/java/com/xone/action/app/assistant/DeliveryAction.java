package com.xone.action.app.assistant;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.DeliveryService;

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
	
	public String create() {
		setDelivery(deliveryService.save(getDelivery()));
		return SUCCESS;
	}
	
	public String listIndex() {
		return SUCCESS;
	}
	
	public String listItems() {
		Map<String, String> map = getRequestMap();
		Map<String, String> params = new HashMap<String, String>();
		if ("down".equals(map.get("itemaction"))) {
			params.put("gtDateCreated", MyDateUtils.format(getDelivery().getDateCreated()));
		} else if ("up".equals(map.get("itemaction"))) {
			params.put("ltDateCreated", MyDateUtils.format(getDelivery().getDateCreated()));
		}
		setList(deliveryService.findAllByMap(params));
		return SUCCESS;
	}
	
	public String itemDetails() {
		Map<String, String> map = getRequestMap();
		String id = map.get("id");
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		setDelivery(deliveryService.findByMap(params));
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
