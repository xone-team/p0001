package com.xone.action.back.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.PurchaseService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class PurchaseBackAction extends Action {
	
	@Autowired
	protected PurchaseService purchaseService;
	protected Purchase purchase = new Purchase();
	protected List<Purchase> list = new ArrayList<Purchase>();
	protected Pagination pagination = new Pagination();
	
	public String purchaseList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getPurchaseService().findByParams(params);
//		List<Purchase> l = getPurchaseService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
	public String purchaseItem() throws Exception {
		Purchase entity = getPurchaseService().findById(getPurchase().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setPurchase(entity);
		return SUCCESS;
	}
	
	public String purchaseCreate() throws Exception {
		return SUCCESS;
	}
	
	public String purchaseEdit() throws Exception {
		Purchase entity = getPurchaseService().findById(getPurchase().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setPurchase(entity);
		return SUCCESS;
	}
	
	public String purchaseSave() throws Exception {
		setPurchase(getPurchaseService().save(getPurchase()));
		return SUCCESS;
	}
	
	public String purchaseUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			Purchase entity = getPurchaseService().findById(getPurchase().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getPurchaseService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			Purchase entity = getPurchaseService().findById(getPurchase().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getPurchase(), entity, Purchase.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			setPurchase(getPurchaseService().update(entity));
		}
		return SUCCESS;
	}

	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}

	public List<Purchase> getList() {
		return list;
	}

	public void setList(List<Purchase> list) {
		this.list = list;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
