package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Delivery;

public interface DeliveryService {
	
	public Delivery save(Delivery delivery);
	
	public List<Delivery> findAllByMap(Map<String, String> params);
	
	public Delivery findByMap(Map<String, String> params);

}
