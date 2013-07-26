package com.xone.service.app;

import java.util.List;
import java.util.Map;
import com.xone.model.hibernate.entity.RolesResources;
import com.xone.model.hibernate.support.Pagination;
public interface RolesResourcesService {

	public RolesResources save(RolesResources entity);
	
	public RolesResources update(RolesResources entity);

	public RolesResources findById(Long id);
	
	public void delete(RolesResources entity);

	public List<RolesResources> findAllByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
}