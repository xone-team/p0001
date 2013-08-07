package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

import com.xone.model.hibernate.entity.Person.YN;

public class Adbanner implements Serializable {

	private static final long serialVersionUID = 8267891188872906517L;
	
	/**
	 * 广告类型
	 */
	public enum AdType {
		PRODUCT("0", "售卖产品"), PURCHASE("1", "购买产品");
        protected String value;
        protected String name;
        private AdType(String v, String n) {
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
	
	protected Date ltAdStart;
	protected Date gtAdStart;
	protected Date ltAdEnd;
	protected Date gtAdEnd;
	
	public String getAdTypeName() {
        String result = null;
        for (AdType e : AdType.values()) {
            if(e.getValue().equals(this.adType)){
                result = e.getName();
                break;
            }
        }
        return result == null ? "未知类型" : result;
	}
	
    public String getFlagDeletedName() {
        String result = null;
        for (YN e : YN.values()) {
            if (e.getValue().equals(this.flagDeleted)) {
                result = e.getName();
                break;
            }
        }
        return result == null ? "未知" : result;
    }
	
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

	public Date getLtAdStart() {
		return ltAdStart;
	}

	public void setLtAdStart(Date ltAdStart) {
		this.ltAdStart = ltAdStart;
	}

	public Date getGtAdStart() {
		return gtAdStart;
	}

	public void setGtAdStart(Date gtAdStart) {
		this.gtAdStart = gtAdStart;
	}

	public Date getLtAdEnd() {
		return ltAdEnd;
	}

	public void setLtAdEnd(Date ltAdEnd) {
		this.ltAdEnd = ltAdEnd;
	}

	public Date getGtAdEnd() {
		return gtAdEnd;
	}

	public void setGtAdEnd(Date gtAdEnd) {
		this.gtAdEnd = gtAdEnd;
	}

}
