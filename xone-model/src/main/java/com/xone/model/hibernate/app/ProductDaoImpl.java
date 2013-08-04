package com.xone.model.hibernate.app;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.time.DateUtils;

import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.generic.AbstractHibernateDao;
import com.xone.model.hibernate.mybatis.mapper.ProductMapper;
import com.xone.model.utils.BeanUtils;
import com.xone.model.utils.BeanUtils.MapCopyRoles;
import com.xone.model.utils.BeanUtils.MyAssignRules;

public class ProductDaoImpl extends AbstractHibernateDao<Product> implements ProductDao {
	
	public List<Product> findAllProductByUserRef(Map<String, String> params) {
//		params.put("productId", "23");
		ProductMapper productMapper = getSqlSession().getMapper(ProductMapper.class);
		List<Map<String, Object>> l = productMapper.findProductListWithUser(params);
		List<Product> pList = new ArrayList<Product>();
		for (Map<String, Object> map : l) {
			Product p = new Product();
//			BeanUtils.copyPropertiesFromMap(map, p, new MapCopyRoles() {
//				@Override
//				public boolean myCopyRules(Class<?> parameterClass, String method) {
//					return true;
//				}
//			}, new MyAssignRules() {
//				@Override
//				public Object myAssignRules(Class<?> clazz, String value) {
//					try {
//						String name = clazz.getName();
//						System.out.println("className:" + clazz.getName());
//						if ("java.util.Date".equals(name)) {
//							value = value.replaceFirst("\\.0$", "");
//							return DateUtils.parseDate(value, new String[] {
//									"yyyy-MM-dd HH:mm:ss"
//							});
//						} else if ("java.lang.Long".equals(name)) {
//							return Long.parseLong(value);
//						} else if ("java.lang.String".equals(name)) {
//							return value;
//						}
//						
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//					return null;
//				}
//			}, null);
			pList.add(p);
		}
		return pList;
	}

}
