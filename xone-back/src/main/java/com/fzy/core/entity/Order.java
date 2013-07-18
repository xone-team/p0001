package com.fzy.core.entity;

public class Order {
	public static final String ASC = "asc";
	public static final String DESC = "desc";
	public static final String ASC_NULLS_FIRST = "asc_nf";
	public static final String DESC_NULLS_LAST = "desc_nl";
	String orderProperty;
	String orderDirection;
	
	public Order() {
		orderDirection = ASC;
	}
	public String getOrderProperty() {
		return orderProperty;
	}
	public void setOrderProperty(String orderProperty) {
		this.orderProperty = orderProperty;
	}
	public String getOrderDirection() {
		return orderDirection;
	}
	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}
	
}
