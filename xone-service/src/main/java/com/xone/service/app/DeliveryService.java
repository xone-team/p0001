package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.support.Pagination;
public interface DeliveryService {
	public Delivery save(Delivery entity);
	
	public Delivery update(Delivery entity);

	public Delivery findById(Long id);
	
	public void delete(Delivery entity);
	
	public List<Delivery> findAllByMap(Map<String, String> params);
	
	public Delivery findByMap(Map<String, String> params);

	public Pagination findByParams(Map<String, String> params);

}
