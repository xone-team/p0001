package com.xone.model.hibernate.app;

import java.util.List;

import com.xone.model.hibernate.entity.ProdCheck;
import com.xone.model.hibernate.generic.HibernateDao;

public interface ProdCheckDao extends HibernateDao<ProdCheck> {
    public List<ProdCheck> findByProductId(Long productId);
}
