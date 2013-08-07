package com.xone.model.hibernate.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Product;

public interface ProductMapper {
	
	public List<Product> findProductListWithUser(Map<String, String> params);

	public Integer findProductCountWithUser(Map<String, String> params);

}
