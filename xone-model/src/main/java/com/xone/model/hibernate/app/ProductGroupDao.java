package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.ProductGroup;
import com.xone.model.hibernate.generic.HibernateDao;

public interface ProductGroupDao extends HibernateDao<ProductGroup> {

	public int deleteLogicById(Long id);
	
}
