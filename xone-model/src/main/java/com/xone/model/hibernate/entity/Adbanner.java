package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Adbanner implements Serializable {

	private static final long serialVersionUID = 8267891188872906517L;
	
	/**
	 * 广告类型
	 */
	public enum AdType {
		PRODUCT("0"), PURCHASE("1");
		protected String value;
		private AdType(String v) {
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
	protected Long refId;
	protected String adType;
	protected Long adRefId;
	protected Date adStart;
	protected Date adEnd;
	protected Long userId;
	protected String flagDeleted;
	protected Long userApply;
	protected Date dateApply;
	protected Long userCheck;
	protected Date dateCheck;
	protected Long userCreated;
	protected Date dateCreated;
	protected Long userUpdated;
	protected Date lastUpdated;
	
	// business logic
    protected Long idMin;
    protected Long idMax;
    protected Long refIdMin;
    protected Long refIdMax;
    protected Long adRefIdMin;
    protected Long adRefIdMax;
    protected String adStartMin;
    protected String adStartMax;
    protected String adEndMin;
    protected String adEndMax;
    protected Long userIdMin;
    protected Long userIdMax;
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
	public Long getRefId() {
		return refId;
	}
	public void setRefId(Long refId) {
		this.refId = refId;
	}
	public String getAdType() {
		return adType;
	}
	public void setAdType(String adType) {
		this.adType = adType;
	}
	public Long getAdRefId() {
		return adRefId;
	}
	public void setAdRefId(Long adRefId) {
		this.adRefId = adRefId;
	}
	public Date getAdStart() {
		return adStart;
	}
	public void setAdStart(Date adStart) {
		this.adStart = adStart;
	}
	public Date getAdEnd() {
		return adEnd;
	}
	public void setAdEnd(Date adEnd) {
		this.adEnd = adEnd;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
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
    public String getAdStartMin() {
        return adStartMin;
    }
    public void setAdStartMin(String adStartMin) {
        this.adStartMin = adStartMin;
    }
    public String getAdStartMax() {
        return adStartMax;
    }
    public void setAdStartMax(String adStartMax) {
        this.adStartMax = adStartMax;
    }
    public String getAdEndMin() {
        return adEndMin;
    }
    public void setAdEndMin(String adEndMin) {
        this.adEndMin = adEndMin;
    }
    public String getAdEndMax() {
        return adEndMax;
    }
    public void setAdEndMax(String adEndMax) {
        this.adEndMax = adEndMax;
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
    public Long getAdRefIdMin() {
        return adRefIdMin;
    }
    public void setAdRefIdMin(Long adRefIdMin) {
        this.adRefIdMin = adRefIdMin;
    }
    public Long getAdRefIdMax() {
        return adRefIdMax;
    }
    public void setAdRefIdMax(Long adRefIdMax) {
        this.adRefIdMax = adRefIdMax;
    }
    public Long getUserIdMin() {
        return userIdMin;
    }
    public void setUserIdMin(Long userIdMin) {
        this.userIdMin = userIdMin;
    }
    public Long getUserIdMax() {
        return userIdMax;
    }
    public void setUserIdMax(Long userIdMax) {
        this.userIdMax = userIdMax;
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

}
