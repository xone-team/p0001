package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.UserRolesDao;
import com.xone.model.hibernate.entity.UserRoles;
import com.xone.model.hibernate.support.Pagination;

public class UserRolesServiceImpl implements UserRolesService {

	@Autowired
	protected UserRolesDao userRolesDao;

	@Override
	public UserRoles save(UserRoles entity) {
		return getUserRolesDao().save(entity);
	}
	
	@Override
	public UserRoles update(UserRoles entity) {
		return getUserRolesDao().update(entity);
	}
	
	@Override
	public void delete(UserRoles entity) {
		getUserRolesDao().deleteById(entity.getId());
	}

	@Override
	public UserRoles findById(Long id) {
		return getUserRolesDao().findById(id);
	}

	@Override
	public List<UserRoles> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(UserRoles.class);
		return getUserRolesDao().findListByDetachedCriteria(detachedCriteria,
				0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(UserRoles.class);
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getUserRolesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}

	public UserRolesDao getUserRolesDao() {
		return userRolesDao;
	}

	public void setUserRolesDao(UserRolesDao userRolesDao) {
		this.userRolesDao = userRolesDao;
	}
	
}