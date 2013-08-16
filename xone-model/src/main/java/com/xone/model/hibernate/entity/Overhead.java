package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author mac
 *
 */
public class Overhead extends MyModel implements Serializable {

    private static final long serialVersionUID = 1437103503888442067L;
    protected Long id;
    protected Long refId;
    protected String overheadType;
    
	protected String checkStatus;
	protected String remark;
	protected Long userApply;
	protected Date dateApply;
	protected Long userCheck;
	protected Date dateCheck;
	protected String flagDeleted;
	protected Long userCreated;
	protected Date dateCreated;
	protected Long userUpdated;
	protected Date lastUpdated;
	
	/**
	 * 置顶类型
	 */
	public enum OverheadType {
		//与Product中的saleType要一致
		PRODUCT_NORMAL("0", "普通产品"), PRODUCT_SALES("1", "促销产品"), 
		PRODUCT_GROUPS("2", "团购产品"), PURCHASE("3", "求购产品");
        protected String value;
        protected String name;
        private OverheadType(String v, String n) {
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
	
    public String getCheckStatusName() {
        for (CheckStatus e : CheckStatus.values()) {
            if(e.getValue().equals(this.checkStatus)){
                return e.getName();
            }
        }
        return UNKNOWN_STATUS_NAME;
    }
    
    public String getOverheadTypeName() {
        for (OverheadType e : OverheadType.values()) {
            if(e.getValue().equals(this.overheadType)){
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
	
	/**
	 * query conditions
	 */
	protected String applyUsername;
	protected String productName;

// business logic
    protected Long idMin;
    protected Long idMax;
    protected Long refIdMin;
    protected Long refIdMax;
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

	public String getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public String getFlagDeleted() {
		return flagDeleted;
	}
	public void setFlagDeleted(String flagDeleted) {
		this.flagDeleted = flagDeleted;
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
	public Date getLasupdated() {
		return lastUpdated;
	}
	public void setLasupdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
    public Date getLastUpdated() {
        return lastUpdated;
    }
    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
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

    public Long getRefId() {
        return refId;
    }

    public void setRefId(Long refId) {
        this.refId = refId;
    }

    public String getOverheadType() {
        return overheadType;
    }

    public void setOverheadType(String overheadType) {
        this.overheadType = overheadType;
    }

    public String getApplyUsername() {
        return applyUsername;
    }

    public void setApplyUsername(String applyUsername) {
        this.applyUsername = applyUsername;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Long getRefIdMin() {
        return refIdMin;
    }

    public void setRefIdMin(Long refIdMin) {
        this.refIdMin = refIdMin;
    }

    public Long getRefIdMax() {
        return refIdMax;
    }

    public void setRefIdMax(Long refIdMax) {
        this.refIdMax = refIdMax;
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
	
}
