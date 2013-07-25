package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.UserRolesDao;
import com.xone.model.hibernate.entity.UserRoles;
import com.xone.model.hibernate.support.Pagination;

public class UserRolesServiceImpl implements UserRolesService {
	private static final Log log = LogFactory.getLog(UserRolesServiceImpl.class);

	@Autowired
	protected UserRolesDao userRolesDao;

	@Override
	public UserRoles save(UserRoles entity) {
		return getUserRolesDao().save(entity);
	}
	
	@Override
	public UserRoles update(UserRoles entity) {
		return getUserRolesDao().update(entity);
	}
	
	@Override
	public void delete(UserRoles entity) {
		getUserRolesDao().deleteById(entity.getId());
	}

	@Override
	public UserRoles findById(Long id) {
		return getUserRolesDao().findById(id);
	}

	@Override
	public List<UserRoles> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(UserRoles.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		return getUserRolesDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(UserRoles.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getUserRolesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
		String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
		String userId = params.get("userId");
        if (!StringUtils.isBlank(userId)) {
            criteria.add(Restrictions.eq("userId", Long.parseLong(userId)));
        }
		String roleId = params.get("roleId");
        if (!StringUtils.isBlank(roleId)) {
            criteria.add(Restrictions.eq("roleId", Long.parseLong(roleId)));
        }
		String enable = params.get("enable");
        if (!StringUtils.isBlank(enable)) {
            criteria.add(Restrictions.like("enable", "%" + enable + "%"));
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

	public UserRolesDao getUserRolesDao() {
		return userRolesDao;
	}

	public void setUserRolesDao(UserRolesDao userRolesDao) {
		this.userRolesDao = userRolesDao;
	}
	
}
