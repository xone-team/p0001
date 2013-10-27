package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.LoginLog;
import com.xone.model.hibernate.generic.HibernateDao;

public interface LoginLogDao extends HibernateDao<LoginLog> {

	public int deleteLogicById(Long id);
	
}
