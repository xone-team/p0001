package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.support.Pagination;
public interface AdbannerService {

	public Adbanner save(Adbanner entity);
	
	public Adbanner save(Adbanner entity, ImageUploaded imageUploaded);
	
	public Adbanner update(Adbanner entity);
	
	public Adbanner update(Adbanner entity, ImageUploaded imageUploaded, Long imageId);
	
	public Adbanner findById(Long id);
	
	public void delete(Adbanner entity);
	public List<Adbanner> findAllByMap(Map<String, String> params);
	
	public List<Adbanner> findItemsByMap(Map<String, String> params);

	public Pagination findByParams(Map<String, String> params);
}