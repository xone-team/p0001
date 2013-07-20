package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Resources;
import com.xone.model.hibernate.entity.Roles;

public interface ResourcesService {

	public Resources save(Resources entity);

	public Resources findById(Long id);

	public List<Resources> findAllByMap(Map<String, String> params);
	
	public Map<Resources, List<Roles>> findMapByParams(Map<String, String> params);
}
