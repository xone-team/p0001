package com.xone.model.hibernate.app;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.generic.AbstractHibernateDao;
import com.xone.model.utils.MyModelUtils;

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
	
	public List<Person> findAllByParams(Map<String, String> params) {
		if (null == params || params.isEmpty()) {
			return Collections.emptyList();
		}
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Person.class);
		Long id = MyModelUtils.parseLong(params.get("id"), 0l);
		if (id > 0) {
			detachedCriteria.add(Restrictions.eq("id", id));
		}
		String lastMacUpdated = params.get("lastMacUpdated");
		if (!StringUtils.isBlank(lastMacUpdated)) {
			detachedCriteria.add(Restrictions.eq("lastMacUpdated", lastMacUpdated));
		}
		return this.findListByDetachedCriteria(detachedCriteria,
				MyModelUtils.parseInt(params.get("fetchSize"), 0),
				MyModelUtils.parseInt(params.get("maxResult"), 5));
	}
	
	public Person findByParams(Map<String, String> params) {
		params.put("fetchSize", "0");
		params.put("maxResult", "1");
		List<Person> l = findAllByParams(params);
		if (null == l || l.isEmpty()) {
			return null;
		}
		return l.get(0);
	}


}
