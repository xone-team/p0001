package com.xone.service.app;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.UserRolesDao;
import com.xone.model.hibernate.entity.UserRoles;

public class UserRolesServiceImpl implements UserRolesService {

	@Autowired
	protected UserRolesDao userRolesDao;

	@Override
	public UserRoles save(UserRoles entity) {
		return getUserRolesDao().save(entity);
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

	public UserRolesDao getUserRolesDao() {
		return userRolesDao;
	}

	public void setUserRolesDao(UserRolesDao userRolesDao) {
		this.userRolesDao = userRolesDao;
	}
	
}