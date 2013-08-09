package com.xone.action.back.resources;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Resources;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.support.CommonTypes;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.ResourcesService;
import com.xone.service.app.RolesResourcesService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class ResourcesBackAction extends Action {

    /**
     * 
     */
    private static final long serialVersionUID = 9147518870214179178L;
    @Autowired
    protected ResourcesService resourcesService;
    protected Resources resources = new Resources();
    protected List<Resources> list = new ArrayList<Resources>();
    protected Pagination pagination = new Pagination();
    // protected CommonTypes commonTypes = CommonTypes.getInstance();
    protected List<Long> roleIds = new ArrayList<Long>();
    protected RolesResourcesService rolesResourcesService;
    protected List<Roles> rolesList = new ArrayList<Roles>();

    protected Map<String, Object[]> types = new HashMap<String, Object[]>();

    @Override
    public void prepare() throws Exception {
        types.put("enable", Roles.Enable.values());
        super.prepare();
    }

    public String resourcesList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();

        MyBeanUtils.copyPropertiesToMap(getResources(), params, new CopyRules() {
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
        Pagination p = getResourcesService().findByParams(params);
        // List<Resources> l = getResourcesService().findAllByMap(params);
        // if (null != l && !l.isEmpty()) {
        // getList().addAll(l);
        // }
        setPagination(p);
        return SUCCESS;
    }

    public String resourcesItem() throws Exception {
        Resources entity = getResourcesService().findById(getResources().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setResources(entity);

        prepareRoleList(entity.getId());

        return SUCCESS;
    }

    public String resourcesCreate() throws Exception {
        resources.setPriority(0);
        resources.setResourceType(1);
        return SUCCESS;
    }

    public String resourcesEdit() throws Exception {
        Resources entity = getResourcesService().findById(getResources().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setResources(entity);

        prepareRoleList(entity.getId());

        return SUCCESS;
    }

    private void prepareRoleList(Long resourceId) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("resourceId", resourceId);
        rolesList = rolesResourcesService.findRolesByRes(params);
        System.out.println(rolesList.size());
    }

    public String resourcesSave() throws Exception {
        resources.setEnable(Person.YN.YES.getValue());
        resources.setUserCreated(getUserId());
        resources.setUserUpdated(getUserId());
        setResources(getResourcesService().save(getResources()));
        rolesResourcesService.updateResRoles(resources.getId(), roleIds);
        return SUCCESS;
    }

    public String resourcesUpdate() throws Exception {
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return ERROR;
        }
        String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
        if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
            Resources entity = getResourcesService().findById(getResources().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            getResourcesService().delete(entity);
            return "list";
        }
        if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
            Resources entity = getResourcesService().findById(getResources().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            MyBeanUtils.copyProperties(getResources(), entity, Resources.class, null, new CopyRules() {
                @Override
                public boolean myCopyRules(Object value) {
                    return (null != value);
                }
            });
            entity.setUserUpdated(getUserId());
            setResources(getResourcesService().update(entity));

            rolesResourcesService.updateResRoles(entity.getId(), roleIds);
        }
        return SUCCESS;
    }

    public String resourcesDelete() throws Exception {
        Resources entity = resourcesService.findById(resources.getId());
        resourcesService.delete(entity);
        return SUCCESS;
    }

    public ResourcesService getResourcesService() {
        return resourcesService;
    }

    public void setResourcesService(ResourcesService resourcesService) {
        this.resourcesService = resourcesService;
    }

    public List<Resources> getList() {
        return list;
    }

    public void setList(List<Resources> list) {
        this.list = list;
    }

    public Resources getResources() {
        return resources;
    }

    public void setResources(Resources resources) {
        this.resources = resources;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<Long> getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(List<Long> roleIds) {
        this.roleIds = roleIds;
    }

    public List<Roles> getRolesList() {
        return rolesList;
    }

    public Map<String, Object[]> getTypes() {
        return types;
    }

    public void setTypes(Map<String, Object[]> types) {
        this.types = types;
    }

    public void setRolesResourcesService(RolesResourcesService rolesResourcesService) {
        this.rolesResourcesService = rolesResourcesService;
    }

}
