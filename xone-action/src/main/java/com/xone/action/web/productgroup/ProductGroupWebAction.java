package com.xone.action.web.productgroup;

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
import com.xone.model.hibernate.entity.ProductGroup;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.PersonService;
import com.xone.service.app.ProductGroupService;
import com.xone.service.app.ProductService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class ProductGroupWebAction extends Action {

    private static final long serialVersionUID = -7032201791981899730L;
    @Autowired
    protected ProductGroupService productGroupService;
    protected ProductGroup productGroup = new ProductGroup();
    protected List<ProductGroup> list = new ArrayList<ProductGroup>();
    protected Pagination pagination = new Pagination();

    protected Person person = new Person();
    protected Product product = new Product();
    protected PersonService personService;
    protected ProductService productService;

    public Enum<?>[] getFlagDeleted() {
        return ProductGroup.FlagDeleted.values();
    }

    public Enum<?>[] getCheckStatus() {
        return ProductGroup.CheckStatus.values();
    }

    public String productGroupList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();

        MyBeanUtils.copyPropertiesToMap(productGroup, params, new CopyRules() {
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
        
        params.put("userApply", getUserId().toString());
        params.put("flagDeleted", Product.FlagDeleted.NORMAL.getValue());

        params.put("pageSize", String.valueOf(getPagination().getPageSize()));
        params.put("pageNo", String.valueOf(getPagination().getPageNo()));
        Pagination p = getProductGroupService().findByParams(params);

        setPagination(p);
        return SUCCESS;
    }

    public String productGroupItem() throws Exception {
        ProductGroup entity = getProductGroupService().findById(getProductGroup().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setProductGroup(entity);

        if (entity.getUserApply() != null) {
            person = personService.findById(entity.getUserApply());
        }
        product = productService.findById(entity.getProductId());

        if (person == null) {
            person = new Person();
        }
        if (product == null) {
            product = new Product();
        }

        return SUCCESS;
    }

    public String productGroupCreate() throws Exception {
        productGroup.setGroupNum(0L);
        return SUCCESS;
    }

    public String productGroupEdit() throws Exception {
        ProductGroup entity = getProductGroupService().findById(getProductGroup().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setProductGroup(entity);

        if (entity.getUserApply() != null) {
            person = personService.findById(entity.getUserApply());
        }
        
        product = productService.findById(entity.getProductId());
        
        if (person == null) {
            person = new Person();
        }
        if (product == null) {
            product = new Product();
        }

        return SUCCESS;
    }

    public String productGroupSave() throws Exception {
        if(!compareProductGroupNum()){
            return ERROR;
        }
        
        productGroup.setUserApply(getUserId());
        productGroup.setUserCreated(getUserId());
        productGroup.setUserUpdated(getUserId());
        setProductGroup(getProductGroupService().save(getProductGroup()));
        return SUCCESS;
    }
    
    public boolean compareProductGroupNum(){
        boolean result = true;
        // compare product num
        Long productNum = 0L;
        product = productService.findById(productGroup.getProductId());
        if(product != null && product.getProductNum() != null){
            productNum = Long.valueOf(product.getProductNum());
        }
        Long productGroupNum = productGroup.getGroupNum();
        if(productNum < 1L || productNum < productGroupNum){
            addFieldError("product.groupNum", "团购数量不足");
            result = false;
        }
        return result;
    }

    public String productGroupUpdate() throws Exception {
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return ERROR;
        }
        String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
        if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
            ProductGroup entity = getProductGroupService().findById(getProductGroup().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            getProductGroupService().delete(entity);
            return "list";
        }
        if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
            ProductGroup entity = getProductGroupService().findById(getProductGroup().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            
            MyBeanUtils.copyProperties(getProductGroup(), entity, ProductGroup.class, null, new CopyRules() {
                @Override
                public boolean myCopyRules(Object value) {
                    return (null != value);
                }
            });
            
            
            // compare product num
            if(!compareProductGroupNum()){
                return ERROR;
            }

            if(ProductGroup.CheckStatus.DENIED.equals(entity.getCheckStatus())
                    || ProductGroup.CheckStatus.PASSED.equals(entity.getCheckStatus())){
                entity.setUserCheck(new Long(0));
                entity.setDateCheck(new Date());
            }
            
            setProductGroup(getProductGroupService().update(entity));
        }
        return SUCCESS;
    }

    public String productGroupDelete() throws Exception {
        ProductGroup entity = productGroupService.findById(productGroup.getId());
        productGroupService.delete(entity);
        return SUCCESS;
    }

    public ProductGroupService getProductGroupService() {
        return productGroupService;
    }

    public void setProductGroupService(ProductGroupService productGroupService) {
        this.productGroupService = productGroupService;
    }

    public List<ProductGroup> getList() {
        return list;
    }

    public void setList(List<ProductGroup> list) {
        this.list = list;
    }

    public ProductGroup getProductGroup() {
        return productGroup;
    }

    public void setProductGroup(ProductGroup productGroup) {
        this.productGroup = productGroup;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

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

    public PersonService getPersonService() {
        return personService;
    }

    public ProductService getProductService() {
        return productService;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
