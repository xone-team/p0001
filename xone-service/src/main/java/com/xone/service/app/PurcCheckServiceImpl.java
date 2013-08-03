package com.xone.service.app;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.PurcCheckDao;
import com.xone.model.hibernate.entity.PurcCheck;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.utils.MyServerUtils;

public class PurcCheckServiceImpl implements PurcCheckService {
	private static final Log log = LogFactory.getLog(PurcCheckServiceImpl.class);

	@Autowired
	protected PurcCheckDao purcCheckDao;

	@Override
	public PurcCheck save(PurcCheck entity) {
		return getPurcCheckDao().save(entity);
	}
	
	@Override
	public PurcCheck update(PurcCheck entity) {
		return getPurcCheckDao().update(entity);
	}
	
	@Override
	public void delete(PurcCheck entity) {
		getPurcCheckDao().deleteById(entity.getId());
	}

	@Override
	public PurcCheck findById(Long id) {
		return getPurcCheckDao().findById(id);
	}
	
	@Override
    public PurcCheck findByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(PurcCheck.class);

        handleCriteriaByParams(detachedCriteria, params);
        
        List<PurcCheck> l = getPurcCheckDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
        if (null == l) {
            return new PurcCheck();
        }
        return l.get(0);
    }

	@Override
	public List<PurcCheck> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(PurcCheck.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		return getPurcCheckDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(PurcCheck.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		int pageSize = MyServerUtils.parseInteger(params.get("pageSize"), 20);
		int startIndex = MyServerUtils.parseInteger(params.get("pageNo"), 0);
		return getPurcCheckDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
		String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", new Long(id)));
        }
		String idMin = params.get("idMin");
        if (!StringUtils.isBlank(idMin)) {
            criteria.add(Restrictions.ge("id", new Long(idMin)));
        }
		String idMax = params.get("idMax");
        if (!StringUtils.isBlank(idMax)) {
            criteria.add(Restrictions.le("id", new Long(idMax)));
        }
		String purchaseId = params.get("purchaseId");
        if (!StringUtils.isBlank(purchaseId)) {
            criteria.add(Restrictions.eq("purchaseId", new Long(purchaseId)));
        }
		String purchaseIdMin = params.get("purchaseIdMin");
        if (!StringUtils.isBlank(purchaseIdMin)) {
            criteria.add(Restrictions.ge("purchaseId", new Long(purchaseIdMin)));
        }
		String purchaseIdMax = params.get("purchaseIdMax");
        if (!StringUtils.isBlank(purchaseIdMax)) {
            criteria.add(Restrictions.le("purchaseId", new Long(purchaseIdMax)));
        }
		String checkStatus = params.get("checkStatus");
        if (!StringUtils.isBlank(checkStatus)) {
            criteria.add(Restrictions.like("checkStatus", "%" + checkStatus + "%"));
        }
		String remark = params.get("remark");
        if (!StringUtils.isBlank(remark)) {
            criteria.add(Restrictions.like("remark", "%" + remark + "%"));
        }
		String userApply = params.get("userApply");
        if (!StringUtils.isBlank(userApply)) {
            criteria.add(Restrictions.eq("userApply", new Long(userApply)));
        }
		String userApplyMin = params.get("userApplyMin");
        if (!StringUtils.isBlank(userApplyMin)) {
            criteria.add(Restrictions.ge("userApply", new Long(userApplyMin)));
        }
		String userApplyMax = params.get("userApplyMax");
        if (!StringUtils.isBlank(userApplyMax)) {
            criteria.add(Restrictions.le("userApply", new Long(userApplyMax)));
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
            criteria.add(Restrictions.eq("userCheck", new Long(userCheck)));
        }
		String userCheckMin = params.get("userCheckMin");
        if (!StringUtils.isBlank(userCheckMin)) {
            criteria.add(Restrictions.ge("userCheck", new Long(userCheckMin)));
        }
		String userCheckMax = params.get("userCheckMax");
        if (!StringUtils.isBlank(userCheckMax)) {
            criteria.add(Restrictions.le("userCheck", new Long(userCheckMax)));
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
		String flagDeleted = params.get("flagDeleted");
        if (!StringUtils.isBlank(flagDeleted)) {
            criteria.add(Restrictions.like("flagDeleted", "%" + flagDeleted + "%"));
        }
		String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            criteria.add(Restrictions.eq("userCreated", new Long(userCreated)));
        }
		String userCreatedMin = params.get("userCreatedMin");
        if (!StringUtils.isBlank(userCreatedMin)) {
            criteria.add(Restrictions.ge("userCreated", new Long(userCreatedMin)));
        }
		String userCreatedMax = params.get("userCreatedMax");
        if (!StringUtils.isBlank(userCreatedMax)) {
            criteria.add(Restrictions.le("userCreated", new Long(userCreatedMax)));
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
            criteria.add(Restrictions.eq("userUpdated", new Long(userUpdated)));
        }
		String userUpdatedMin = params.get("userUpdatedMin");
        if (!StringUtils.isBlank(userUpdatedMin)) {
            criteria.add(Restrictions.ge("userUpdated", new Long(userUpdatedMin)));
        }
		String userUpdatedMax = params.get("userUpdatedMax");
        if (!StringUtils.isBlank(userUpdatedMax)) {
            criteria.add(Restrictions.le("userUpdated", new Long(userUpdatedMax)));
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

	public PurcCheckDao getPurcCheckDao() {
		return purcCheckDao;
	}

	public void setPurcCheckDao(PurcCheckDao purcCheckDao) {
		this.purcCheckDao = purcCheckDao;
	}
	
}
