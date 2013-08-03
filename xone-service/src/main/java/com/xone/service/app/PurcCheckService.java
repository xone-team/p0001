/**
 * PurcCheckService.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-12
 *
 */
package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.PurcCheck;
import com.xone.model.hibernate.support.Pagination;

public interface PurcCheckService {
	
    public PurcCheck save(PurcCheck entity);
    
    public PurcCheck update(PurcCheck entity);

    public PurcCheck findById(Long id);
    
    public void delete(PurcCheck entity);
    
    public List<PurcCheck> findAllByMap(Map<String, String> params);
    
    public PurcCheck findByMap(Map<String, String> params);

    public Pagination findByParams(Map<String, String> params);
    
}
