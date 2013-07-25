package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Config;
import com.xone.model.hibernate.support.Pagination;
public interface ConfigService {
	public Config save(Config entity);
	
	public Config update(Config entity);

	public Config findById(Long id);
	
	public void delete(Config entity);
	
	public List<Config> findAllByMap(Map<String, String> params);
	
	public Config findByMap(Map<String, String> params);

	public Pagination findByParams(Map<String, String> params);

}
