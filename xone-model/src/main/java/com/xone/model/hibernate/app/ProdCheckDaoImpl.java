package com.xone.model.hibernate.app;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.xone.model.hibernate.entity.ProdCheck;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class ProdCheckDaoImpl extends AbstractHibernateDao<ProdCheck> implements ProdCheckDao {

    @Override
    public List<ProdCheck> findByProductId(Long productId) {
        List<ProdCheck> result = null;
        DetachedCriteria c = DetachedCriteria.forClass(ProdCheck.class);
        c.add(Restrictions.eq("productId", productId));
        c.addOrder(Order.desc("dateCreated"));
        result = findByDetachedCriteria(c);
        return result;
    }

}