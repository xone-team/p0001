package com.xone.service.app;

import java.util.List;
import java.util.Map;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.hibernate.support.Pagination;
public interface SubscribeService {

	public Subscribe save(Subscribe entity);
	
	public Subscribe update(Subscribe entity);

	public Subscribe findById(Long id);
	
	public void delete(Subscribe entity);

	public List<Subscribe> findAllByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
}