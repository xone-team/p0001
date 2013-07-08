package com.xone.action.app.product;

import java.util.Date;

import com.xone.action.base.Action;

public class ProductAction extends Action {
	
	public String productName;
	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String listAll() {
		return SUCCESS;
	}
	
	/**
	 * 手机上滑动更多
	 * @return
	 */
	public String listMobileMore() {
		setProductName("" + new Date().getTime());
		return SUCCESS;
	}
	
	public String listSales() {
		return SUCCESS;
	}
	public String listGroups() {
		return SUCCESS;
	}

}
