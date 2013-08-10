package com.xone.action.back.topad;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.entity.Topad;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.PersonService;
import com.xone.service.app.ProductService;
import com.xone.service.app.TopadService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class TopadBackAction extends Action {

    private static final long serialVersionUID = -7132163785627760581L;
    @Autowired
    protected TopadService topadService;
    protected Topad topad = new Topad();
    protected List<Topad> list = new ArrayList<Topad>();
    protected Pagination pagination = new Pagination();

    protected Person person = new Person();
    protected Product product = new Product();
    protected PersonService personService;
    protected ProductService productService;

    public Enum<?>[] getFlagDeleted() {
        return Topad.FlagDeleted.values();
    }
    public Enum<?>[] getCheckStatus() {
        return Topad.CheckStatus.values();
    }    
    public String topadList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();

        MyBeanUtils.copyPropertiesToMap(topad, params, new CopyRules() {
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
        Pagination p = getTopadService().findByParams(params);
        // List<Topad> l = getTopadService().findAllByMap(params);
        // if (null != l && !l.isEmpty()) {
        // getList().addAll(l);
        // }
        setPagination(p);
        return SUCCESS;
    }

    public String topadItem() throws Exception {
        Topad entity = getTopadService().findById(getTopad().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setTopad(entity);

        if (entity.getUserApply() != null) {
            person = personService.findById(entity.getId());
        }
        if (entity.getProducid() != null) {
            product = productService.findById(entity.getProductId());
        }
        if (person == null) {
            person = new Person();
        }
        if (product == null) {
            product = new Product();
        }

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

        if (entity.getUserApply() != null) {
            person = personService.findById(entity.getId());
        }
        if (entity.getProducid() != null) {
            product = productService.findById(entity.getProductId());
        }
        if (person == null) {
            person = new Person();
        }
        if (product == null) {
            product = new Product();
        }

        return SUCCESS;
    }

    public String topadSave() throws Exception {
        topad.setUserApply(getUserId());
        topad.setDateApply(new Date());
        topad.setUserCreated(getUserId());
        topad.setUserUpdated(getUserId());
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

            entity.setUserCheck(new Long(0));
            entity.setDateCheck(new Date());
            setTopad(getTopadService().update(entity));
        }
        return SUCCESS;
    }

    public String topadDelete() throws Exception {
        Topad entity = topadService.findById(topad.getId());
        topadService.delete(entity);
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
    
//    public Map<String, Object[]> getTypes() {
//        return types;
//    }
//
//    public void setTypes(Map<String, Object[]> types) {
//        this.types = types;
//    }

    public Person getPerson() {
        return person;
    }

    public Product getProduct() {
        return product;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

}
