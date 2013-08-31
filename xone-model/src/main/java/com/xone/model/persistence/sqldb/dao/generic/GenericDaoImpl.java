/**
 * GenericDaoImpl.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-14
 *
 */
package com.xone.model.persistence.sqldb.dao.generic;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.xone.model.persistence.Pager;

/**
 * 通用DAO的实现类
 * @author Hunny
 * @created 2011-3-14 下午10:11:17
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 */
public class GenericDaoImpl implements GenericDao {

	private static final Logger logger = Logger.getLogger(GenericDaoImpl.class);
	private static final String KEY_SQL = "com.xone.model.generic.dao.sql";
	private static final String KEY_PARAMS = "com.xone.model.generic.dao.params";
	
	private EntityManager entityManager;

	/**
	 * @return the entityManager
	 */
	public EntityManager getEntityManager() {
		return entityManager;
	}

	/**
	 * @param entityManager the entityManager to set
	 */
	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#findById(java.lang.Class, java.lang.Object)
	 */
	@Override
	public <T> T findById(Class<T> entityClass, Object primaryKey) {
		return this.getEntityManager().find(entityClass, primaryKey);
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#save(java.lang.Object)
	 */
	@Override
	public void save(Object entity) {
		this.getEntityManager().persist(entity);
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#saveList(java.util.List)
	 */
	@Override
	public <T> void saveList(List<T> entities) {
		for (int i = 0; i < entities.size(); i++) {
			Object entity = entities.get(i);
			save(entity);
			if ((i + 1) % 20 == 0) {
				this.getEntityManager().flush();
				this.getEntityManager().clear();
			}
		}
	}
	
	/**
	 * @param qlString
	 * @return
	 */
	protected Query createQuery(String qlString){
		return this.getEntityManager().createQuery(qlString);
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#findAll(java.lang.Class)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> findAll(Class<T> entityClass) {
		Query query = this.getEntityManager().createQuery("select p from " + entityClass.getName() + " p");
        return query.getResultList();
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#updateById(java.lang.Object)
	 */
	@Override
	public int updateById(Object entity) {
		final String methodGetId = "getId";
		final String[] methodPrefix = {"get", "is"};
		List<Object> params = new ArrayList<Object>();
		int result = 0;
		try {
			Method setLastUpdated = entity.getClass().getMethod("setLastUpdated", Date.class);
			setLastUpdated.invoke(entity, new Date());
		} catch (Exception e) {
			logger.debug(e);
		}
		
		try {
			Object id = entity.getClass().getMethod("getId").invoke(entity);
			StringBuffer sql = null;
			Method[] methods = entity.getClass().getMethods();
			
			for (int i = 0; i < methods.length; i++) {
				String methodName = methods[i].getName();
				String fieldName = null;
				
				if(methodGetId.equals(methodName)){
					continue;
				}
				
				Column annotation = methods[i].getAnnotation(Column.class);
				if (annotation != null) {
					for (String prefix : methodPrefix) {
						if (methodName.indexOf(prefix) == 0) {
							methodName = methodName.replaceFirst(prefix, "");
							if (methodName.length() > 0) {
								fieldName = Character.toLowerCase(methodName.charAt(0)) + methodName.substring(1);
								params.add(methods[i].invoke(entity, new Object[0]));
								break;
							}
						}
					}
				}
				
				if (fieldName != null) {
					if (sql == null) {
						sql = new StringBuffer();
						sql.append("update ");
						sql.append(entity.getClass().getName());
						sql.append(" o set o.");
						sql.append(fieldName);
						sql.append(" = ? ");
					} else {
						sql.append(", o.");
						sql.append(fieldName);
						sql.append(" = ? ");
					}
				}
			}
			
			if (sql != null) {
				sql.append("where o.id = ");
				sql.append(id.toString());
				Query query = createQuery(sql.toString());
				for (int i = 0; i < params.size(); i++) {
					query.setParameter(i + 1, params.get(i));
				}
				result = query.executeUpdate();
			}
		}catch(Exception e){
			logger.error(e);
		}
		return result;
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#delete(java.lang.Object)
	 */
	@Override
	public <T> void delete(T entity) {
		this.getEntityManager().remove(entity);
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#deleteByIds(java.lang.Class, java.util.List)
	 */
	@Override
	public <T> int deleteByIds(Class<T> entityClass, List<Integer> idList) {
		if (idList.size() == 0) {
			return 0;
		}
		Query query = createQuery("delete from " + entityClass.getName()
				+ " o where o.id in ("
				+ StringUtils.join(idList.iterator(), ',') + ")");
		return query.executeUpdate();
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#deleteById(java.lang.Class, int)
	 */
	@Override
	public <T> int deleteById(Class<T> entityClass) {
		int i = 0;
		try {
			Object id = entityClass.getClass().getMethod("getId").invoke(entityClass);
			if (null == id) {
				return 0;
			}
			Query query = createQuery("delete from " + entityClass.getName() + " o where o.id = ? ");
			query.setParameter(1, id);
			i = query.executeUpdate();
		} catch (Exception e) {
			logger.debug(e);
		}
		return i;
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#findByParam(java.lang.Class, java.lang.String, java.lang.Object)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> findAllByEntity(T entity) {
		if (null == entity) {
			return Collections.emptyList();
		}
		Map<String, Object> bean = queryWhereSqlByEntity(entity);
		String keySql = (String)bean.get(KEY_SQL);
		List<Object> params = (List<Object>)bean.get(KEY_PARAMS);
		if (keySql != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("select o from ");
			sql.append(entity.getClass().getName());
			sql.append(" o");
			sql.append(keySql);
			Query query = createQuery(sql.toString());
			for (int i = 0; i < params.size(); i++) {
				query.setParameter(i + 1, params.get(i));
			}
			return query.getResultList();
		}
		return Collections.emptyList();
	}
	
	private <T> Map<String, Object> queryWhereSqlByEntity(T entity) {
		Map<String, Object> bean = new HashMap<String, Object>();
		String[] methodPrefix = {"get", "is"};
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = null;
		try {
			Method[] methods = entity.getClass().getMethods();
			for (int i = 0; i < methods.length; i++) {
				String methodName = methods[i].getName();
				String fieldName = null;
				
				Column annotation = methods[i].getAnnotation(Column.class);
				if (annotation != null) {
					for (String prefix : methodPrefix) {
						if (methodName.indexOf(prefix) == 0) {
							methodName = methodName.replaceFirst(prefix, "");
							if (methodName.length() > 0) {
								fieldName = Character.toLowerCase(methodName.charAt(0)) + methodName.substring(1);
								Object object = methods[i].invoke(entity, new Object[0]);
								if (null != object) {
									params.add(object);
									if (fieldName != null) {
										if (sql == null) {
											sql = new StringBuffer();
//											sql.append("select ");
//											sql.append(s);
//											sql.append(" from ");
//											sql.append(entity.getClass().getName());
//											sql.append(" o");
											sql.append(" where o.");
											sql.append(fieldName);
											sql.append(" = ? ");
										} else {
											sql.append(" and o.");
											sql.append(fieldName);
											sql.append(" = ? ");
										}
									}
								}
								break;
							}
						}
					}
				}
				
			} 
		} catch (Exception e) {
			logger.debug(e);
		}
		bean.put(KEY_PARAMS, params);
		bean.put(KEY_SQL, (null == sql ? null : sql.toString()));
		return bean;
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#findAllPerPage(com.opensymphony.module.sitemesh.Page)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> findAllEntityByPager(T entity, Pager pager) {
		if (null == entity || null == pager || pager.getCount() <= 0 || pager.getStart() < 0) {
			return Collections.EMPTY_LIST;
		}
		Map<String, Object> bean = queryWhereSqlByEntity(entity);
		String keySql = (String)bean.get(KEY_SQL);
		List<Object> params = (List<Object>)bean.get(KEY_PARAMS);
		Integer total = 0;
		if (keySql != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) from ");
			sql.append(entity.getClass().getName());
			sql.append(" o");
			sql.append(keySql);
			Query query = createQuery(sql.toString());
			for (int i = 0; i < params.size(); i++) {
				query.setParameter(i + 1, params.get(i));
			}
			total = (Integer)query.getSingleResult();
			if (null != total && total > 0) {
				pager.setTotal(total);
				sql = new StringBuffer();
				sql.append("select o from ");
				sql.append(entity.getClass().getName());
				sql.append(" o");
				sql.append(keySql);
				query = createQuery(sql.toString());
				for (int i = 0; i < params.size(); i++) {
					query.setParameter(i + 1, params.get(i));
				}
				query.setFirstResult(pager.getStart());
				query.setMaxResults(pager.getCount());
				return query.getResultList();
			}
		}
		return Collections.EMPTY_LIST;
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#merge(java.lang.Object)
	 */
	@Override
	public <T> T merge(T entity) {
		return this.getEntityManager().merge(entity);
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#findAllByIds(java.lang.Class, java.util.Collection)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <K, T> List<T> findAllByIds(Class<T> entityClass,
			Collection<K> idList) {
		if (idList == null || idList.size() == 0){
			return Collections.emptyList();
		}
		Query query = createQuery("select o from " + entityClass.getName()
				+ " o where o.id in ("
				+ StringUtils.join(idList.iterator(), ',') + ")");
		return query.getResultList();
	}

	/* (non-Javadoc)
	 * @see com.hunny.entries.dao.GenericDao#findAllMapByIds(java.lang.Class, java.util.List)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <K, T> Map<K, T> findAllMapByIds(Class<T> entityClass,
			List<K> idList) {
		Map<K, T> map = new HashMap<K, T>();
		if(idList != null && !idList.isEmpty()) {
			List<T> list = findAllByIds(entityClass, idList);
			try {
				for (int i = 0; i < list.size(); i++) {
					T entity = list.get(i);
					Method getIdMethod = entity.getClass().getMethod("getId", new Class[]{});
					K id = (K) getIdMethod.invoke(entity, new Object[] {});
					map.put(id, entity);
				}
			} catch (Throwable e) {
				logger.error("", e);
			}
		}
		return map;
	}
}
