package com.xone.service.app;

import java.util.Date;

public interface IndexService {
	public Integer getTodoProductCount();

	public Integer getTodoPurchaseCount();
	
	public Integer getTodoDeliveryCount();

	public Integer getAlertAdbanner(Date alertDate);
	
}
