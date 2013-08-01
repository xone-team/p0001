/**
 * ProdCheckService.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-12
 *
 */
package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ProdCheck;
import com.xone.model.hibernate.support.Pagination;

public interface ProdCheckService {
	
    public ProdCheck save(ProdCheck entity);
    
    public ProdCheck update(ProdCheck entity);

    public ProdCheck findById(Long id);
    
    public void delete(ProdCheck entity);
    
    public List<ProdCheck> findAllByMap(Map<String, String> params);
    
    public ProdCheck findByMap(Map<String, String> params);

    public Pagination findByParams(Map<String, String> params);
    
}
