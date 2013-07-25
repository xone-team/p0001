package com.xone.service.app;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
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

import com.xone.model.hibernate.app.ResourcesDao;
import com.xone.model.hibernate.app.RolesDao;
import com.xone.model.hibernate.app.RolesResourcesDao;
import com.xone.model.hibernate.entity.Resources;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.entity.RolesResources;
import com.xone.model.hibernate.support.Pagination;

public class ResourcesServiceImpl implements ResourcesService {
    private static final Log log = LogFactory.getLog(ResourcesServiceImpl.class);

    @Autowired
    protected ResourcesDao resourcesDao;

    @Autowired
    protected RolesResourcesDao rolesResourcesDao;

    @Autowired
    protected RolesDao rolesDao;

    @Override
    public Resources save(Resources entity) {
        return getResourcesDao().save(entity);
    }

    @Override
    public Resources update(Resources entity) {
        return getResourcesDao().update(entity);
    }

    @Override
    public void delete(Resources entity) {
        getResourcesDao().deleteById(entity.getId());
    }

    @Override
    public Resources findById(Long id) {
        return getResourcesDao().findById(id);
    }

    @Override
    public List<Resources> findAllByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Resources.class);
        return getResourcesDao().findListByDetachedCriteria(detachedCriteria, 0, 10);
    }

    public Map<Resources, List<Roles>> findMapByParams(Map<String, String> params) {
        List<Resources> resourcesList = new ArrayList<Resources>();
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Resources.class);
        resourcesList = getResourcesDao().findByDetachedCriteria(detachedCriteria);
        if (null == resourcesList || resourcesList.isEmpty()) {
            return Collections.emptyMap();
        }
        List<Long> resourcesIds = new ArrayList<Long>();
        Map<Long, Resources> mapResources = new HashMap<Long, Resources>();
        for (Resources r : resourcesList) {
            resourcesIds.add(r.getId());
            mapResources.put(r.getId(), r);
        }
        DetachedCriteria rolesCriteria = DetachedCriteria.forClass(Roles.class);
        List<Roles> rolesList = getRolesDao().findByDetachedCriteria(rolesCriteria);
        if (null == rolesList || rolesList.isEmpty()) {
            return Collections.emptyMap();
        }
        Map<Long, Roles> mapRoles = new HashMap<Long, Roles>();
        for (Roles r : rolesList) {
            mapRoles.put(r.getId(), r);
        }
        DetachedCriteria rolesResourcesCriteria = DetachedCriteria.forClass(RolesResources.class);
        List<RolesResources> rolesResourcesList = getRolesResourcesDao().findByDetachedCriteria(rolesResourcesCriteria);
        if (null == rolesResourcesList || rolesResourcesList.isEmpty()) {
            return Collections.emptyMap();
        }
        Map<Resources, List<Roles>> mapRolesResources = new HashMap<Resources, List<Roles>>();
        for (RolesResources rr : rolesResourcesList) {
            if (null == rr.getResourceId() || null == rr.getRoleId()) {
                continue;
            }
            Resources r = mapResources.get(rr.getResourceId());
            if (null == r) {
                continue;
            }
            Roles roles = mapRoles.get(rr.getRoleId());
            if (null == roles) {
                continue;
            }
            List<Roles> rList = mapRolesResources.get(r);
            if (null == rList) {
                rList = new ArrayList<Roles>();
            }
            rList.add(roles);
            mapRolesResources.put(r, rList);
        }
        return mapRolesResources;
    }

    public Pagination findByParams(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Resources.class);

        handleCriteriaByParams(detachedCriteria, params);

        int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
        int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
        return getResourcesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
    }

    protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params) {
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
        String name = params.get("name");
        if (!StringUtils.isBlank(name)) {
            criteria.add(Restrictions.like("name", "%" + name + "%"));
        }
        String resourceType = params.get("resourceType");
        if (!StringUtils.isBlank(resourceType)) {
            criteria.add(Restrictions.eq("resourceType", new Integer(resourceType)));
        }
        String resourceTypeMin = params.get("resourceTypeMin");
        if (!StringUtils.isBlank(resourceTypeMin)) {
            criteria.add(Restrictions.ge("resourceType", new Integer(resourceTypeMin)));
        }
        String resourceTypeMax = params.get("resourceTypeMax");
        if (!StringUtils.isBlank(resourceTypeMax)) {
            criteria.add(Restrictions.le("resourceType", new Integer(resourceTypeMax)));
        }
        String priority = params.get("priority");
        if (!StringUtils.isBlank(priority)) {
            criteria.add(Restrictions.eq("priority", new Integer(priority)));
        }
        String priorityMin = params.get("priorityMin");
        if (!StringUtils.isBlank(priorityMin)) {
            criteria.add(Restrictions.ge("priority", new Integer(priorityMin)));
        }
        String priorityMax = params.get("priorityMax");
        if (!StringUtils.isBlank(priorityMax)) {
            criteria.add(Restrictions.le("priority", new Integer(priorityMax)));
        }
        String resourceUrl = params.get("resourceUrl");
        if (!StringUtils.isBlank(resourceUrl)) {
            criteria.add(Restrictions.like("resourceUrl", "%" + resourceUrl + "%"));
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
                criteria.add(Restrictions.ge("dateCreated", DateUtils.parseDate(dateCreatedMin, "yyyy-MM-dd")));
            } catch (ParseException e) {
                log.error("[dateCreatedMin] parsed exception :", e);
            }
        }
        String dateCreatedMax = params.get("dateCreatedMax");
        if (!StringUtils.isBlank(dateCreatedMax)) {
            try {
                criteria.add(Restrictions.lt("dateCreated", DateUtils.addDays(DateUtils.parseDate(dateCreatedMax, "yyyy-MM-dd"), 1)));
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
                criteria.add(Restrictions.ge("lastUpdated", DateUtils.parseDate(lastUpdatedMin, "yyyy-MM-dd")));
            } catch (ParseException e) {
                log.error("[lastUpdatedMin] parsed exception :", e);
            }
        }
        String lastUpdatedMax = params.get("lastUpdatedMax");
        if (!StringUtils.isBlank(lastUpdatedMax)) {
            try {
                criteria.add(Restrictions.lt("lastUpdated", DateUtils.addDays(DateUtils.parseDate(lastUpdatedMax, "yyyy-MM-dd"), 1)));
            } catch (ParseException e) {
                log.error("[lastUpdatedMax] parsed exception :", e);
            }
        }

        criteria.addOrder(Order.desc("dateCreated"));
    }

    public ResourcesDao getResourcesDao() {
        return resourcesDao;
    }

    public void setResourcesDao(ResourcesDao resourcesDao) {
        this.resourcesDao = resourcesDao;
    }

    public RolesResourcesDao getRolesResourcesDao() {
        return rolesResourcesDao;
    }

    public void setRolesResourcesDao(RolesResourcesDao rolesResourcesDao) {
        this.rolesResourcesDao = rolesResourcesDao;
    }

    public RolesDao getRolesDao() {
        return rolesDao;
    }

    public void setRolesDao(RolesDao rolesDao) {
        this.rolesDao = rolesDao;
    }

}