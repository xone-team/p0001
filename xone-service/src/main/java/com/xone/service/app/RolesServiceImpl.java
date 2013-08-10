package com.xone.service.app;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.RowBounds;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ResourcesDao;
import com.xone.model.hibernate.app.RolesDao;
import com.xone.model.hibernate.app.RolesResourcesDao;
import com.xone.model.hibernate.app.UserRolesDao;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Resources;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.entity.RolesResources;
import com.xone.model.hibernate.entity.UserRoles;
import com.xone.model.hibernate.mybatis.mapper.RolesMapper;
import com.xone.model.hibernate.support.Pagination;

public class RolesServiceImpl implements RolesService {

    private static final Log log = LogFactory.getLog(RolesServiceImpl.class);

    @Autowired
    protected RolesDao rolesDao;

    @Autowired
    protected UserRolesDao userRolesDao;

    @Autowired
    protected ResourcesDao resourcesDao;

    @Autowired
    protected RolesResourcesDao rolesResourcesDao;

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
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Roles.class);
        
        handleCriteriaByParams(detachedCriteria, params);
        
        return getRolesDao().findListByDetachedCriteria(detachedCriteria, 0, 10);
    }

    public Pagination findByParams(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Roles.class);
        
        handleCriteriaByParams(detachedCriteria, params);
        
        int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
        int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
        return getRolesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
    }

    @Override
    public List<Roles> findAllByUser(Person person) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Roles.class);
        List<UserRoles> userRoles = getUserRolesDao().findByProperty("userId", person.getId());
        if (null == userRoles || userRoles.isEmpty()) {
            return Collections.emptyList();
        }
        List<Long> roleIds = new ArrayList<Long>();
        for (UserRoles ur : userRoles) {
            roleIds.add(ur.getRoleId());
        }
        detachedCriteria.add(Restrictions.in("id", roleIds));
        List<Roles> roles = getRolesDao().findByDetachedCriteria(detachedCriteria);
        if (null == roles || roles.isEmpty()) {
            return Collections.emptyList();
        }
        return roles;
        // .findListByDetachedCriteria(detachedCriteria, 0, 10);
    }

    @Override
    public List<Resources> findAllByRoles(List<Roles> roles) {
        if (null == roles || roles.isEmpty()) {
            return Collections.emptyList();
        }
        List<Long> roleIds = new ArrayList<Long>();
        for (Roles r : roles) {
            roleIds.add(r.getId());
        }
        DetachedCriteria rolesResourcesCriteria = DetachedCriteria.forClass(RolesResources.class);
        rolesResourcesCriteria.add(Restrictions.in("roleId", roleIds));
        List<RolesResources> listResources = getRolesResourcesDao().findByDetachedCriteria(rolesResourcesCriteria);
        if (null != listResources && !listResources.isEmpty()) {
            List<Long> resourceIds = new ArrayList<Long>();
            for (RolesResources rr : listResources) {
                resourceIds.add(rr.getResourceId());
            }
            if (null == resourceIds || resourceIds.isEmpty()) {
                return Collections.emptyList();
            }
            DetachedCriteria resourcesCriteria = DetachedCriteria.forClass(Resources.class);
            resourcesCriteria.add(Restrictions.in("id", resourceIds));
            return getResourcesDao().findByDetachedCriteria(resourcesCriteria);
        }
        return Collections.emptyList();
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

    public RolesDao getRolesDao() {
        return rolesDao;
    }

    public void setRolesDao(RolesDao rolesDao) {
        this.rolesDao = rolesDao;
    }

    public UserRolesDao getUserRolesDao() {
        return userRolesDao;
    }

    public void setUserRolesDao(UserRolesDao userRolesDao) {
        this.userRolesDao = userRolesDao;
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

}