package com.xone.model.hibernate.app;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.generic.AbstractHibernateDao;
import com.xone.model.hibernate.mybatis.mapper.PurchaseMapper;
import com.xone.model.utils.MyModelUtils;

public class PurchaseDaoImpl extends AbstractHibernateDao<Purchase> implements PurchaseDao {
	
	public List<Purchase> findAllPurchaseByUserRef(Map<String, String> params) {
		int offsetIndex = MyModelUtils.parseInt(params.get("offsetIndex"), 0);
		int maxResult = MyModelUtils.parseInt(params.get("maxResult"), 5);
		return getMapper(PurchaseMapper.class).findPurchaseListWithUser(params, new RowBounds(offsetIndex, maxResult));
//		List<Map<String, Object>> l = getMapper(PurchaseMapper.class).findPurchaseListWithUser(params);
//		List<Purchase> pList = new ArrayList<Purchase>();
//		for (Map<String, Object> map : l) {
//			Purchase p = new Purchase();
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
}
