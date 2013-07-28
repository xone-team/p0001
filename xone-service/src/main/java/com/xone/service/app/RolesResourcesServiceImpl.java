package com.xone.service.app;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
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

import com.ibatis.sqlmap.client.SqlMapClient;
import com.xone.model.hibernate.app.RolesResourcesDao;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.entity.RolesResources;
import com.xone.model.hibernate.support.Pagination;
public class RolesResourcesServiceImpl implements RolesResourcesService {
    
    private static final Log log = LogFactory.getLog(RolesResourcesServiceImpl.class);

	@Autowired
	protected RolesResourcesDao rolesResourcesDao;
	
	protected SqlMapClient sqlMapClient;

	@Override
	public RolesResources save(RolesResources entity) {
		return getRolesResourcesDao().save(entity);
	}
	
	@Override
	public RolesResources update(RolesResources entity) {
		return getRolesResourcesDao().update(entity);
	}
	
	@Override
	public void delete(RolesResources entity) {
		getRolesResourcesDao().deleteById(entity.getId());
	}
	@Override
	public RolesResources findById(Long id) {
		return getRolesResourcesDao().findById(id);
	}

	@Override
	public List<RolesResources> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(RolesResources.class);
		
		handleCriteriaByParams(detachedCriteria, params);
		
		return getRolesResourcesDao().findListByDetachedCriteria(
				detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(RolesResources.class);
		
		handleCriteriaByParams(detachedCriteria, params);
		
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getRolesResourcesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
    
    @Override
    @SuppressWarnings("unchecked")
    public List<Roles> findRolesByRes(Map<String, Object> params) {
        List<Roles> result = null;
        try {
            result = sqlMapClient.queryForList("roleRel.roleRelRes", params);
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
        }
        
        return result == null ? new ArrayList<Roles>() : result;
    }
    
    @Override
    public void updateResRoles(Long resourceId, List<Long> roleIds){
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RolesResources.class);
        detachedCriteria.add(Restrictions.eq("resourceId", resourceId));
        List<RolesResources> originRels = getRolesResourcesDao().findByDetachedCriteria(detachedCriteria);
        for (Iterator<RolesResources> iterator = originRels.iterator(); iterator.hasNext();) {
            RolesResources userRoles = (RolesResources) iterator.next();
            getRolesResourcesDao().delete(userRoles);
        }
        for (Iterator<Long> iterator = roleIds.iterator(); iterator.hasNext();) {
            Long roleId = (Long) iterator.next();
            RolesResources userRoles = new RolesResources();
            userRoles.setResourceId(resourceId);
            userRoles.setRoleId(roleId);
            userRoles.setEnable("1");
            getRolesResourcesDao().save(userRoles);
        }
    }

	
    protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
        String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
        String idMin = params.get("idMin");
        if (!StringUtils.isBlank(idMin)) {
            criteria.add(Restrictions.ge("id", Long.parseLong(idMin)));
        }
        String idMax = params.get("idMax");
        if (!StringUtils.isBlank(idMax)) {
            criteria.add(Restrictions.le("id", Long.parseLong(idMax)));
        }
        String resourceId = params.get("resourceId");
        if (!StringUtils.isBlank(resourceId)) {
            criteria.add(Restrictions.eq("resourceId", Long.parseLong(resourceId)));
        }
        String resourceIdMin = params.get("resourceIdMin");
        if (!StringUtils.isBlank(resourceIdMin)) {
            criteria.add(Restrictions.ge("resourceId", Long.parseLong(resourceIdMin)));
        }
        String resourceIdMax = params.get("resourceIdMax");
        if (!StringUtils.isBlank(resourceIdMax)) {
            criteria.add(Restrictions.le("resourceId", Long.parseLong(resourceIdMax)));
        }
        String roleId = params.get("roleId");
        if (!StringUtils.isBlank(roleId)) {
            criteria.add(Restrictions.eq("roleId", Long.parseLong(roleId)));
        }
        String roleIdMin = params.get("roleIdMin");
        if (!StringUtils.isBlank(roleIdMin)) {
            criteria.add(Restrictions.ge("roleId", Long.parseLong(roleIdMin)));
        }
        String roleIdMax = params.get("roleIdMax");
        if (!StringUtils.isBlank(roleIdMax)) {
            criteria.add(Restrictions.le("roleId", Long.parseLong(roleIdMax)));
        }
        String enable = params.get("enable");
        if (!StringUtils.isBlank(enable)) {
            criteria.add(Restrictions.like("enable", "%" + enable + "%"));
        }
        String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            criteria.add(Restrictions.eq("userCreated", Long.parseLong(userCreated)));
        }
        String userCreatedMin = params.get("userCreatedMin");
        if (!StringUtils.isBlank(userCreatedMin)) {
            criteria.add(Restrictions.ge("userCreated", Long.parseLong(userCreatedMin)));
        }
        String userCreatedMax = params.get("userCreatedMax");
        if (!StringUtils.isBlank(userCreatedMax)) {
            criteria.add(Restrictions.le("userCreated", Long.parseLong(userCreatedMax)));
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
        String userUpdatedMin = params.get("userUpdatedMin");
        if (!StringUtils.isBlank(userUpdatedMin)) {
            criteria.add(Restrictions.ge("userUpdated", Long.parseLong(userUpdatedMin)));
        }
        String userUpdatedMax = params.get("userUpdatedMax");
        if (!StringUtils.isBlank(userUpdatedMax)) {
            criteria.add(Restrictions.le("userUpdated", Long.parseLong(userUpdatedMax)));
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
	
	public RolesResourcesDao getRolesResourcesDao() {
		return rolesResourcesDao;
	}

	public void setRolesResourcesDao(RolesResourcesDao rolesResourcesDao) {
		this.rolesResourcesDao = rolesResourcesDao;
	}

    public void setSqlMapClient(SqlMapClient sqlMapClient) {
        this.sqlMapClient = sqlMapClient;
    }

}