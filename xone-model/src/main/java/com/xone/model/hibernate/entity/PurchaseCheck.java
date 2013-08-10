package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

import com.xone.model.hibernate.entity.Product.CheckStatus;

public class PurchaseCheck extends MyModel implements Serializable {

	/**
     * 
     */
    private static final long serialVersionUID = 7673649995950589590L;
    protected Long id;
	protected Long purchaseId;
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

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Long getPurchaseId() {
        return purchaseId;
    }
    public void setPurchaseId(Long purchaseId) {
        this.purchaseId = purchaseId;
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
    public Date getLastUpdated() {
        return lastUpdated;
    }
    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}
