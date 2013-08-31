package com.xone.model.hibernate.app;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.xone.model.hibernate.entity.ProductCheck;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class ProductCheckDaoImpl extends AbstractHibernateDao<ProductCheck> implements ProductCheckDao {

    @Override
    public List<ProductCheck> findByProductId(Long productId) {
        List<ProductCheck> result = null;
        DetachedCriteria c = DetachedCriteria.forClass(ProductCheck.class);
        c.add(Restrictions.eq("productId", productId));
        c.addOrder(Order.desc("dateCreated"));
        result = findByDetachedCriteria(c);
        return result;
    }

}