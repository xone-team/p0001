package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ResourcesDao;
import com.xone.model.hibernate.app.RolesDao;
import com.xone.model.hibernate.app.RolesResourcesDao;
import com.xone.model.hibernate.entity.Resources;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.entity.RolesResources;
import com.xone.model.hibernate.support.Pagination;

public class ResourcesServiceImpl implements ResourcesService {

	@Autowired
	protected ResourcesDao resourcesDao;
	
	@Autowired
	protected RolesResourcesDao rolesResourcesDao;
	
	@Autowired
	protected RolesDao rolesDao;

	@Override
	public Resources save(Resources entity) {
		return getResourcesDao().save(entity);
	}
	
	@Override
	public Resources update(Resources entity) {
		return getResourcesDao().update(entity);
	}
	
	@Override
	public void delete(Resources entity) {
		getResourcesDao().deleteById(entity.getId());
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
	
	public Map<Resources, List<Roles>> findMapByParams(Map<String, String> params) {
		List<Resources> resourcesList = new ArrayList<Resources>();
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Resources.class);
		resourcesList = getResourcesDao().findByDetachedCriteria(detachedCriteria);
		if (null == resourcesList || resourcesList.isEmpty()) {
			return Collections.emptyMap();
		}
		List<Long> resourcesIds = new ArrayList<Long>();
		Map<Long, Resources> mapResources = new HashMap<Long, Resources>();
		for (Resources r : resourcesList) {
			resourcesIds.add(r.getId());
			mapResources.put(r.getId(), r);
		}
		DetachedCriteria rolesCriteria = DetachedCriteria
				.forClass(Roles.class);
		List<Roles> rolesList = getRolesDao().findByDetachedCriteria(rolesCriteria);
		if (null == rolesList || rolesList.isEmpty()) {
			return Collections.emptyMap();
		}
		Map<Long, Roles> mapRoles = new HashMap<Long, Roles>();
		for (Roles r : rolesList) {
			mapRoles.put(r.getId(), r);
		}
		DetachedCriteria rolesResourcesCriteria = DetachedCriteria
				.forClass(RolesResources.class);
		List<RolesResources> rolesResourcesList = getRolesResourcesDao().findByDetachedCriteria(rolesResourcesCriteria);
		if (null == rolesResourcesList || rolesResourcesList.isEmpty()) {
			return Collections.emptyMap();
		}
		Map<Resources, List<Roles>> mapRolesResources = new HashMap<Resources, List<Roles>>();
		for (RolesResources rr : rolesResourcesList) {
			if (null == rr.getResourceId() || null == rr.getRoleId()) {
				continue;
			}
			Resources r = mapResources.get(rr.getResourceId());
			if (null == r) {
				continue;
			}
			Roles roles = mapRoles.get(rr.getRoleId());
			if (null == roles) {
				continue;
			}
			List<Roles> rList = mapRolesResources.get(r);
			if (null == rList) {
				rList = new ArrayList<Roles>();
			}
			rList.add(roles);
			mapRolesResources.put(r, rList);
		}
		return mapRolesResources;
	}

	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Resources.class);
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getResourcesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}

	public ResourcesDao getResourcesDao() {
		return resourcesDao;
	}

	public void setResourcesDao(ResourcesDao resourcesDao) {
		this.resourcesDao = resourcesDao;
	}

	public RolesResourcesDao getRolesResourcesDao() {
		return rolesResourcesDao;
	}

	public void setRolesResourcesDao(RolesResourcesDao rolesResourcesDao) {
		this.rolesResourcesDao = rolesResourcesDao;
	}

	public RolesDao getRolesDao() {
		return rolesDao;
	}

	public void setRolesDao(RolesDao rolesDao) {
		this.rolesDao = rolesDao;
	}
	
}