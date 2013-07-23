package com.xone.service.app;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.RolesResourcesDao;
import com.xone.model.hibernate.entity.RolesResources;
import com.xone.model.hibernate.support.Pagination;
public class RolesResourcesServiceImpl implements RolesResourcesService {

	@Autowired
	protected RolesResourcesDao rolesResourcesDao;

	@Override
	public RolesResources save(RolesResources entity) {
		return getRolesResourcesDao().save(entity);
	}
	
	@Override
	public RolesResources update(RolesResources entity) {
		return getRolesResourcesDao().update(entity);
	}
	
	@Override
	public void delete(RolesResources entity) {
		getRolesResourcesDao().deleteById(entity.getId());
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
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(RolesResources.class);
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getRolesResourcesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	public RolesResourcesDao getRolesResourcesDao() {
		return rolesResourcesDao;
	}

	public void setRolesResourcesDao(RolesResourcesDao rolesResourcesDao) {
		this.rolesResourcesDao = rolesResourcesDao;
	}
	
}