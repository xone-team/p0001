package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.UserLinks;
import com.xone.model.hibernate.generic.HibernateDao;

public interface UserLinksDao extends HibernateDao<UserLinks> {

	public int deleteLogicById(Long id);
	
}
