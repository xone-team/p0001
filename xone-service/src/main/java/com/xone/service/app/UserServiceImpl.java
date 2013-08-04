package com.xone.service.app;

import java.text.ParseException;
import java.util.Date;
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

import com.xone.model.hibernate.app.UserDao;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.support.Pagination;

public class UserServiceImpl implements UserService {
    private static final Log log = LogFactory.getLog(UserServiceImpl.class);

    @Autowired
    protected UserDao userDao;

    @Override
    public Person save(Person entity) {
        Long user = new Long(0);
        Date date = new Date();
        entity.setDateApply(date);
        entity.setUserApply(user);
        return getUserDao().save(entity);
    }

    @Override
    public Person update(Person entity) {
        return getUserDao().update(entity);
    }

    @Override
    public void delete(Person entity) {
        getUserDao().deleteById(entity.getId());
    }

    @Override
    public Person findById(Long id) {
        return getUserDao().findById(id);
    }

    @Override
    public List<Person> findAllByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Person.class);

        handleCriteriaByParams(detachedCriteria, params);

        return getUserDao().findListByDetachedCriteria(detachedCriteria, 0, 10);
    }

    public Pagination findByParams(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Person.class);

        handleCriteriaByParams(detachedCriteria, params);

        int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
        int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
        return getUserDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
    }

    protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params) {
        String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
        String username = params.get("username");
        if (!StringUtils.isBlank(username)) {
            criteria.add(Restrictions.like("username", "%" + username + "%"));
        }
        String password = params.get("password");
        if (!StringUtils.isBlank(password)) {
            criteria.add(Restrictions.like("password", "%" + password + "%"));
        }
        String userApply = params.get("userApply");
        if (!StringUtils.isBlank(userApply)) {
            criteria.add(Restrictions.eq("userApply", Long.parseLong(userApply)));
        }
        String dateApplyMin = params.get("dateApplyMin");
        if (!StringUtils.isBlank(dateApplyMin)) {
            try {
                criteria.add(Restrictions.ge("dateApply", DateUtils.parseDate(dateApplyMin, "yyyy-MM-dd")));
            } catch (ParseException e) {
                log.error("[dateApplyMin] parsed exception :", e);
            }
        }
        String dateApplyMax = params.get("dateApplyMax");
        if (!StringUtils.isBlank(dateApplyMax)) {
            try {
                criteria.add(Restrictions.lt("dateApply", DateUtils.addDays(DateUtils.parseDate(dateApplyMax, "yyyy-MM-dd"), 1)));
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
                criteria.add(Restrictions.ge("dateCheck", DateUtils.parseDate(dateCheckMin, "yyyy-MM-dd")));
            } catch (ParseException e) {
                log.error("[dateCheckMin] parsed exception :", e);
            }
        }
        String dateCheckMax = params.get("dateCheckMax");
        if (!StringUtils.isBlank(dateCheckMax)) {
            try {
                criteria.add(Restrictions.lt("dateCheck", DateUtils.addDays(DateUtils.parseDate(dateCheckMax, "yyyy-MM-dd"), 1)));
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
        String nickName = params.get("nickName");
        if (!StringUtils.isBlank(nickName)) {
            criteria.add(Restrictions.like("nickName", "%" + nickName + "%"));
        }
        String cellphone = params.get("cellphone");
        if (!StringUtils.isBlank(cellphone)) {
            criteria.add(Restrictions.like("cellphone", "%" + cellphone + "%"));
        }
        String contactor = params.get("contactor");
        if (!StringUtils.isBlank(contactor)) {
            criteria.add(Restrictions.like("contactor", "%" + contactor + "%"));
        }
        String qq = params.get("qq");
        if (!StringUtils.isBlank(qq)) {
            criteria.add(Restrictions.like("qq", "%" + qq + "%"));
        }
        String email = params.get("email");
        if (!StringUtils.isBlank(email)) {
            criteria.add(Restrictions.like("email", "%" + email + "%"));
        }
        String address = params.get("address");
        if (!StringUtils.isBlank(address)) {
            criteria.add(Restrictions.like("address", "%" + address + "%"));
        }
        String credit = params.get("credit");
        if (!StringUtils.isBlank(credit)) {
            criteria.add(Restrictions.like("credit", "%" + credit + "%"));
        }
        String userLevel = params.get("userLevel");
        if (!StringUtils.isBlank(userLevel)) {
            criteria.add(Restrictions.like("userLevel", "%" + userLevel + "%"));
        }

        criteria.addOrder(Order.desc("dateCreated"));
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

}
