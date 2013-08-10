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

import com.xone.model.hibernate.app.OverheadDao;
import com.xone.model.hibernate.entity.Overhead;
import com.xone.model.hibernate.support.Pagination;

public class OverheadServiceImpl implements OverheadService {
    private static final Log log = LogFactory.getLog(OverheadServiceImpl.class);

    @Autowired
    protected OverheadDao overheadDao;

    @Override
    public Overhead save(Overhead entity) {
        entity.setCheckStatus(Overhead.CheckStatus.WAITING.getValue());
        entity.setFlagDeleted(Overhead.FlagDeleted.NORMAL.getValue());
        return getOverheadDao().save(entity);
    }

    @Override
    public Overhead update(Overhead entity) {
        return getOverheadDao().update(entity);
    }

    @Override
    public void delete(Overhead entity) {
        getOverheadDao().deleteById(entity.getId());
    }

    @Override
    public Overhead findById(Long id) {
        return getOverheadDao().findById(id);
    }

    @Override
    public Overhead findByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Overhead.class);

        handleCriteriaByParams(detachedCriteria, params);

        List<Overhead> l = getOverheadDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
        if (null == l) {
            return new Overhead();
        }
        return l.get(0);
    }

    @Override
    public List<Overhead> findAllByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Overhead.class);

        handleCriteriaByParams(detachedCriteria, params);

        return getOverheadDao().findListByDetachedCriteria(detachedCriteria, 0, 10);
    }

    public Pagination findByParams(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Overhead.class);
        
        handleCriteriaByParams(detachedCriteria, params);
        
        int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
        int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
        return getOverheadDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
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
        String overheadType = params.get("overheadType");
        if (!StringUtils.isBlank(overheadType)) {
            criteria.add(Restrictions.like("overheadType", "%" + overheadType + "%"));
        }
        String refId = params.get("refId");
        if (!StringUtils.isBlank(refId)) {
            criteria.add(Restrictions.eq("refId", new Long(refId)));
        }
        String refIdMin = params.get("refIdMin");
        if (!StringUtils.isBlank(refIdMin)) {
            criteria.add(Restrictions.ge("refId", new Long(refIdMin)));
        }
        String refIdMax = params.get("refIdMax");
        if (!StringUtils.isBlank(refIdMax)) {
            criteria.add(Restrictions.le("refId", new Long(refIdMax)));
        }
        String checkStatus = params.get("checkStatus");
        if (!StringUtils.isBlank(checkStatus)) {
            criteria.add(Restrictions.like("checkStatus", "%" + checkStatus + "%"));
        }
        String remark = params.get("remark");
        if (!StringUtils.isBlank(remark)) {
            criteria.add(Restrictions.like("remark", "%" + remark + "%"));
        }
        String userApply = params.get("userApply");
        if (!StringUtils.isBlank(userApply)) {
            criteria.add(Restrictions.eq("userApply", new Long(userApply)));
        }
        String userApplyMin = params.get("userApplyMin");
        if (!StringUtils.isBlank(userApplyMin)) {
            criteria.add(Restrictions.ge("userApply", new Long(userApplyMin)));
        }
        String userApplyMax = params.get("userApplyMax");
        if (!StringUtils.isBlank(userApplyMax)) {
            criteria.add(Restrictions.le("userApply", new Long(userApplyMax)));
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
            criteria.add(Restrictions.eq("userCheck", new Long(userCheck)));
        }
        String userCheckMin = params.get("userCheckMin");
        if (!StringUtils.isBlank(userCheckMin)) {
            criteria.add(Restrictions.ge("userCheck", new Long(userCheckMin)));
        }
        String userCheckMax = params.get("userCheckMax");
        if (!StringUtils.isBlank(userCheckMax)) {
            criteria.add(Restrictions.le("userCheck", new Long(userCheckMax)));
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

    public OverheadDao getOverheadDao() {
        return overheadDao;
    }

    public void setOverheadDao(OverheadDao overheadDao) {
        this.overheadDao = overheadDao;
    }

}
