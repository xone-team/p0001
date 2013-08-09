package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Purchase extends MyModel implements Serializable {
	private static final long serialVersionUID = 3871230298774379727L;
	
    /**
     * 产品类别
     *
     */
    public enum PurchaseType {
        DONG_PIN("0", "冻品"), GAN_HUO("1", "干货"), HUO_XIAN("2", "活鲜"), SHUI_GUO("3", "水果"), TIAO_LIAO("4", "调料");
        protected String value;
        protected String name;
        private PurchaseType(String v, String n) {
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
	protected String purchaseName;
	protected String purchaseType;
	protected String checkStatus;
	protected String remark;
	protected String purchaseNum;
	protected Date purchaseValid;
	protected String purchaseAddress;
	protected String purchaseLocation;
	protected String purchaseDesc;
	protected String flagDeleted;
	protected Long userApply;
	protected Date dateApply;
	protected Long userCheck;
	protected Date dateCheck;
	protected Long userCreated;
	protected Date dateCreated;
	protected Long userUpdated;
	protected Date lastUpdated;
	
	List<PurcCheck> checkList;
	PurcCheck check;
	
	protected Person person;
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}

    public String getProductTypeName() {
        for (PurchaseType e : PurchaseType.values()) {
            if(e.getValue().equals(this.purchaseType)){
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
	
	protected List<Long> ids = new ArrayList<Long>();
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPurchaseName() {
		return purchaseName;
	}
	public void setPurchaseName(String purchaseName) {
		this.purchaseName = purchaseName;
	}
	public String getPurchaseType() {
		return purchaseType;
	}
	public void setPurchaseType(String purchaseType) {
		this.purchaseType = purchaseType;
	}
	
	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}

	public String getPurchaseNum() {
		return purchaseNum;
	}
	public void setPurchaseNum(String purchaseNum) {
		this.purchaseNum = purchaseNum;
	}
	public Date getPurchaseValid() {
		return purchaseValid;
	}
	public void setPurchaseValid(Date purchaseValid) {
		this.purchaseValid = purchaseValid;
	}
	public String getPurchaseAddress() {
		return purchaseAddress;
	}
	public void setPurchaseAddress(String purchaseAddress) {
		this.purchaseAddress = purchaseAddress;
	}
	public String getPurchaseLocation() {
		return purchaseLocation;
	}
	public void setPurchaseLocation(String purchaseLocation) {
		this.purchaseLocation = purchaseLocation;
	}
	public String getPurchaseDesc() {
		return purchaseDesc;
	}
	public void setPurchaseDesc(String purchaseDesc) {
		this.purchaseDesc = purchaseDesc;
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
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark;
    }
    public List<PurcCheck> getCheckList() {
        return checkList;
    }
    public void setCheckList(List<PurcCheck> checkList) {
        this.checkList = checkList;
    }
    public PurcCheck getCheck() {
        return check;
    }
    public void setCheck(PurcCheck check) {
        this.check = check;
    }
	
	
}
