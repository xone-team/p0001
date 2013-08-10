/**
 * ProductCheckService.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-12
 *
 */
package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ProductCheck;
import com.xone.model.hibernate.support.Pagination;

public interface ProductCheckService {
	
    public ProductCheck save(ProductCheck entity);
    
    public ProductCheck update(ProductCheck entity);

    public ProductCheck findById(Long id);
    
    public void delete(ProductCheck entity);
    
    public List<ProductCheck> findAllByMap(Map<String, String> params);
    
    public ProductCheck findByMap(Map<String, String> params);

    public Pagination findByParams(Map<String, String> params);
    
}
