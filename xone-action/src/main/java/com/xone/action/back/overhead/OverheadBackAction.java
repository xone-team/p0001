package com.xone.action.back.overhead;

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
import com.xone.model.hibernate.entity.Overhead;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.PersonService;
import com.xone.service.app.ProductService;
import com.xone.service.app.OverheadService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class OverheadBackAction extends Action {

    private static final long serialVersionUID = -7132163785627760581L;
    @Autowired
    protected OverheadService overheadService;
    protected Overhead overhead = new Overhead();
    protected List<Overhead> list = new ArrayList<Overhead>();
    protected Pagination pagination = new Pagination();

    protected Person person = new Person();
    protected Product product = new Product();
    protected PersonService personService;
    protected ProductService productService;

    public Enum<?>[] getFlagDeleted() {
        return Overhead.FlagDeleted.values();
    }
    public Enum<?>[] getCheckStatus() {
        return Overhead.CheckStatus.values();
    }    
    public String overheadList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();

        MyBeanUtils.copyPropertiesToMap(overhead, params, new CopyRules() {
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
        Pagination p = getOverheadService().findByParams(params);
        // List<Overhead> l = getOverheadService().findAllByMap(params);
        // if (null != l && !l.isEmpty()) {
        // getList().addAll(l);
        // }
        setPagination(p);
        return SUCCESS;
    }

    public String overheadItem() throws Exception {
        Overhead entity = getOverheadService().findById(getOverhead().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setOverhead(entity);

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

    public String overheadCreate() throws Exception {
        overhead.setOverheadType(Overhead.OverheadType.PRODUCT.getValue());
        return SUCCESS;
    }

    public String overheadEdit() throws Exception {
        Overhead entity = getOverheadService().findById(getOverhead().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setOverhead(entity);

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

    public String overheadSave() throws Exception {
        overhead.setUserApply(getUserId());
        overhead.setDateApply(new Date());
        overhead.setUserCreated(getUserId());
        overhead.setUserUpdated(getUserId());
        setOverhead(getOverheadService().save(getOverhead()));
        return SUCCESS;
    }

    public String overheadUpdate() throws Exception {
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return ERROR;
        }
        String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
        if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
            Overhead entity = getOverheadService().findById(getOverhead().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            getOverheadService().delete(entity);
            return "list";
        }
        if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
            Overhead entity = getOverheadService().findById(getOverhead().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            MyBeanUtils.copyProperties(getOverhead(), entity, Overhead.class, null, new CopyRules() {
                @Override
                public boolean myCopyRules(Object value) {
                    return (null != value);
                }
            });

            entity.setUserCheck(new Long(0));
            entity.setDateCheck(new Date());
            setOverhead(getOverheadService().update(entity));
        }
        return SUCCESS;
    }

    public String overheadDelete() throws Exception {
        Overhead entity = overheadService.findById(overhead.getId());
        overheadService.delete(entity);
        return SUCCESS;
    }

    public OverheadService getOverheadService() {
        return overheadService;
    }

    public void setOverheadService(OverheadService overheadService) {
        this.overheadService = overheadService;
    }

    public List<Overhead> getList() {
        return list;
    }

    public void setList(List<Overhead> list) {
        this.list = list;
    }

    public Overhead getOverhead() {
        return overhead;
    }

    public void setOverhead(Overhead overhead) {
        this.overhead = overhead;
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