package com.xone.action.back.product;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.support.CommonTypes;
import com.xone.model.hibernate.support.Pagination;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.ProductService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class ProductBackAction extends LogicAction {

    /**
     * 
     */
    private static final long serialVersionUID = -8758614332522229237L;
    @Autowired
    protected ProductService productService;
    protected Product product = new Product();
    protected List<Product> list = new ArrayList<Product>();
    protected Pagination pagination = new Pagination();
    
    protected CommonTypes commonTypes = CommonTypes.getInstance();
    
    protected File uploadFile; // 得到上传的文件,此属性对应于表单中文件字段的名称  
    //下面的这两个属性的命名必须遵守上定的规则，即为"表单中文件字段的名称" + "相应的后缀"  
    protected String uploadFileContentType; // 得到上传的文件的数据类型,  
    protected String uploadFileFileName; // 得到上传的文件的名称 
    
    protected String imageUploadPath;
    
    @Override
    public void prepare() throws Exception {
        super.prepare();
        product.setPerson(new Person());
    }

    public String productList() throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        MyBeanUtils.copyPropertiesToMap(getProduct(), params, new CopyRules() {
            @Override
            public boolean myCopyRules(Object value) {
                return null != value;
            }

        }, new AssignRules() {
			@Override
			public String myAssignRules(Object value) {
				if (null != value && value instanceof Date) {
					return MyDateUtils.format((Date)value, "yyyy-MM-dd");
				}
				return value.toString();
			}
		}, null);
        params.put("pageSize", String.valueOf(getPagination().getPageSize()));
        params.put("pageNo", String.valueOf(getPagination().getPageNo()));
        Pagination p = getProductService().findByParams(params);
        // List<Product> l = getProductService().findAllByMap(params);
        // if (null != l && !l.isEmpty()) {
        // getList().addAll(l);
        // }
        setPagination(p);
        return SUCCESS;
    }
    
    public String productListAjax() throws Exception {
    	return productList();
    }

    public String productItem() throws Exception {
        Product entity = getProductService().findById(getProduct().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setProduct(entity);
        return SUCCESS;
    }

    public String productCreate() throws Exception {
        return SUCCESS;
    }

    public String productEdit() throws Exception {
        Product entity = getProductService().findById(getProduct().getId());
        if (null == entity || null == entity.getId()) {
            return ERROR;
        }
        setProduct(entity);
        return SUCCESS;
    }

    public String productSave() throws Exception {
        ImageUploaded imageUploaded = createUploadImageByFile(imageUploadPath,
                ImageUploaded.RefType.PRODUCT, getUploadFile(),
                getUploadFileContentType(), getUploadFileFileName());
        
        
        List<ImageUploaded> images = new ArrayList<ImageUploaded>();
        images.add(imageUploaded);
        setProduct(getProductService().save(getProduct(), images));
        return SUCCESS;
    }

    public String productUpdate() throws Exception {
        ImageUploaded imageUploaded = createUploadImageByFile(imageUploadPath,
                ImageUploaded.RefType.PRODUCT, getUploadFile(),
                getUploadFileContentType(), getUploadFileFileName());
        List<ImageUploaded> images = new ArrayList<ImageUploaded>();
        images.add(imageUploaded);

        
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            return ERROR;
        }
        String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
        if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
            Product entity = getProductService().findById(getProduct().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            getProductService().delete(entity);
            return "list";
        }
        if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
            Product entity = getProductService().findById(getProduct().getId());
            if (null == entity || null == entity.getId()) {
                return ERROR;
            }
            MyBeanUtils.copyProperties(getProduct(), entity, Product.class, null, new CopyRules() {
                @Override
                public boolean myCopyRules(Object value) {
                    return (null != value);
                }
            });
            setProduct(getProductService().update(entity, images, product.getIds()));
        }
        return SUCCESS;
    }
    
    public String productDelete() throws Exception {
        Product entity = getProductService().findById(getProduct().getId());
        productService.delete(entity);
        return SUCCESS;
    }

    public ProductService getProductService() {
        return productService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public List<Product> getList() {
        return list;
    }

    public void setList(List<Product> list) {
        this.list = list;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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

    public File getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(File uploadFile) {
        this.uploadFile = uploadFile;
    }

    public String getUploadFileContentType() {
        return uploadFileContentType;
    }

    public void setUploadFileContentType(String uploadFileContentType) {
        this.uploadFileContentType = uploadFileContentType;
    }

    public String getUploadFileFileName() {
        return uploadFileFileName;
    }

    public void setUploadFileFileName(String uploadFileFileName) {
        this.uploadFileFileName = uploadFileFileName;
    }

    public String getImageUploadPath() {
        return imageUploadPath;
    }

    public void setImageUploadPath(String imageUploadPath) {
        this.imageUploadPath = imageUploadPath;
    }


}
