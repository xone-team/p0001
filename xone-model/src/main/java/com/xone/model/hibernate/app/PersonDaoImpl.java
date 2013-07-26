package com.xone.model.hibernate.app;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class PersonDaoImpl extends AbstractHibernateDao<Person> implements PersonDao {

	@Override
	public List<Person> findAllByName(String username, int fetchSize, int maxResults) {
//		Map<String, String> params=new HashMap<String, String>();
//		params.put("username", username);
//		List l = this.getSqlMapTemplate().queryForList("test.testsqlmapping", params);
//		System.out.println("list size: " + l.size());
		
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Person.class);
		detachedCriteria.add(Restrictions.eq("username", username));
		return this.findListByDetachedCriteria(detachedCriteria, fetchSize, maxResults);
		
//		List<Person> l = new ArrayList<Person>();
//		Person p = (Person)this.getHibernateTemplate().load(Person.class, 1);
//		if (null != p) {
//			l.add(p);
//		}
//		return l;
	}


}
