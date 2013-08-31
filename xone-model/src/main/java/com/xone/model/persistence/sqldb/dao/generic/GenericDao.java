/**
 * GenericDao.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-14
 *
 */
package com.xone.model.persistence.sqldb.dao.generic;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import com.xone.model.persistence.Pager;

/**
 * @TODO 请Hunny添加代码注释 
 *
 * @author Hunny
 * @created 2011-3-14 下午09:57:47
 * @version 1.0.0
 * @param <T>
 * @sinace 1.0.0 
 * @modify
 * 
 */
public interface GenericDao {

	/**
	 * 得到实体管理
	 * @return
	 */
	public EntityManager getEntityManager();
	
	/**
	 * 根据数据库主键查找
	 * @param <T>
	 * @param entityClass
	 * @param primaryKey
	 * @return
	 */
	public <T> T findById(Class<T> entityClass, Object primaryKey);
	
	/**
	 * 保存对象
	 * @param entity
	 */
	public void save(Object entity);
	
	/**
	 * 保存数据列表
	 * @param <T>
	 * @param entities
	 */
	public <T> void saveList(List<T> entities);
	
	/**
	 * 查找所有的对象
	 * @param <T>
	 * @param entityClass
	 * @return
	 */
	public <T> List<T> findAll(Class<T> entityClass);
	
	/**
	 * 通过实体更新
	 * @param entity
	 * @return
	 */
	public int updateById(Object entity);
	
	/**
	 * 删除实体
	 * @param <T>
	 * @param entity
	 */
	public <T> void delete(T entity);
	
	/**
	 * 删除一系列
	 * @param <T>
	 * @param entityClass
	 * @param idList
	 * @return
	 */
	public <T> int deleteByIds(Class<T> entityClass, List<Integer> idList) ;
	
	/**
	 * @param <T>
	 * @param entityClass
	 * @param id
	 * @return
	 */
	public <T> int deleteById(Class<T> entityClass);
	
	/**
	 * 根据name value pare形式的参数来进行查询
	 * @param entityClass
	 * @param paramMap
	 * @return
	 */
	public <T> List<T> findAllByEntity(T entityClass);
	
	/**
	 * @param <T>
	 * @param page
	 * @return
	 */
	public <T> List<T> findAllEntityByPager(T entity, Pager pager);
	
	/**
	 * 更新实体
	 * @param <T>
	 * @param entity
	 * @return
	 */
	public <T> T merge(T entity);

	/**
	 * select * from table where id in (id list)
	 * @param entityClass
	 * @param ids
	 * @return
	 */
	public <K, T> List<T> findAllByIds(Class<T> entityClass, Collection<K> idList);
	
	/**
	 * 根据id列表获得id和实体的map,为性能而设计
	 * @param idList
	 * @return
	 */
	public <K, T> Map<K, T> findAllMapByIds(Class<T> entityClass, List<K> idList);
}
