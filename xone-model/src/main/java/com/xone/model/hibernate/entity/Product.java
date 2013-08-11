package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Product extends MyModel implements Serializable {
	
	private static final long serialVersionUID = 1551553979029311658L;
	
    /**
     * 产品类别
     *
     */
    public enum ProductType {
        DONG_PIN("0", "冻品"), GAN_HUO("1", "干货"), HUO_XIAN("2", "活鲜"), SHUI_GUO("3", "水果"), TIAO_LIAO("4", "调料");
        protected String value;
        protected String name;
        private ProductType(String v, String n) {
            this.value = v;
            this.name = n;
        }
        public String getValue() {
            return this.value;
        }
        public String getName() {
            return this.name;
        }
    }
    
    /**
     * 销售类别
     *
     */
    public enum SaleType {
        NORMAL("0", "普通"), SALES("1", "促销"), GROUPS("2", "团购");
        protected String value;
        protected String name;
        private SaleType(String v, String n) {
            this.value = v;
            this.name = n;
        }
        public String getValue() {
            return this.value;
        }
        public String getName() {
            return this.name;
        }
    }
	
	/**
	 * 审核状态
	 */
	public enum CheckStatus {
		WAITING("0", "待审核"), PASSED("1", "审核通过"), DENIED("2", "审核未通过");
        protected String value;
        protected String name;
        private CheckStatus(String v, String n) {
            this.value = v;
            this.name = n;
        }
        public String getValue() {
            return this.value;
        }
        public String getName() {
            return this.name;
        }
	}
	
	protected Long id;
	protected String productName;
	protected String productType;
	protected String checkStatus;
	protected String saleType;
	protected String productPrice;
	protected String productNum;
	protected Date productValid;
	protected String productAddress;
	protected String productLocation;
	protected String productDesc;
	protected String flagDeleted;
	protected Long userApply;
	protected Date dateApply;
	protected Long userCheck;
	protected Date dateCheck;
	protected Long userCreated;
	protected Date dateCreated;
	protected Long userUpdated;
	protected Date lastUpdated;
	protected Date gtDateCreated;
	
	protected Person person = new Person();
	
	protected List<ProductCheck> productCheckList;
	protected ProductCheck productCheck = new ProductCheck();
	
	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public String getProductTypeName() {
        for (ProductType e : ProductType.values()) {
            if(e.getValue().equals(this.productType)){
                return e.getName();
            }
        }
        return UNKNOWN_STATUS_NAME;
	}
	
	
	public String getCheckStatusName() {
        for (CheckStatus e : CheckStatus.values()) {
            if(e.getValue().equals(this.checkStatus)){
                return e.getName();
            }
        }
        return UNKNOWN_STATUS_NAME;
	}
	
    public String getFlagDeletedName() {
        for (FlagDeleted e : FlagDeleted.values()) {
            if (e.getValue().equals(this.flagDeleted)) {
                return e.getName();
            }
        }
        return UNKNOWN_STATUS_NAME;
    }
	
	public String getSaleTypeName() {
	    for (SaleType e : SaleType.values()) {
	        if(e.getValue().equals(this.saleType)){
	            return e.getName();
	        }
	    }
	    return UNKNOWN_STATUS_NAME;
	}
	
	/**
	 * 是不是团购类型
	 * @return
	 */
	public boolean isGroupSaleType() {
		return SaleType.GROUPS.getValue().equals(this.saleType);
	}
	
	protected List<Long> ids = new ArrayList<Long>();
	
	   // business logic
    protected Long idMin;
    protected Long idMax;
    protected String productValidMin;
    protected String productValidMax;
    protected Long userApplyMin;
    protected Long userApplyMax;
    protected String dateApplyMin;
    protected String dateApplyMax;
    protected Long userCheckMin;
    protected Long userCheckMax;
    protected String dateCheckMin;
    protected String dateCheckMax;
    protected Long userCreatedMin;
    protected Long userCreatedMax;
    protected String dateCreatedMin;
    protected String dateCreatedMax;
    protected Long userUpdatedMin;
    protected Long userUpdatedMax;
    protected String lastUpdatedMin;
    protected String lastUpdatedMax;
    
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}
	public String getSaleType() {
		return saleType;
	}
	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public Date getProductValid() {
		return productValid;
	}
	public void setProductValid(Date productValid) {
		this.productValid = productValid;
	}
	public String getProductAddress() {
		return productAddress;
	}
	public void setProductAddress(String productAddress) {
		this.productAddress = productAddress;
	}
	public String getProductLocation() {
		return productLocation;
	}
	public void setProductLocation(String productLocation) {
		this.productLocation = productLocation;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getFlagDeleted() {
		return flagDeleted;
	}
	public void setFlagDeleted(String flagDeleted) {
		this.flagDeleted = flagDeleted;
	}
	public Long getUserApply() {
		return userApply;
	}
	public void setUserApply(Long userApply) {
		this.userApply = userApply;
	}
	public Date getDateApply() {
		return dateApply;
	}
	public void setDateApply(Date dateApply) {
		this.dateApply = dateApply;
	}
	public Long getUserCheck() {
		return userCheck;
	}
	public void setUserCheck(Long userCheck) {
		this.userCheck = userCheck;
	}
	public Date getDateCheck() {
		return dateCheck;
	}
	public void setDateCheck(Date dateCheck) {
		this.dateCheck = dateCheck;
	}
	public Long getUserCreated() {
		return userCreated;
	}
	public void setUserCreated(Long userCreated) {
		this.userCreated = userCreated;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public Long getUserUpdated() {
		return userUpdated;
	}
	public void setUserUpdated(Long userUpdated) {
		this.userUpdated = userUpdated;
	}
	public Date getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	
	public List<Long> getIds() {
		return ids;
	}
	public void setIds(List<Long> ids) {
		this.ids = ids;
	}

    public Long getIdMin() {
        return idMin;
    }

    public void setIdMin(Long idMin) {
        this.idMin = idMin;
    }

    public Long getIdMax() {
        return idMax;
    }

    public void setIdMax(Long idMax) {
        this.idMax = idMax;
    }

    public String getProductValidMin() {
        return productValidMin;
    }

    public void setProductValidMin(String productValidMin) {
        this.productValidMin = productValidMin;
    }

    public String getProductValidMax() {
        return productValidMax;
    }

    public void setProductValidMax(String productValidMax) {
        this.productValidMax = productValidMax;
    }

    public Long getUserApplyMin() {
        return userApplyMin;
    }

    public void setUserApplyMin(Long userApplyMin) {
        this.userApplyMin = userApplyMin;
    }

    public Long getUserApplyMax() {
        return userApplyMax;
    }

    public void setUserApplyMax(Long userApplyMax) {
        this.userApplyMax = userApplyMax;
    }

    public String getDateApplyMin() {
        return dateApplyMin;
    }

    public void setDateApplyMin(String dateApplyMin) {
        this.dateApplyMin = dateApplyMin;
    }

    public String getDateApplyMax() {
        return dateApplyMax;
    }

    public void setDateApplyMax(String dateApplyMax) {
        this.dateApplyMax = dateApplyMax;
    }

    public Long getUserCheckMin() {
        return userCheckMin;
    }

    public void setUserCheckMin(Long userCheckMin) {
        this.userCheckMin = userCheckMin;
    }

    public Long getUserCheckMax() {
        return userCheckMax;
    }

    public void setUserCheckMax(Long userCheckMax) {
        this.userCheckMax = userCheckMax;
    }

    public String getDateCheckMin() {
        return dateCheckMin;
    }

    public void setDateCheckMin(String dateCheckMin) {
        this.dateCheckMin = dateCheckMin;
    }

    public String getDateCheckMax() {
        return dateCheckMax;
    }

    public void setDateCheckMax(String dateCheckMax) {
        this.dateCheckMax = dateCheckMax;
    }

    public Long getUserCreatedMin() {
        return userCreatedMin;
    }

    public void setUserCreatedMin(Long userCreatedMin) {
        this.userCreatedMin = userCreatedMin;
    }

    public Long getUserCreatedMax() {
        return userCreatedMax;
    }

    public void setUserCreatedMax(Long userCreatedMax) {
        this.userCreatedMax = userCreatedMax;
    }

    public String getDateCreatedMin() {
        return dateCreatedMin;
    }

    public void setDateCreatedMin(String dateCreatedMin) {
        this.dateCreatedMin = dateCreatedMin;
    }

    public String getDateCreatedMax() {
        return dateCreatedMax;
    }

    public void setDateCreatedMax(String dateCreatedMax) {
        this.dateCreatedMax = dateCreatedMax;
    }

    public Long getUserUpdatedMin() {
        return userUpdatedMin;
    }

    public void setUserUpdatedMin(Long userUpdatedMin) {
        this.userUpdatedMin = userUpdatedMin;
    }

    public Long getUserUpdatedMax() {
        return userUpdatedMax;
    }

    public void setUserUpdatedMax(Long userUpdatedMax) {
        this.userUpdatedMax = userUpdatedMax;
    }

    public String getLastUpdatedMin() {
        return lastUpdatedMin;
    }

    public void setLastUpdatedMin(String lastUpdatedMin) {
        this.lastUpdatedMin = lastUpdatedMin;
    }

    public String getLastUpdatedMax() {
        return lastUpdatedMax;
    }

    public void setLastUpdatedMax(String lastUpdatedMax) {
        this.lastUpdatedMax = lastUpdatedMax;
    }

    public List<ProductCheck> getProductCheckList() {
        return productCheckList;
    }

    public void setProductCheckList(List<ProductCheck> productCheckList) {
        this.productCheckList = productCheckList;
    }

    public ProductCheck getProductCheck() {
        return productCheck;
    }

    public void setProductCheck(ProductCheck productCheck) {
        this.productCheck = productCheck;
    }

	public Date getGtDateCreated() {
		return gtDateCreated;
	}

	public void setGtDateCreated(Date gtDateCreated) {
		this.gtDateCreated = gtDateCreated;
	}

}
