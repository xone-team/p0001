package com.xone.model.hibernate.app;

import java.util.List;

import com.xone.model.hibernate.entity.PurchaseCheck;
import com.xone.model.hibernate.generic.HibernateDao;

public interface PurchaseCheckDao extends HibernateDao<PurchaseCheck> {
    public List<PurchaseCheck> findByPurchaseId(Long purchaseId);
}
