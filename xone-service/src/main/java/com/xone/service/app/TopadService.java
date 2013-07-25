package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Topad;
import com.xone.model.hibernate.support.Pagination;
public interface TopadService {
	public Topad save(Topad entity);
	
	public Topad update(Topad entity);

	public Topad findById(Long id);
	
	public void delete(Topad entity);
	
	public List<Topad> findAllByMap(Map<String, String> params);
	
	public Topad findByMap(Map<String, String> params);

	public Pagination findByParams(Map<String, String> params);

}
