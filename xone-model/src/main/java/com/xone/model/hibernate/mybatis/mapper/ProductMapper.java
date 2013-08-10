package com.xone.model.hibernate.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.xone.model.hibernate.entity.Product;

public interface ProductMapper {
	
	public List<Product> findProductListWithUser(Map<String, Object> params, RowBounds pageBounds);

	public Integer findProductCountWithUser(Map<String, Object> params);

}
