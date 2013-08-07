package com.xone.model.hibernate.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.generic.HibernateDao;

public interface PurchaseDao extends HibernateDao<Purchase> {
	
	public List<Purchase> findAllPurchaseByUserRef(Map<String, String> params);

}
