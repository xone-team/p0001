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
import com.xone.model.hibernate.app.UserRolesDao;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.entity.UserRoles;
import com.xone.model.hibernate.support.Pagination;

public class UserRolesServiceImpl implements UserRolesService {

    private static final Log log = LogFactory.getLog(UserRolesServiceImpl.class);

    @Autowired
    protected UserRolesDao userRolesDao;
    
    protected SqlMapClient sqlMapClient;

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
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserRoles.class);

        handleCriteriaByParams(detachedCriteria, params);

        return getUserRolesDao().findListByDetachedCriteria(detachedCriteria, 0, 10);
    }
    
    @Override
    @SuppressWarnings("unchecked")
    public List<Roles> findRolesByUser(Map<String, Object> params) {
        List<Roles> result = null;
        try {
            result = sqlMapClient.queryForList("back.roleRelUser", params);
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
        }
        
        return result == null ? new ArrayList<Roles>() : result;
    }

    public Pagination findByParams(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserRoles.class);

        handleCriteriaByParams(detachedCriteria, params);

        int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
        int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
        return getUserRolesDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
    }
    
    public void updateUserRoles(Long userId, List<Long> roleIds){
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserRoles.class);
        detachedCriteria.add(Restrictions.eq("userId", userId));
        List<UserRoles> originRels = getUserRolesDao().findByDetachedCriteria(detachedCriteria);
        for (Iterator<UserRoles> iterator = originRels.iterator(); iterator.hasNext();) {
            UserRoles userRoles = (UserRoles) iterator.next();
            getUserRolesDao().delete(userRoles);
        }
        for (Iterator<Long> iterator = roleIds.iterator(); iterator.hasNext();) {
            Long roleId = (Long) iterator.next();
            UserRoles userRoles = new UserRoles();
            userRoles.setUserId(userId);
            userRoles.setRoleId(roleId);
            userRoles.setEnable("1");
            getUserRolesDao().save(userRoles);
        }
    }

    protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params) {
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
        String userId = params.get("userId");
        if (!StringUtils.isBlank(userId)) {
            criteria.add(Restrictions.eq("userId", Long.parseLong(userId)));
        }
        String userIdMin = params.get("userIdMin");
        if (!StringUtils.isBlank(userIdMin)) {
            criteria.add(Restrictions.ge("userId", Long.parseLong(userIdMin)));
        }
        String userIdMax = params.get("userIdMax");
        if (!StringUtils.isBlank(userIdMax)) {
            criteria.add(Restrictions.le("userId", Long.parseLong(userIdMax)));
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

    public UserRolesDao getUserRolesDao() {
        return userRolesDao;
    }

    public void setUserRolesDao(UserRolesDao userRolesDao) {
        this.userRolesDao = userRolesDao;
    }

    public void setSqlMapClient(SqlMapClient sqlMapClient) {
        this.sqlMapClient = sqlMapClient;
    }

}