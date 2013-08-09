package com.xone.action.back.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Config;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.ConfigService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class ConfigBackAction extends Action {

    /**
     * 
     */
    private static final long serialVersionUID = 6339822468727799441L;
    @Autowired
    protected ConfigService configService;
    protected Config config = new Config();
    protected List<Config> list = new ArrayList<Config>();
    protected Pagination pagination = new Pagination();

    public String configList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        MyBeanUtils.copyPropertiesToMap(getConfig(), params, new CopyRules() {
            @Override
            public boolean myCopyRules(Object value) {
                return null != value;
            }
        }, new AssignRules() {
            @Override
            public String myAssignRules(Object value) {
                return value.toString();
            }
        }, null);
        params.put("pageSize", String.valueOf(getPagination().getPageSize()));
        params.put("pageNo", String.valueOf(getPagination().getPageNo()));
        Pagination p = getConfigService().findByParams(params);
        // List<Config> l = getConfigService().findAllByMap(params);
        // if (null != l && !l.isEmpty()) {
        // getList().addAll(l);
        // }
        setPagination(p);
        return SUCCESS;
    }

    public String configItem() throws Exception {
        Config entity = getConfigService().findById(getConfig().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setConfig(entity);
        return SUCCESS;
    }

    public String configCreate() throws Exception {
        return SUCCESS;
    }

    public String configEdit() throws Exception {
        Config entity = getConfigService().findById(getConfig().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setConfig(entity);
        return SUCCESS;
    }

    public String configSave() throws Exception {
        config.setUserCreated(getUserId());
        config.setUserUpdated(getUserId());
        setConfig(getConfigService().save(getConfig()));
        return SUCCESS;
    }

    public String configUpdate() throws Exception {
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return ERROR;
        }
        String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
        if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
            Config entity = getConfigService().findById(getConfig().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            getConfigService().delete(entity);
            return "list";
        }
        if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
            Config entity = getConfigService().findById(getConfig().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            MyBeanUtils.copyProperties(getConfig(), entity, Config.class, null, new CopyRules() {
                @Override
                public boolean myCopyRules(Object value) {
                    return (null != value);
                }
            });
            config.setUserUpdated(getUserId());
            setConfig(getConfigService().update(entity));
        }
        return SUCCESS;
    }
//    public String configDelete() throws Exception {
//        Config entity = getConfigService().findById(getConfig().getId());
//        configService.delete(entity);
//        return SUCCESS;
//    }

    public ConfigService getConfigService() {
        return configService;
    }

    public void setConfigService(ConfigService configService) {
        this.configService = configService;
    }

    public List<Config> getList() {
        return list;
    }

    public void setList(List<Config> list) {
        this.list = list;
    }

    public Config getConfig() {
        return config;
    }

    public void setConfig(Config config) {
        this.config = config;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }
}
