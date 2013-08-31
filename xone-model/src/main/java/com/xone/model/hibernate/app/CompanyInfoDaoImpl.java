package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.CompanyInfo;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class CompanyInfoDaoImpl extends AbstractHibernateDao<CompanyInfo> implements CompanyInfoDao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + CompanyInfo.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			CompanyInfo.FlagDeleted.DELETED.getValue(), id
		});
	}

}