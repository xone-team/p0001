package com.xone.model.hibernate.app;

import java.util.List;

import com.xone.model.hibernate.entity.ProductCheck;
import com.xone.model.hibernate.generic.HibernateDao;

public interface ProductCheckDao extends HibernateDao<ProductCheck> {
    public List<ProductCheck> findByProductId(Long productId);
}
