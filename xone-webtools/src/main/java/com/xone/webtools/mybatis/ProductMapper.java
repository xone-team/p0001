package com.xone.webtools.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

public interface ProductMapper {
	
	public List<Product> findProductListWithUser(Map<String, Object> params, RowBounds pageBounds);

	public Integer findProductCountWithUser(Map<String, Object> params);

}
