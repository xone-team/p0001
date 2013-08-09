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
	
	protected List<ProdCheck> checkList;
	protected ProdCheck check;
	
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
	
	protected List<Long> ids = new ArrayList<Long>();
	
	
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

    public List<ProdCheck> getCheckList() {
        return checkList;
    }

    public void setCheckList(List<ProdCheck> checkList) {
        this.checkList = checkList;
    }

    public ProdCheck getCheck() {
        return check;
    }

    public void setCheck(ProdCheck check) {
        this.check = check;
    }

	public Date getGtDateCreated() {
		return gtDateCreated;
	}

	public void setGtDateCreated(Date gtDateCreated) {
		this.gtDateCreated = gtDateCreated;
	}

}
