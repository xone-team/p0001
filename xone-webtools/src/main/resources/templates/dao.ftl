package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.${tableName!""};
import com.xone.model.hibernate.generic.HibernateDao;

public interface ${tableName!""}Dao extends HibernateDao<${tableName!""}> {

	public int deleteLogicById(Long id);
	
}
