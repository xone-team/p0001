package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.PurchaseDao;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;

public class PurchaseServiceImpl implements PurchaseService {
	private static final Log log = LogFactory.getLog(PurchaseServiceImpl.class);

	@Autowired
	protected PurchaseDao purchaseDao;

	@Override
	public Purchase save(Purchase entity) {
		return getPurchaseDao().save(entity);
	}
	
	@Override
	public Purchase update(Purchase entity) {
		return getPurchaseDao().update(entity);
	}
	
	@Override
	public void delete(Purchase entity) {
		getPurchaseDao().deleteById(entity.getId());
	}

	@Override
	public Purchase findById(Long id) {
		return getPurchaseDao().findById(id);
	}

	@Override
	public List<Purchase> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Purchase.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		return getPurchaseDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Purchase.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getPurchaseDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
		String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
		String purchaseName = params.get("purchaseName");
        if (!StringUtils.isBlank(purchaseName)) {
            criteria.add(Restrictions.like("purchaseName", "%" + purchaseName + "%"));
        }
		String purchaseType = params.get("purchaseType");
        if (!StringUtils.isBlank(purchaseType)) {
            criteria.add(Restrictions.like("purchaseType", "%" + purchaseType + "%"));
        }
		String purchaseNum = params.get("purchaseNum");
        if (!StringUtils.isBlank(purchaseNum)) {
            criteria.add(Restrictions.like("purchaseNum", "%" + purchaseNum + "%"));
        }
        String purchaseValidMin = params.get("purchaseValidMin");
        if (!StringUtils.isBlank(purchaseValidMin)) {
            try {
                criteria.add(Restrictions.ge("purchaseValid", DateUtils.parseDate(purchaseValidMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[purchaseValidMin] parsed exception :", e);
            }
        }
        String purchaseValidMax = params.get("purchaseValidMax");
        if (!StringUtils.isBlank(purchaseValidMax)) {
            try {
                criteria.add(Restrictions.lt("purchaseValid", DateUtils.addDays(DateUtils.parseDate(purchaseValidMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[purchaseValidMax] parsed exception :", e);
            }
        }
		String purchaseAddress = params.get("purchaseAddress");
        if (!StringUtils.isBlank(purchaseAddress)) {
            criteria.add(Restrictions.like("purchaseAddress", "%" + purchaseAddress + "%"));
        }
		String purchaseLocation = params.get("purchaseLocation");
        if (!StringUtils.isBlank(purchaseLocation)) {
            criteria.add(Restrictions.like("purchaseLocation", "%" + purchaseLocation + "%"));
        }
		String purchaseDesc = params.get("purchaseDesc");
        if (!StringUtils.isBlank(purchaseDesc)) {
            criteria.add(Restrictions.like("purchaseDesc", "%" + purchaseDesc + "%"));
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

	public PurchaseDao getPurchaseDao() {
		return purchaseDao;
	}

	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
}
