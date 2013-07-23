package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ResourcesDao;
import com.xone.model.hibernate.app.RolesDao;
import com.xone.model.hibernate.app.RolesResourcesDao;
import com.xone.model.hibernate.app.UserRolesDao;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Resources;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.entity.RolesResources;
import com.xone.model.hibernate.entity.UserRoles;
import com.xone.model.hibernate.support.Pagination;
import com.xone.model.utils.StringUtils;

public class RolesServiceImpl implements RolesService {

	@Autowired
	protected RolesDao rolesDao;
	
	@Autowired
	protected UserRolesDao userRolesDao;
	
	@Autowired
	protected ResourcesDao resourcesDao;
	
	@Autowired
	protected RolesResourcesDao rolesResourcesDao;

	@Override
	public Roles save(Roles entity) {
		return getRolesDao().save(entity);
	}
	
	@Override
	public Roles update(Roles entity) {
		return getRolesDao().update(entity);
	}
	
	@Override
	public void delete(Roles entity) {
		getRolesDao().deleteById(entity.getId());
	}

	@Override
	public Roles findById(Long id) {
		return getRolesDao().findById(id);
	}

	@Override
	public List<Roles> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Roles.class);
		return getRolesDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Roles.class);
		int pageSize = StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = StringUtils.parseInt(params.get("pageNo"), 0);
		return getRolesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	@Override
	public List<Roles> findAllByUser(Person person) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Roles.class);
		List<UserRoles> userRoles = getUserRolesDao().findByProperty("userId", person.getId());
		if (null == userRoles || userRoles.isEmpty()) {
			return Collections.emptyList();
		}
		List<Long> roleIds = new ArrayList<Long>();
		for (UserRoles ur : userRoles) {
			roleIds.add(ur.getRoleId());
		}
		detachedCriteria.add(Restrictions.in("id", roleIds));
		List<Roles> roles = getRolesDao().findByDetachedCriteria(detachedCriteria);
		if (null == roles || roles.isEmpty()) {
			return Collections.emptyList();
		}
		return roles;
//				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	@Override
	public List<Resources> findAllByRoles(List<Roles> roles) {
		if (null == roles || roles.isEmpty()) {
			return Collections.emptyList();
		}
		List<Long> roleIds = new ArrayList<Long>();
		for (Roles r : roles) {
			roleIds.add(r.getId());
		}
		DetachedCriteria rolesResourcesCriteria = DetachedCriteria
				.forClass(RolesResources.class);
		rolesResourcesCriteria.add(Restrictions.in("roleId", roleIds));
		List<RolesResources> listResources = getRolesResourcesDao().findByDetachedCriteria(rolesResourcesCriteria);
		if (null != listResources && !listResources.isEmpty()) {
			List<Long> resourceIds = new ArrayList<Long>();
			for (RolesResources rr : listResources) {
				resourceIds.add(rr.getResourceId());
			}
			if (null == resourceIds || resourceIds.isEmpty()) {
				return Collections.emptyList();
			}
			DetachedCriteria resourcesCriteria = DetachedCriteria
					.forClass(Resources.class);
			resourcesCriteria.add(Restrictions.in("id", resourceIds));
			return getResourcesDao().findByDetachedCriteria(resourcesCriteria);
		}
		return Collections.emptyList();
	}

	public RolesDao getRolesDao() {
		return rolesDao;
	}

	public void setRolesDao(RolesDao rolesDao) {
		this.rolesDao = rolesDao;
	}

	public UserRolesDao getUserRolesDao() {
		return userRolesDao;
	}

	public void setUserRolesDao(UserRolesDao userRolesDao) {
		this.userRolesDao = userRolesDao;
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
	
}