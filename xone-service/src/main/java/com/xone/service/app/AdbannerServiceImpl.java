package com.xone.service.app;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.lang.xwork.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.AdbannerDao;
import com.xone.model.hibernate.entity.Adbanner;

public class AdbannerServiceImpl implements AdbannerService {

	@Autowired
	protected AdbannerDao adbannerDao;

	@Override
	public Adbanner save(Adbanner entity) {
		return getAdbannerDao().save(entity);
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

	public AdbannerDao getAdbannerDao() {
		return adbannerDao;
	}

	public void setAdbannerDao(AdbannerDao adbannerDao) {
		this.adbannerDao = adbannerDao;
	}
	
}