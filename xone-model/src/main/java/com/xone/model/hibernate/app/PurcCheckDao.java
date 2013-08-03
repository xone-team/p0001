package com.xone.model.hibernate.app;

import java.util.List;

import com.xone.model.hibernate.entity.PurcCheck;
import com.xone.model.hibernate.generic.HibernateDao;

public interface PurcCheckDao extends HibernateDao<PurcCheck> {
    public List<PurcCheck> findByPurchaseId(Long purchaseId);
}
