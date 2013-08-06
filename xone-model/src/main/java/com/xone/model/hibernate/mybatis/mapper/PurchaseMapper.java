package com.xone.model.hibernate.mybatis.mapper;

import java.util.List;
import java.util.Map;

public interface PurchaseMapper {
	
	public List<Map<String, Object>> findPurchaseListWithUser(Map<String, String> params);

	public Integer findPurchaseCountWithUser(Map<String, String> params);

}
