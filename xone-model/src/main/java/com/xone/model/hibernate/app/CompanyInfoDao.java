package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.CompanyInfo;
import com.xone.model.hibernate.generic.HibernateDao;

public interface CompanyInfoDao extends HibernateDao<CompanyInfo> {

	public int deleteLogicById(Long id);
	
}
