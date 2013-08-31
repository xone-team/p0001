package com.xone.action.web.adbanner;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.AdbannerService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class AdbannerWebAction extends Action {

    /**
     * 
     */
    private static final long serialVersionUID = 2868028209816718261L;
    @Autowired
    protected AdbannerService adbannerService;
    protected Adbanner adbanner = new Adbanner();
    protected List<Adbanner> list = new ArrayList<Adbanner>();
    protected Pagination pagination = new Pagination();

    public String adbannerList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        
        params.put("userApply", getUserId().toString());
        params.put("flagDeleted", Subscribe.FlagDeleted.NORMAL.getValue());
        
        params.put("pageSize", String.valueOf(getPagination().getPageSize()));
        params.put("pageNo", String.valueOf(getPagination().getPageNo()));
        Pagination p = getAdbannerService().findByParams(params);
        setPagination(p);
        return SUCCESS;
    }

    public String adbannerItem() throws Exception {
        Adbanner entity = getAdbannerService().findById(getAdbanner().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setAdbanner(entity);
        return SUCCESS;
    }

    public String adbannerCreate() throws Exception {
        return SUCCESS;
    }

    public String adbannerEdit() throws Exception {
        Adbanner entity = getAdbannerService().findById(getAdbanner().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setAdbanner(entity);
        return SUCCESS;
    }

    public String adbannerSave() throws Exception {
        getAdbanner().setDateApply(new Date());
        getAdbanner().setUserApply(getUserId());
        getAdbanner().setUserCreated(getUserId());
        getAdbanner().setUserUpdated(getUserId());
        
        setAdbanner(getAdbannerService().save(getAdbanner()));
        return SUCCESS;
    }

    public String adbannerUpdate() throws Exception {
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return ERROR;
        }
        String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
        if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
            Adbanner entity = getAdbannerService().findById(getAdbanner().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            getAdbannerService().delete(entity);
            return "list";
        }
        if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
            Adbanner entity = getAdbannerService().findById(getAdbanner().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            MyBeanUtils.copyProperties(getAdbanner(), entity, Adbanner.class, null, new CopyRules() {
                @Override
                public boolean myCopyRules(Object value) {
                    return (null != value);
                }
            });
            getAdbanner().setUserUpdated(getUserId());
            setAdbanner(getAdbannerService().update(entity));
        }
        return SUCCESS;
    }

    public AdbannerService getAdbannerService() {
        return adbannerService;
    }

    public void setAdbannerService(AdbannerService adbannerService) {
        this.adbannerService = adbannerService;
    }

    public List<Adbanner> getList() {
        return list;
    }

    public void setList(List<Adbanner> list) {
        this.list = list;
    }

    public Adbanner getAdbanner() {
        return adbanner;
    }

    public void setAdbanner(Adbanner adbanner) {
        this.adbanner = adbanner;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }
}
