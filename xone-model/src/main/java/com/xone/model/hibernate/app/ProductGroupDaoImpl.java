package com.xone.model.hibernate.app;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.xone.model.hibernate.entity.ProductGroup;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class ProductGroupDaoImpl extends AbstractHibernateDao<ProductGroup> implements ProductGroupDao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + ProductGroup.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			ProductGroup.FlagDeleted.DELETED.getValue(), id
		});
	}
	
    /** 统计商品已被团购的数量
     * @param entity
     * @return
     */
    public int getOrderProductNum(Long productId){
        DetachedCriteria c = DetachedCriteria.forClass(ProductGroup.class);
        c.add(Restrictions.eq("flagDeleted", ProductGroup.FlagDeleted.NORMAL.getValue()));
        c.setProjection(Projections.sum("groupNum"));
        Criteria cc = c.getExecutableCriteria(getSession(false));
        Object o = cc.uniqueResult();
        if(o == null)
            return 0;
        return ((Number)o).intValue();
    }

}