package com.fzy.core.entity;

import java.util.ArrayList;
import java.util.List;

public class ViewList {
	List result;
	List orders;
	Page page;
	
	public ViewList() {
		result = new ArrayList();
		orders = new ArrayList();
		page = new Page();
	}
	public List getResult() {
		return result;
	}
	public void setResult(List result) {
		this.result = result;
	}
	public List getOrders() {
		return orders;
	}
	public void setOrders(List orders) {
		this.orders = orders;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
}
