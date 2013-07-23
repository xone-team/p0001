package com.xone.action.back.delivery;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.DeliveryService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class DeliveryBackAction extends Action {
	
	@Autowired
	protected DeliveryService deliveryService;
	protected Delivery delivery = new Delivery();
	protected List<Delivery> list = new ArrayList<Delivery>();
	protected Pagination pagination = new Pagination();
	
	public String deliveryList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getDeliveryService().findByParams(params);
//		List<Delivery> l = getDeliveryService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
	public String deliveryItem() throws Exception {
		Delivery entity = getDeliveryService().findById(getDelivery().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setDelivery(entity);
		return SUCCESS;
	}
	
	public String deliveryCreate() throws Exception {
		return SUCCESS;
	}
	
	public String deliveryEdit() throws Exception {
		Delivery entity = getDeliveryService().findById(getDelivery().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setDelivery(entity);
		return SUCCESS;
	}
	
	public String deliverySave() throws Exception {
		setDelivery(getDeliveryService().save(getDelivery()));
		return SUCCESS;
	}
	
	public String deliveryUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			Delivery entity = getDeliveryService().findById(getDelivery().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getDeliveryService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			Delivery entity = getDeliveryService().findById(getDelivery().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
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

	public DeliveryService getDeliveryService() {
		return deliveryService;
	}

	public void setDeliveryService(DeliveryService deliveryService) {
		this.deliveryService = deliveryService;
	}

	public List<Delivery> getList() {
		return list;
	}

	public void setList(List<Delivery> list) {
		this.list = list;
	}

	public Delivery getDelivery() {
		return delivery;
	}

	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
