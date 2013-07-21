package com.xone.action.web.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.service.app.PurchaseService;

public class PurchaseWebAction extends Action {

	private static final long serialVersionUID = -4877998730097178103L;
	
	@Autowired
	protected PurchaseService purchaseService;
	protected List<Purchase> list = new ArrayList<Purchase>();
	
	public String list() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		List<Purchase> l = getPurchaseService().findAllByMap(params);
		if (null != l && !l.isEmpty()) {
			getList().addAll(l);
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

}
