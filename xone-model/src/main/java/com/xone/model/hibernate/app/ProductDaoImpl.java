package com.xone.model.hibernate.app;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.generic.AbstractHibernateDao;
import com.xone.model.hibernate.mybatis.mapper.ProductMapper;
import com.xone.model.utils.BeanUtils;
import com.xone.model.utils.BeanUtils.MapCopyRoles;
import com.xone.model.utils.BeanUtils.MyAssignRules;

public class ProductDaoImpl extends AbstractHibernateDao<Product> implements ProductDao {
	
	public List<Product> findAllProductByUserRef(Map<String, String> params) {
		List<Map<String, Object>> l = getMapper(ProductMapper.class).findProductListWithUser(params);
		List<Product> pList = new ArrayList<Product>();
		for (Map<String, Object> map : l) {
			Product p = new Product();
			BeanUtils.copyPropertiesFromMap(map, p, new MapCopyRoles() {
				@Override
				public boolean myCopyRules(Class<?> parameterClass, String method) {
					return true;
				}
			}, new MyAssignRules() {
				@Override
				public Object myAssignRules(Class<?> clazz, Object value) {
					return value;
				}
			}, null);
			pList.add(p);
		}
		return pList;
	}

}
