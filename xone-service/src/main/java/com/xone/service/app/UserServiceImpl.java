package com.xone.service.app;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.UserDao;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.support.Pagination;

public class UserServiceImpl implements UserService {

	@Autowired
	protected UserDao userDao;

	@Override
	public Person save(Person entity) {
		return getUserDao().save(entity);
	}
	
	@Override
	public Person update(Person entity) {
		return getUserDao().update(entity);
	}
	
	@Override
	public void delete(Person entity) {
		getUserDao().deleteById(entity.getId());
	}

	@Override
	public Person findById(Long id) {
		return getUserDao().findById(id);
	}

	@Override
	public List<Person> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Person.class);
		return getUserDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Person.class);
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getUserDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
}
