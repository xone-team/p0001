package com.xone.model.hibernate.app;

import com.xone.model.hibernate.entity.${tableName};
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class ${tableName}DaoImpl extends AbstractHibernateDao<${tableName}> implements ${tableName}Dao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + ${tableName}.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			"1", id
		});
	}

}