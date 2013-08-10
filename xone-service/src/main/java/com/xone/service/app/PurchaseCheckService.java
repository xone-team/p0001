/**
 * PurchaseCheckService.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-12
 *
 */
package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.PurchaseCheck;
import com.xone.model.hibernate.support.Pagination;

public interface PurchaseCheckService {
	
    public PurchaseCheck save(PurchaseCheck entity);
    
    public PurchaseCheck update(PurchaseCheck entity);

    public PurchaseCheck findById(Long id);
    
    public void delete(PurchaseCheck entity);
    
    public List<PurchaseCheck> findAllByMap(Map<String, String> params);
    
    public PurchaseCheck findByMap(Map<String, String> params);

    public Pagination findByParams(Map<String, String> params);
    
}
