package com.xone.model.hibernate.app;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.xone.model.hibernate.entity.PurchaseCheck;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class PurchaseCheckDaoImpl extends AbstractHibernateDao<PurchaseCheck> implements PurchaseCheckDao {

    @Override
    public List<PurchaseCheck> findByPurchaseId(Long purchaseId) {
        List<PurchaseCheck> result = null;
        DetachedCriteria c = DetachedCriteria.forClass(PurchaseCheck.class);
        c.add(Restrictions.eq("purchaseId", purchaseId));
        c.addOrder(Order.desc("dateCreated"));
        result = findByDetachedCriteria(c);
        return result;
    }

}