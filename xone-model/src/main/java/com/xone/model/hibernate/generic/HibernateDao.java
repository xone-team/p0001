package com.xone.model.hibernate.generic;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.xone.model.hibernate.support.Pagination;

public interface HibernateDao <T extends Serializable> {
	/**
	 * 保存对象
	 * 
	 * @param entity
	 *            实体对象
	 * @return 实体对象
	 */
	public T save(T entity);
	
	/**
	 * 
	 * 批量保存对象。
	 * 
	 * @param entity
	 * @return
	 */
	public List<T> save(List<T> entities);
	
	/**
	 * 更新对象
	 * 
	 * @param entity
	 *            实体对象
	 * @return 实体对象
	 */
	public T update(T entity);
	
	/**
	 * 保存或更新对象
	 * 
	 * @param entity
	 *            实体对象
	 * @return 实体对象
	 */
	public T saveOrUpdate(T entity);
	
	/**
	 * 保存或更新对象拷贝
	 * 
	 * @param entity
	 * @return 已更新的持久化对象
	 */
	public Object merge(Object entity);
	
	/**
	 * 删除对象
	 * 
	 * @param entity
	 *            实体对象
	 */
	public void delete(Object entity);
	
	/**
	 * 根据ID删除记录
	 * 
	 * @param id
	 *            记录ID
	 */
	public T deleteById(Serializable id);
	
	public T findById(Serializable id);
	
	/**
	 * 
	 * 根据ID批量删除。
	 * 
	 * @param ids
	 * @return
	 */
	public int deleteById(Serializable[] ids);
	
	public int deleteByProperties(String propertyName, List<T> propertyList);
	
	/**
	 * 通过ID查找对象
	 * 
	 * @param id
	 *            记录的ID
	 * @param lock
	 *            是否锁定对象
	 * @return 实体对象
	 */
	public T load(Serializable id);

	/**
	 * 通过ID查找对象
	 * @param id
	 * 			记录的ID
	 * @return 	实体对象
	 */
	public T get(Serializable id);
	
	/**
	 * 通过ID查找对象,不锁定对象
	 * 
	 * @param id
	 *            记录的ID
	 * @return 实体对象
	 */
	public T load(Serializable id, boolean lock);
	
	/**
	 * 查找所有对象
	 * 
	 * @return 对象列表
	 */
	public List<T> findAll();

	/**
	 * 根据提供的sql预编译语句和参数值查找对象
	 * @param hql
	 * 			预编译sql语句
	 * @param values 
	 * 			数量可变的参数
	 * @return 实体对象列表
	 */
	public List find(String hql, Object... values);

	/**
	 * 根据提供的sql预编译语句和参数值查找对象
	 * @param hql
	 * 			预编译sql语句
	 * @param values 
	 * 			数量可变的参数
	 * @return 实体对象
	 */
	public Object findUnique(String hql, Object... values);

	/**
	 * 按属性查找对象列表.
	 * 
	 * @param property
	 * @param value
	 * @return
	 */
	public List<T> findByProperty(String property, Object value);
	
	/**
	 * 按属性查找对象列表.
	 * 
	 * @param property
	 * @param value
	 * @return
	 */
	public <K> List<T> findInProperty(String property, List<K> value);

	/**
	 * 按属性查找唯一对象.
	 * 
	 * @param property
	 * @param value
	 * @return
	 */
	public T findUniqueByProperty(String property, Object value);
	/**
	 * 按属性查找对象的数量
	 * 
	 * @param property
	 * @param value
	 * @return
	 */
	public int countByProperty(String property, Object value);

	/**
	 * 根据查询函数与参数列表创建Query对象,后续可进行更多处理,辅助函数.
	 * @param queryString
	 * @param values
	 * @return
	 */
	public Query createQuery(String queryString, Object... values);

	/**
	 * 按Criterion查询对象列表.
	 * 
	 * @param criterion
	 *            数量可变的Criterion.
	 */
	public List<T> findByCriteria(Criterion... criterion);

	/**
	 * 获取分页对象
	 * @param crit
	 * @param pageNo
	 * @param pageSize
	 * @param projection
	 * @param orders
	 * @return
	 */
	public Pagination findByCriteria(Criteria crit, int pageNo, int pageSize, Projection projection, Order... orders);

	/**
	 * @param hql
	 *            查询语句
	 * @param countHql
	 *            查询总数
	 * @param pageSize
	 *            每页大小
	 * @param startIndex
	 *            开始索引位置
	 * @return
	 */
	public Pagination findPageByQuery(final String hql, final String countHql,
			final int pageSize, final int startIndex);

	/**
	 * 查询对象
	 * @param hql 查询语句
	 * @param pageSize 页大小
	 * @param startIndex 开始位置
	 * @return
	 */
	public List findByQuery(final String hql, final int pageSize,
			final int startIndex);

	/**
	 * 根据查询条件查询总数
	 * @param condi
	 * @return
	 */
	public int countByProperty(DetachedCriteria detachCriteria);

	/**
	 * 刷新对象
	 * 
	 * @param entity
	 */
	public void refresh(Object entity);

	/** 
	 * 根据Criterion条件创建Criteria,后续可进行更多处理,辅助函数.
	 * @param criterions
	 * @return
	 */
	public Criteria createCriteria(Criterion... criterions);

	/**查询对象列表
	 * @param criterion
	 * 			游离态的动态查询对象
	 * @return
	 */

	public List<T> findByDetachedCriteria(DetachedCriteria detachCriteria);
	
	public List<T> findListByDetachedCriteria(DetachedCriteria detachCriteria, int fetchSize, int maxResults);

	/**
	 * 查询分页对象
	 * @param criterion
	 * 			游离态的动态查询对象
	 * @return
	 */
	public Pagination findByDetachedCriteria(DetachedCriteria detachCriteria,
			int pageSize, int startIndex);

	/**
	 * 根据传入sql和主键id批量操作
	 */
	public int batchUpdateDelete(String sql, Serializable[] ids);

	public void compSQL(String sql, Map proMap,Map listMap);
	
	public Class<T> getPersistentClass();

	/**
	 * 获取SqlMapClientTemplate对象
	 * @return
	 */
	public SqlMapClientTemplate getSqlMapTemplate();

	/**
	 * 设置SqlMapClientTemplate对象
	 * @param sqlMapTemplate
	 */
	public void setSqlMapTemplate(SqlMapClientTemplate sqlMapTemplate);

	/**
	 * 通过sqlmap的键值获取对象列表
	 * @param args sqlmap配置的键值
	 * @return
	 */
	public List<T> listBySqlMap(String id);

	/**
	 * 通过传递sqlmap的键值和参数获取对象列表
	 * @param arg0 sqlmap配置的 键值
	 * @param arg1 参数1
	 * @param arg2 参数2
	 * @return
	 */
	public T getTBySqlMap(String id);

	
	/**
	 * 通过sqlmap的键值和传递的参数获得实体列表
	 * @param id
	 * @param args
	 * @return
	 */
	public List<T> listBySqlMap(String id,Object args);
	
	/**
	 * 通过sqlmap的键值和传递的参数列表获得实体列表
	 * @param id
	 * @param args
	 * @return
	 */
	public List<T> listBySqlMap(String id,Object[] args);
	
	/**
	 * 通过sqlmap的键值和传递的参数列表获得实体列表
	 * @param id
	 * @param list
	 * @return
	 */
	public List<T> listBySqlMap(String id,List<Object> list);
	
	/**
	 * 通过传递sqlmap的键值和参数获取实体列表
	 * @param id sqlmap配置的 键值
	 * @param arg1 参数1
	 * @param arg2 参数2
	 * @return
	 */

	
	/**
	 * 通过传递sqlmap的键值和参数获取实体
	 * @param id
	 * @param args
	 * @return
	 */
	public T getTBySqlMap(String id,Object args);
	
	/**
	 * 通过传递sqlmap的键值和参数获取对象
	 * @param id
	 * @param args
	 * @return
	 */
	public Object getObjectBySqlMap(String id,Object args);
	
	/**
	 * 通过传递的sqlmap的键值和参数列表获取实体
	 * @param id
	 * @param args
	 * @return
	 */
	public T getTBySqlMap(String id, Object[] args);
	
	
	/**
	 * 通过传递的sqlmap的键值和参数列表获取实体
	 * @param id
	 * @param list
	 * @return
	 */
	public T getTBySqlMap(String id, List<Object> list);
	
	/**
	 * 通过传递的sqlmap键值获取对象
	 * @param id1 查询列表键值
	 * @param id2 查询总数键值
	 * @return
	 */
	public Pagination getObjectBySqlMap(String id1,String id2);
	
	/**
	 * 通过传递的sqlmap键值和参数获取对象
	 * @param id1 查询列表键值
	 * @param id2 查询总数键值
	 * @param args 参数
	 * @return
	 */
	public Pagination getObjectBySqlMap(String id1, String id2,Object args);
	
	/**
	 * 通过传递的sqlmap键值和参数数组获取对象
	 * @param id1 查询列表键值
	 * @param id2 查询总数键值
	 * @param args 参数数组
	 * @return
	 */
	public Pagination getObjectBySqlMap(String id1, String id2, Object[] args);
	
	/**
	 * 通过传递的sqlmap键值和参数数组获取对象
	 * @param id1 查询列表键值
	 * @param id2 查询总数键值
	 * @param list 参数列表
	 * @return
	 */
	public Pagination getObjectBySqlMap(String id1, String id2, List<Object> list);
	

	/**
	 * 根据属性删除
	 * 
	 * @param propertyName
	 * @param value
	 */
	public int deleteByProperty(String propertyName, Object value);

	/**
	 * 通过属性删除实体
	 * 
	 * @param propertyName
	 * @param ids
	 * @return
	 */
	public int deleteByProperty(String propertyName, Object[] ids);
}
