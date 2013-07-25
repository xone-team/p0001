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

import com.xone.model.hibernate.app.SubscribeDao;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.hibernate.support.Pagination;
public class SubscribeServiceImpl implements SubscribeService {
    private static final Log log = LogFactory.getLog(SubscribeServiceImpl.class);

	@Autowired
	protected SubscribeDao subscribeDao;

	@Override
	public Subscribe save(Subscribe entity) {
		return getSubscribeDao().save(entity);
	}
	
	@Override
	public Subscribe update(Subscribe entity) {
		return getSubscribeDao().update(entity);
	}
	
	@Override
	public void delete(Subscribe entity) {
		getSubscribeDao().deleteById(entity.getId());
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
//		if (!StringUtils.isBlank(params.get("refId"))) {
//			detachedCriteria.add(Restrictions.eq("refId", Long.parseLong(params.get("refId"))));
//		}
//		detachedCriteria.add(Restrictions.eq("flagDeleted", Adbanner.FlagDeleted.NORMAL.getValue()));
//		detachedCriteria.addOrder(Order.desc("dateCreated"));
		
		handleCriteriaByParams(detachedCriteria, params);
		
		return getSubscribeDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Subscribe.class);
		
		handleCriteriaByParams(detachedCriteria, params);
		
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getSubscribeDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	   protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
	        String id = params.get("id");
	        if (!StringUtils.isBlank(id)) {
	            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
	        }
	        String marketarea = params.get("marketarea");
	        if (!StringUtils.isBlank(marketarea)) {
	            criteria.add(Restrictions.like("marketarea", "%" + marketarea + "%"));
	        }
	        String productNameKey = params.get("productNameKey");
	        if (!StringUtils.isBlank(productNameKey)) {
	            criteria.add(Restrictions.like("productNameKey", "%" + productNameKey + "%"));
	        }
	        String saleType = params.get("saleType");
	        if (!StringUtils.isBlank(saleType)) {
	            criteria.add(Restrictions.like("saleType", "%" + saleType + "%"));
	        }
	        String credit = params.get("credit");
	        if (!StringUtils.isBlank(credit)) {
	            criteria.add(Restrictions.like("credit", "%" + credit + "%"));
	        }
	        String refId = params.get("refId");
	        if (!StringUtils.isBlank(refId)) {
	            criteria.add(Restrictions.eq("refId", Long.parseLong(refId)));
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
	        String flagDeleted = params.get("flagDeleted");
	        if (!StringUtils.isBlank(flagDeleted)) {
	            criteria.add(Restrictions.like("flagDeleted", "%" + flagDeleted + "%"));
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
	
	public SubscribeDao getSubscribeDao() {
		return subscribeDao;
	}

	public void setSubscribeDao(SubscribeDao subscribeDao) {
		this.subscribeDao = subscribeDao;
	}
	
}