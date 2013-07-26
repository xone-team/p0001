package com.xone.action.back.topad;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Topad;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.TopadService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class TopadBackAction extends Action {
    
    private static final long serialVersionUID = -7132163785627760581L;
    @Autowired
    protected TopadService topadService;
    protected Topad topad = new Topad();
    protected List<Topad> list = new ArrayList<Topad>();
    protected Pagination pagination = new Pagination();
    
    public String topadList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        params.put("pageSize", String.valueOf(getPagination().getPageSize()));
        params.put("pageNo", String.valueOf(getPagination().getPageNo()));
        Pagination p = getTopadService().findByParams(params);
//      List<Topad> l = getTopadService().findAllByMap(params);
//      if (null != l && !l.isEmpty()) {
//          getList().addAll(l);
//      }
        setPagination(p);
        return SUCCESS;
    }
    
    public String topadItem() throws Exception {
        Topad entity = getTopadService().findById(getTopad().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setTopad(entity);
        return SUCCESS;
    }
    
    public String topadCreate() throws Exception {
        return SUCCESS;
    }
    
    public String topadEdit() throws Exception {
        Topad entity = getTopadService().findById(getTopad().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setTopad(entity);
        return SUCCESS;
    }
    
    public String topadSave() throws Exception {
        setTopad(getTopadService().save(getTopad()));
        return SUCCESS;
    }
    
    public String topadUpdate() throws Exception {
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return ERROR;
        }
        String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
        if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
            Topad entity = getTopadService().findById(getTopad().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            getTopadService().delete(entity);
            return "list";
        }
        if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
            Topad entity = getTopadService().findById(getTopad().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            MyBeanUtils.copyProperties(getTopad(), entity, Topad.class, null, new CopyRules() {
                @Override
                public boolean myCopyRules(Object value) {
                    return (null != value);
                }
            });
            setTopad(getTopadService().update(entity));
        }
        return SUCCESS;
    }

    public TopadService getTopadService() {
        return topadService;
    }

    public void setTopadService(TopadService topadService) {
        this.topadService = topadService;
    }

    public List<Topad> getList() {
        return list;
    }

    public void setList(List<Topad> list) {
        this.list = list;
    }

    public Topad getTopad() {
        return topad;
    }

    public void setTopad(Topad topad) {
        this.topad = topad;
    }
    
    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }
}