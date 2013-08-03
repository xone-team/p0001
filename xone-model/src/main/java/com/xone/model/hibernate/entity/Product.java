package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.xone.model.hibernate.entity.Purchase.CheckStatus;

public class Product implements Serializable {
	
	private static final long serialVersionUID = 1551553979029311658L;
	
	public enum SaleType {
		NORMAL("0"), SALES("1"), GROUPS("2");
		protected String value;
		private SaleType(String v) {
			this.value = v;
		}
		public String getValue() {
			return this.value;
		}
		
	}
	
	/**
	 * 审核状态
	 */
	public enum CheckStatus {
		WAITING("0"), PASSED("1"), DENIED("2");
		protected String value;
		private CheckStatus(String v) {
			this.value = v;
		}
		public String getValue() {
			return this.value;
		}
	}
	
	/**
	 * 删除标志
	 */
	public enum FlagDeleted {
		NORMAL("0"), DELETED("1");
		protected String value = "0";
		private FlagDeleted(String value) {
			this.value = value;
		}
		public String getValue() {
			return this.value;
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
	
	protected Person person;
	
	protected List<ProdCheck> checkList;
	protected ProdCheck check;
	
	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public String getProductTypeName() {
		if ("0".equals(getProductType())) {
			return "冻品";
		} else if ("1".equals(getProductType())) {
			return "干货";
		} else if ("2".equals(getProductType())) {
			return "活鲜";
		} else if ("3".equals(getProductType())) {
			return "水果";
		} else if ("4".equals(getProductType())) {
			return "调料";
		}
		return "未知";
	}
	
	
	public String getCheckStatusName() {
		if (CheckStatus.WAITING.getValue().equals(getCheckStatus())) {
			return "待审核";
		} else if (CheckStatus.PASSED.getValue().equals(getCheckStatus())) {
			return "审核通过";
		} else if (CheckStatus.DENIED.getValue().equals(getCheckStatus())) {
			return "审核不通过";
		}
		return "未知";
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
