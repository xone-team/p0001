package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.AdbannerDao;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.support.Pagination;

public class AdbannerServiceImpl implements AdbannerService {
	private static final Log log = LogFactory.getLog(AdbannerServiceImpl.class);

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
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Adbanner.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		return getAdbannerDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Adbanner.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getAdbannerDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
		String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
		String refId = params.get("refId");
        if (!StringUtils.isBlank(refId)) {
            criteria.add(Restrictions.eq("refId", Long.parseLong(refId)));
        }
		String adType = params.get("adType");
        if (!StringUtils.isBlank(adType)) {
            criteria.add(Restrictions.like("adType", "%" + adType + "%"));
        }
		String adRefId = params.get("adRefId");
        if (!StringUtils.isBlank(adRefId)) {
            criteria.add(Restrictions.eq("adRefId", Long.parseLong(adRefId)));
        }
        String adStartMin = params.get("adStartMin");
        if (!StringUtils.isBlank(adStartMin)) {
            try {
                criteria.add(Restrictions.ge("adStart", DateUtils.parseDate(adStartMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[adStartMin] parsed exception :", e);
            }
        }
        String adStartMax = params.get("adStartMax");
        if (!StringUtils.isBlank(adStartMax)) {
            try {
                criteria.add(Restrictions.lt("adStart", DateUtils.addDays(DateUtils.parseDate(adStartMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[adStartMax] parsed exception :", e);
            }
        }
        String adEndMin = params.get("adEndMin");
        if (!StringUtils.isBlank(adEndMin)) {
            try {
                criteria.add(Restrictions.ge("adEnd", DateUtils.parseDate(adEndMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[adEndMin] parsed exception :", e);
            }
        }
        String adEndMax = params.get("adEndMax");
        if (!StringUtils.isBlank(adEndMax)) {
            try {
                criteria.add(Restrictions.lt("adEnd", DateUtils.addDays(DateUtils.parseDate(adEndMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[adEndMax] parsed exception :", e);
            }
        }
		String userId = params.get("userId");
        if (!StringUtils.isBlank(userId)) {
            criteria.add(Restrictions.eq("userId", Long.parseLong(userId)));
        }
		String flagDeleted = params.get("flagDeleted");
        if (!StringUtils.isBlank(flagDeleted)) {
            criteria.add(Restrictions.like("flagDeleted", "%" + flagDeleted + "%"));
        }
		String userApply = params.get("userApply");
        if (!StringUtils.isBlank(userApply)) {
            criteria.add(Restrictions.eq("userApply", Long.parseLong(userApply)));
        }
        String dateApplyMin = params.get("dateApplyMin");
        if (!StringUtils.isBlank(dateApplyMin)) {
            try {
                criteria.add(Restrictions.ge("dateApply", DateUtils.parseDate(dateApplyMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[dateApplyMin] parsed exception :", e);
            }
        }
        String dateApplyMax = params.get("dateApplyMax");
        if (!StringUtils.isBlank(dateApplyMax)) {
            try {
                criteria.add(Restrictions.lt("dateApply", DateUtils.addDays(DateUtils.parseDate(dateApplyMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[dateApplyMax] parsed exception :", e);
            }
        }
		String userCheck = params.get("userCheck");
        if (!StringUtils.isBlank(userCheck)) {
            criteria.add(Restrictions.eq("userCheck", Long.parseLong(userCheck)));
        }
        String dateCheckMin = params.get("dateCheckMin");
        if (!StringUtils.isBlank(dateCheckMin)) {
            try {
                criteria.add(Restrictions.ge("dateCheck", DateUtils.parseDate(dateCheckMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[dateCheckMin] parsed exception :", e);
            }
        }
        String dateCheckMax = params.get("dateCheckMax");
        if (!StringUtils.isBlank(dateCheckMax)) {
            try {
                criteria.add(Restrictions.lt("dateCheck", DateUtils.addDays(DateUtils.parseDate(dateCheckMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[dateCheckMax] parsed exception :", e);
            }
        }
		String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            criteria.add(Restrictions.eq("userCreated", Long.parseLong(userCreated)));
        }
        String dateCreatedMin = params.get("dateCreatedMin");
        if (!StringUtils.isBlank(dateCreatedMin)) {
            try {
                criteria.add(Restrictions.ge("dateCreated", DateUtils.parseDate(dateCreatedMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[dateCreatedMin] parsed exception :", e);
            }
        }
        String dateCreatedMax = params.get("dateCreatedMax");
        if (!StringUtils.isBlank(dateCreatedMax)) {
            try {
                criteria.add(Restrictions.lt("dateCreated", DateUtils.addDays(DateUtils.parseDate(dateCreatedMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[dateCreatedMax] parsed exception :", e);
            }
        }
		String userUpdated = params.get("userUpdated");
        if (!StringUtils.isBlank(userUpdated)) {
            criteria.add(Restrictions.eq("userUpdated", Long.parseLong(userUpdated)));
        }
        String lastUpdatedMin = params.get("lastUpdatedMin");
        if (!StringUtils.isBlank(lastUpdatedMin)) {
            try {
                criteria.add(Restrictions.ge("lastUpdated", DateUtils.parseDate(lastUpdatedMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[lastUpdatedMin] parsed exception :", e);
            }
        }
        String lastUpdatedMax = params.get("lastUpdatedMax");
        if (!StringUtils.isBlank(lastUpdatedMax)) {
            try {
                criteria.add(Restrictions.lt("lastUpdated", DateUtils.addDays(DateUtils.parseDate(lastUpdatedMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[lastUpdatedMax] parsed exception :", e);
            }
        }
        
        criteria.addOrder(Order.desc("dateCreated"));
	}

	public AdbannerDao getAdbannerDao() {
		return adbannerDao;
	}

	public void setAdbannerDao(AdbannerDao adbannerDao) {
		this.adbannerDao = adbannerDao;
	}
	
}
