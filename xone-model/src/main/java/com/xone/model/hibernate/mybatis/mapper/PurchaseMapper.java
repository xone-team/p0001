package com.xone.model.hibernate.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Purchase;

public interface PurchaseMapper {
	
	public List<Purchase> findPurchaseListWithUser(Map<String, String> params);

	public Integer findPurchaseCountWithUser(Map<String, String> params);

}
