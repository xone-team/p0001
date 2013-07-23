package com.xone.service.app;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.AdbannerDao;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.support.Pagination;

public class AdbannerServiceImpl implements AdbannerService {

	@Autowired
	protected AdbannerDao adbannerDao;

	@Override
	public Adbanner save(Adbanner entity) {
		return getAdbannerDao().save(entity);
	}
	
	@Override
	public Adbanner update(Adbanner entity) {
		return getAdbannerDao().update(entity);
	}
	
	@Override
	public void delete(Adbanner entity) {
		getAdbannerDao().deleteById(entity.getId());
	}
	@Override
	public Adbanner findById(Long id) {
		return getAdbannerDao().findById(id);
	}
	
	@Override
	public List<Adbanner> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Adbanner.class);
		String today = params.get("today");
		if (!StringUtils.isBlank(today)) {
			try {
				Date dateToday = DateUtils.parseDate(today, new String[] {
						"yyyy-MM-dd HH:mm:ss"
				});
				detachedCriteria.add(Restrictions.ge("adStart", dateToday));
				detachedCriteria.add(Restrictions.lt("adEnd", dateToday));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		detachedCriteria.add(Restrictions.eq("flagDeleted", Adbanner.FlagDeleted.NORMAL.getValue()));
		List<Adbanner> list =getAdbannerDao().findListByDetachedCriteria(detachedCriteria, 0, 10);
		return list;
	}
	
	@Override
	public List<Adbanner> findItemsByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Adbanner.class);
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
		if (!StringUtils.isBlank(params.get("userId"))) {
			detachedCriteria.add(Restrictions.eq("userId", Long.parseLong(params.get("userId"))));
		}
		detachedCriteria.add(Restrictions.eq("flagDeleted", Adbanner.FlagDeleted.NORMAL.getValue()));
		detachedCriteria.addOrder(Order.desc("dateCreated"));
		List<Adbanner> list = getAdbannerDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
		return list;
	}

	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Adbanner.class);
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getAdbannerDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}

	public AdbannerDao getAdbannerDao() {
		return adbannerDao;
	}

	public void setAdbannerDao(AdbannerDao adbannerDao) {
		this.adbannerDao = adbannerDao;
	}
	
}