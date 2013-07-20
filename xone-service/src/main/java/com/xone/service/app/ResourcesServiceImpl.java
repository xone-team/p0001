package com.xone.service.app;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ResourcesDao;
import com.xone.model.hibernate.entity.Resources;

public class ResourcesServiceImpl implements ResourcesService {

	@Autowired
	protected ResourcesDao resourcesDao;

	@Override
	public Resources save(Resources entity) {
		return getResourcesDao().save(entity);
	}

	@Override
	public Resources findById(Long id) {
		return getResourcesDao().findById(id);
	}

	@Override
	public List<Resources> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Resources.class);
		return getResourcesDao().findListByDetachedCriteria(detachedCriteria,
				0, 10);
	}

	public ResourcesDao getResourcesDao() {
		return resourcesDao;
	}

	public void setResourcesDao(ResourcesDao resourcesDao) {
		this.resourcesDao = resourcesDao;
	}
	
}