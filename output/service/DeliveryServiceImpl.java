package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.DeliveryDao;
import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.support.Pagination;

public class DeliveryServiceImpl implements DeliveryService {
	private static final Log log = LogFactory.getLog(DeliveryServiceImpl.class);

	@Autowired
	protected DeliveryDao deliveryDao;

	@Override
	public Delivery save(Delivery entity) {
		return getDeliveryDao().save(entity);
	}
	
	@Override
	public Delivery update(Delivery entity) {
		return getDeliveryDao().update(entity);
	}
	
	@Override
	public void delete(Delivery entity) {
		getDeliveryDao().deleteById(entity.getId());
	}

	@Override
	public Delivery findById(Long id) {
		return getDeliveryDao().findById(id);
	}

	@Override
	public List<Delivery> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Delivery.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		return getDeliveryDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Delivery.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getDeliveryDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
		String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
		String productId = params.get("productId");
        if (!StringUtils.isBlank(productId)) {
            criteria.add(Restrictions.eq("productId", Long.parseLong(productId)));
        }
		String marketarea = params.get("marketarea");
        if (!StringUtils.isBlank(marketarea)) {
            criteria.add(Restrictions.like("marketarea", "%" + marketarea + "%"));
        }
		String determini = params.get("determini");
        if (!StringUtils.isBlank(determini)) {
            criteria.add(Restrictions.like("determini", "%" + determini + "%"));
        }
		String loadtime = params.get("loadtime");
        if (!StringUtils.isBlank(loadtime)) {
            criteria.add(Restrictions.like("loadtime", "%" + loadtime + "%"));
        }
		String loadaddress = params.get("loadaddress");
        if (!StringUtils.isBlank(loadaddress)) {
            criteria.add(Restrictions.like("loadaddress", "%" + loadaddress + "%"));
        }
		String boxNum = params.get("boxNum");
        if (!StringUtils.isBlank(boxNum)) {
            criteria.add(Restrictions.like("boxNum", "%" + boxNum + "%"));
        }
		String unitNum = params.get("unitNum");
        if (!StringUtils.isBlank(unitNum)) {
            criteria.add(Restrictions.like("unitNum", "%" + unitNum + "%"));
        }
		String boxTotal = params.get("boxTotal");
        if (!StringUtils.isBlank(boxTotal)) {
            criteria.add(Restrictions.like("boxTotal", "%" + boxTotal + "%"));
        }
		String totalWeight = params.get("totalWeight");
        if (!StringUtils.isBlank(totalWeight)) {
            criteria.add(Restrictions.like("totalWeight", "%" + totalWeight + "%"));
        }
		String flagPass = params.get("flagPass");
        if (!StringUtils.isBlank(flagPass)) {
            criteria.add(Restrictions.like("flagPass", "%" + flagPass + "%"));
        }
		String remark = params.get("remark");
        if (!StringUtils.isBlank(remark)) {
            criteria.add(Restrictions.like("remark", "%" + remark + "%"));
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

	public DeliveryDao getDeliveryDao() {
		return deliveryDao;
	}

	public void setDeliveryDao(DeliveryDao deliveryDao) {
		this.deliveryDao = deliveryDao;
	}
	
}
