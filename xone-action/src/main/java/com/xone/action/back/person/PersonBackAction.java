package com.xone.action.back.person;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.support.CommonTypes;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.PersonService;
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
    protected CommonTypes commonTypes = CommonTypes.getInstance();

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
        // List<Person> l = getPersonService().findAllByMap(params);
        // if (null != l && !l.isEmpty()) {
        // getList().addAll(l);
        // }
        setPagination(p);
        return SUCCESS;
    }

    public String personSelect() throws Exception {
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
        List<Person> list = getPersonService().findAllByMap(params);
        setList(list);
        return SUCCESS;
    }

    public String personItem() throws Exception {
        Person entity = getPersonService().findById(getPerson().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setPerson(entity);
        return SUCCESS;
    }

    public String personCreate() throws Exception {
        return SUCCESS;
    }

    public String personEdit() throws Exception {
        Person entity = getPersonService().findById(getPerson().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setPerson(entity);
        return SUCCESS;
    }

    public String personSave() throws Exception {
        setPerson(getPersonService().save(getPerson()));
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
            setPerson(getPersonService().update(entity));
        }
        return SUCCESS;
    }
    
    public String personDelete() throws Exception {
        Person entity = getPersonService().findById(getPerson().getId());
        personService.delete(entity);
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

    public CommonTypes getCommonTypes() {
        return commonTypes;
    }
    
}
