package com.xone.model.hibernate.app;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.generic.AbstractHibernateDao;
import com.xone.model.hibernate.mybatis.mapper.ProductMapper;
import com.xone.model.utils.Constants;
import com.xone.model.utils.MyModelUtils;

public class ProductDaoImpl extends AbstractHibernateDao<Product> implements ProductDao {
	
	public List<Product> findAllProductByUserRef(Map<String, Object> params) {
		int offsetIndex = MyModelUtils.parseInt(String.valueOf(params.get("offsetIndex")), 0);
		int maxResult = MyModelUtils.parseInt(String.valueOf(params.get("maxResult")), Constants.APP_LIST_PAGE);
		return getMapper(ProductMapper.class).findProductListWithUser(params, new RowBounds(offsetIndex, maxResult));
//		List<Map<String, Object>> l = getMapper(ProductMapper.class).findProductListWithUser(params);
//		List<Product> pList = new ArrayList<Product>();
//		for (Map<String, Object> map : l) {
//			Product p = new Product();
//			copyPropertiesFromMap(map, p, new DaoMapCopyRoles() {
//				@Override
//				public boolean myCopyRules(Class<?> parameterClass, String method) {
//					return true;
//				}
//			}, new MyDaoAssignRules() {
//				@Override
//				public Object myAssignRules(Class<?> clazz, Object value) {
//					return value;
//				}
//			}, null);
//			pList.add(p);
//		}
//		return pList;
	}

	@Override
	public int findProductCountByUserRef(Map<String, Object> params) {
		return getMapper(ProductMapper.class).findProductCountWithUser(params);
	}

}
