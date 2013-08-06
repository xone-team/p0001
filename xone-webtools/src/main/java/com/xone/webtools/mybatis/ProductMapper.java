package com.xone.webtools.mybatis;

import java.util.List;
import java.util.Map;

public interface ProductMapper {
	
	List<Map<String, Object>> findProductListWithUser(Map<String, String> params);

}
