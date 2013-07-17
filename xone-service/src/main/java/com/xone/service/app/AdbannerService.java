package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Adbanner;

public interface AdbannerService {

	public Adbanner save(Adbanner entity);

	public Adbanner findById(Long id);
	
	public List<Adbanner> findAllByMap(Map<String, String> params);
	
	public List<Adbanner> findItemsByMap(Map<String, String> params);
}