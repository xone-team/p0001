package com.xone.model.hibernate.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.generic.HibernateDao;

public interface ProductDao extends HibernateDao<Product> {
	
	public List<Product> findAllProductByUserRef(Map<String, Object> params);
	
	public int findProductCountByUserRef(Map<String, Object> params);

}
