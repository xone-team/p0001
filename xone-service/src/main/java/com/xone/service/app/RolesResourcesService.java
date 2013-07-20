package com.xone.service.app;

import java.util.List;
import java.util.Map;
import com.xone.model.hibernate.entity.RolesResources;

public interface RolesResourcesService {

	public RolesResources save(RolesResources entity);

	public RolesResources findById(Long id);

	public List<RolesResources> findAllByMap(Map<String, String> params);
}