package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.Links;
import com.xone.model.hibernate.generic.HibernateDao;

public interface LinksDao extends HibernateDao<Links> {

	public int deleteLogicById(Long id);
	
}
