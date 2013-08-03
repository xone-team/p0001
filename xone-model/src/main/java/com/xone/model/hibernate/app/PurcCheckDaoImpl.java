package com.xone.model.hibernate.app;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.xone.model.hibernate.entity.PurcCheck;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class PurcCheckDaoImpl extends AbstractHibernateDao<PurcCheck> implements PurcCheckDao {

    @Override
    public List<PurcCheck> findByPurchaseId(Long purchaseId) {
        List<PurcCheck> result = null;
        DetachedCriteria c = DetachedCriteria.forClass(PurcCheck.class);
        c.add(Restrictions.eq("purchaseId", purchaseId));
        c.addOrder(Order.desc("dateCreated"));
        result = findByDetachedCriteria(c);
        return result;
    }

}