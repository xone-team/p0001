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
import com.xone.model.hibernate.entity.ProdCheck;
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
    
    protected File uploadFile1;
    protected String uploadFile1ContentType;
    protected String uploadFile1FileName;
    
    protected File uploadFile2;
    protected String uploadFile2ContentType;
    protected String uploadFile2FileName;
    
    protected File uploadFile3;
    protected String uploadFile3ContentType;
    protected String uploadFile3FileName;
    
    protected String imageUploadPath;
    
    @Override
    public void prepare() throws Exception {
        super.prepare();
        product.setPerson(new Person());
        product.setCheck(new ProdCheck());
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
        setProduct(getProductService().save(getProduct(), getImageList()));
        return SUCCESS;
    }
    
    private List<ImageUploaded> getImageList(){
        List<ImageUploaded> images = new ArrayList<ImageUploaded>();
        if(uploadFile1 != null){
            ImageUploaded imageUploaded1 = createUploadImageByFile(imageUploadPath,
                    ImageUploaded.RefType.PRODUCT, getUploadFile1(),
                    getUploadFile1ContentType(), getUploadFile1FileName());
            images.add(imageUploaded1);
        }
        if(uploadFile2 != null){
            ImageUploaded imageUploaded2 = createUploadImageByFile(imageUploadPath,
                    ImageUploaded.RefType.PRODUCT, getUploadFile2(),
                    getUploadFile2ContentType(), getUploadFile2FileName());
            images.add(imageUploaded2);
        }
        if(uploadFile3 != null){
            ImageUploaded imageUploaded3 = createUploadImageByFile(imageUploadPath,
                    ImageUploaded.RefType.PRODUCT, getUploadFile3(),
                    getUploadFile3ContentType(), getUploadFile3FileName());
            images.add(imageUploaded3);
        }
        
        return images;
    }

    public String productUpdate() throws Exception {
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
            setProduct(getProductService().update(entity, getImageList(), product.getIds()));
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


    public File getUploadFile1() {
        return uploadFile1;
    }

    public void setUploadFile1(File uploadFile1) {
        this.uploadFile1 = uploadFile1;
    }

    public String getUploadFile1ContentType() {
        return uploadFile1ContentType;
    }

    public void setUploadFile1ContentType(String uploadFile1ContentType) {
        this.uploadFile1ContentType = uploadFile1ContentType;
    }

    public String getUploadFile1FileName() {
        return uploadFile1FileName;
    }

    public void setUploadFile1FileName(String uploadFile1FileName) {
        this.uploadFile1FileName = uploadFile1FileName;
    }

    public File getUploadFile2() {
        return uploadFile2;
    }

    public void setUploadFile2(File uploadFile2) {
        this.uploadFile2 = uploadFile2;
    }

    public String getUploadFile2ContentType() {
        return uploadFile2ContentType;
    }

    public void setUploadFile2ContentType(String uploadFile2ContentType) {
        this.uploadFile2ContentType = uploadFile2ContentType;
    }

    public String getUploadFile2FileName() {
        return uploadFile2FileName;
    }

    public void setUploadFile2FileName(String uploadFile2FileName) {
        this.uploadFile2FileName = uploadFile2FileName;
    }

    public File getUploadFile3() {
        return uploadFile3;
    }

    public void setUploadFile3(File uploadFile3) {
        this.uploadFile3 = uploadFile3;
    }

    public String getUploadFile3ContentType() {
        return uploadFile3ContentType;
    }

    public void setUploadFile3ContentType(String uploadFile3ContentType) {
        this.uploadFile3ContentType = uploadFile3ContentType;
    }

    public String getUploadFile3FileName() {
        return uploadFile3FileName;
    }

    public void setUploadFile3FileName(String uploadFile3FileName) {
        this.uploadFile3FileName = uploadFile3FileName;
    }

    public String getImageUploadPath() {
        return imageUploadPath;
    }

    public void setImageUploadPath(String imageUploadPath) {
        this.imageUploadPath = imageUploadPath;
    }


}
