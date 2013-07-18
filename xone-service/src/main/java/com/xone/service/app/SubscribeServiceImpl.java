package com.xone.service.app;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.lang.xwork.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.SubscribeDao;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.entity.Subscribe;

public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	protected SubscribeDao subscribeDao;

	@Override
	public Subscribe save(Subscribe entity) {
		return getSubscribeDao().save(entity);
	}

	@Override
	public Subscribe findById(Long id) {
		return getSubscribeDao().findById(id);
	}

	@Override
	public List<Subscribe> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Subscribe.class);
		String gtDateCreated = params.get("gtDateCreated");
		if (!StringUtils.isBlank(gtDateCreated)) {
			try {
				detachedCriteria.add(Restrictions.gt("dateCreated", DateUtils.parseDate(gtDateCreated, new String[] {
						"yyyy-MM-dd HH:mm:ss"
				})));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		String ltDateCreated = params.get("ltDateCreated");
		if (!StringUtils.isBlank(ltDateCreated)) {
			try {
				detachedCriteria.add(Restrictions.lt("dateCreated", DateUtils.parseDate(ltDateCreated, new String[] {
						"yyyy-MM-dd HH:mm:ss"
				})));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (!StringUtils.isBlank(params.get("refId"))) {
			detachedCriteria.add(Restrictions.eq("refId", Long.parseLong(params.get("refId"))));
		}
		detachedCriteria.add(Restrictions.eq("flagDeleted", Adbanner.FlagDeleted.NORMAL.getValue()));
		detachedCriteria.addOrder(Order.desc("dateCreated"));
		return getSubscribeDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
	}

	public SubscribeDao getSubscribeDao() {
		return subscribeDao;
	}

	public void setSubscribeDao(SubscribeDao subscribeDao) {
		this.subscribeDao = subscribeDao;
	}
	
}