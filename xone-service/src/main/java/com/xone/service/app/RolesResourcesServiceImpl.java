package com.xone.service.app;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.RolesResourcesDao;
import com.xone.model.hibernate.entity.RolesResources;

public class RolesResourcesServiceImpl implements RolesResourcesService {

	@Autowired
	protected RolesResourcesDao rolesResourcesDao;

	@Override
	public RolesResources save(RolesResources entity) {
		return getRolesResourcesDao().save(entity);
	}

	@Override
	public RolesResources findById(Long id) {
		return getRolesResourcesDao().findById(id);
	}

	@Override
	public List<RolesResources> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(RolesResources.class);
		return getRolesResourcesDao().findListByDetachedCriteria(
				detachedCriteria, 0, 10);
	}

	public RolesResourcesDao getRolesResourcesDao() {
		return rolesResourcesDao;
	}

	public void setRolesResourcesDao(RolesResourcesDao rolesResourcesDao) {
		this.rolesResourcesDao = rolesResourcesDao;
	}
	
}