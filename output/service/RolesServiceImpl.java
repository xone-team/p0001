package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.RolesDao;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.support.Pagination;

public class RolesServiceImpl implements RolesService {
	private static final Log log = LogFactory.getLog(RolesServiceImpl.class);

	@Autowired
	protected RolesDao rolesDao;

	@Override
	public Roles save(Roles entity) {
		return getRolesDao().save(entity);
	}
	
	@Override
	public Roles update(Roles entity) {
		return getRolesDao().update(entity);
	}
	
	@Override
	public void delete(Roles entity) {
		getRolesDao().deleteById(entity.getId());
	}

	@Override
	public Roles findById(Long id) {
		return getRolesDao().findById(id);
	}

	@Override
	public List<Roles> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Roles.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		return getRolesDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Roles.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getRolesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
		String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
		String name = params.get("name");
        if (!StringUtils.isBlank(name)) {
            criteria.add(Restrictions.like("name", "%" + name + "%"));
        }
		String remark = params.get("remark");
        if (!StringUtils.isBlank(remark)) {
            criteria.add(Restrictions.like("remark", "%" + remark + "%"));
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

	public RolesDao getRolesDao() {
		return rolesDao;
	}

	public void setRolesDao(RolesDao rolesDao) {
		this.rolesDao = rolesDao;
	}
	
}
