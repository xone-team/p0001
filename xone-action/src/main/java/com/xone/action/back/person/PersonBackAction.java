package com.xone.action.back.person;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.entity.MyModel;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.PersonService;
import com.xone.service.app.UserRolesService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class PersonBackAction extends Action {

    private static final long serialVersionUID = -3902632115068177793L;
    @Autowired
    protected PersonService personService;
    protected Person person = new Person();
    protected List<Person> list = new ArrayList<Person>();
    protected Pagination pagination = new Pagination();
    protected List<Long> roleIds = new ArrayList<Long>();
    protected UserRolesService userRolesService;
    protected List<Roles> rolesList = new ArrayList<Roles>();

    public Enum<?>[] getFlagDeleted() {
        return Person.FlagDeleted.values();
    }
    public Enum<?>[] getCredit() {
        return Person.Credit.values();
    }
    public Enum<?>[] getUserLevel() {
        return Person.UserLevel.values();
    }

    public String personList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        MyBeanUtils.copyPropertiesToMap(getPerson(), params, new CopyRules() {
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
        Pagination p = getPersonService().findByParams(params);
        setPagination(p);
        return SUCCESS;
    }


    public String personItem() throws Exception {
        Person entity = getPersonService().findById(getPerson().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setPerson(entity);
        
        prepareRoleList(entity.getId());
        
        return SUCCESS;
    }

    public String personCreate() throws Exception {
        person.setCredit(Person.Credit.NO.getValue());
        person.setUserLevel(Person.UserLevel.C.getValue());
        
        return SUCCESS;
    }

    public String personEdit() throws Exception {
        Person entity = getPersonService().findById(getPerson().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setPerson(entity);

        prepareRoleList(entity.getId());
        
        return SUCCESS;
    }
    
    private void prepareRoleList(Long userId){
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userId", userId);
        rolesList = userRolesService.findRolesByUser(params);
    }

    public String personSave() throws Exception {
        person.setUserCreated(getUserId());
        person.setUserUpdated(getUserId());
        
        if(Person.Credit.YES.getValue().equals(person.getCredit())){
            person.setUserCheck(getUserId());
            person.setDateCheck(new Date());
        }
        
        person.setUserApply(getUserId());
        person.setDateApply(new Date());
        
        setPerson(getPersonService().save(getPerson(), roleIds));
//        userRolesService.updateUserRoles(person.getId(), roleIds);
        return SUCCESS;
    }

    public String personUpdate() throws Exception {
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return ERROR;
        }
        String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
        if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
            Person entity = getPersonService().findById(getPerson().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            getPersonService().delete(entity);
            return "list";
        }
        if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
            Person entity = getPersonService().findById(getPerson().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            MyBeanUtils.copyProperties(getPerson(), entity, Person.class, null, new CopyRules() {
                @Override
                public boolean myCopyRules(Object value) {
                    return (null != value);
                }
            });
            
            person.setUserUpdated(getUserId());
            person.setLastUpdated(new Date());
            
            if(Person.Credit.YES.getValue().equals(person.getCredit())){
                person.setUserCheck(getUserId());
                person.setDateCheck(new Date());
            }
            
            setPerson(getPersonService().update(entity, roleIds));
            
//            userRolesService.updateUserRoles(entity.getId(), roleIds);
        }
        return SUCCESS;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public List<Person> getList() {
        return list;
    }

    public void setList(List<Person> list) {
        this.list = list;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }
//
//    public Map<String, Object[]> getTypes() {
//        return types;
//    }
//
//    public void setTypes(Map<String, Object[]> types) {
//        this.types = types;
//    }

    public List<Long> getRoleIds() {
        return roleIds;
    }

    public void setUserRolesService(UserRolesService userRolesService) {
        this.userRolesService = userRolesService;
    }

    public List<Roles> getRolesList() {
        return rolesList;
    }

    public void setRoleIds(List<Long> roleIds) {
        this.roleIds = roleIds;
    }
    
}
 