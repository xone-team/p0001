package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class ProductGroup extends MyModel implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = -8449872220714949576L;
    protected Long id;
    protected Long productId;
    protected Long groupNum;
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

    // business logic
    protected Long idMin;
    protected Long idMax;
    protected Long productIdMin;
    protected Long productIdMax;
    protected Long groupNumMin;
    protected Long groupNumMax;
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
            if (e.getValue().equals(this.checkStatus)) {
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

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public Long getGroupNum() {
        return groupNum;
    }

    public void setGroupNum(Long groupNum) {
        this.groupNum = groupNum;
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

    public Long getProductIdMin() {
        return productIdMin;
    }

    public void setProductIdMin(Long productIdMin) {
        this.productIdMin = productIdMin;
    }

    public Long getProductIdMax() {
        return productIdMax;
    }

    public void setProductIdMax(Long productIdMax) {
        this.productIdMax = productIdMax;
    }

    public Long getGroupNumMin() {
        return groupNumMin;
    }

    public void setGroupNumMin(Long groupNumMin) {
        this.groupNumMin = groupNumMin;
    }

    public Long getGroupNumMax() {
        return groupNumMax;
    }

    public void setGroupNumMax(Long groupNumMax) {
        this.groupNumMax = groupNumMax;
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
