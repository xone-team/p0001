package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Delivery extends MyModel implements Serializable {

    private static final long serialVersionUID = 7208342379878568948L;
    protected Long id;
    protected Long productId;
    protected String marketarea;
    protected String determini;
    protected Date loadtime;
    protected String loadaddress;
    protected String boxNum;
    protected String unitNum;
    protected String boxTotal;
    protected String totalWeight;
    protected String flagPass;
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

    public enum FlagPass {
        HANDLING("0", "处理中"), TRADED("1", "已交易"), CANCELED("2", "已取消");
        protected String value;
        protected String name;

        private FlagPass(String v, String n) {
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
    
    public String getFlagPassName() {
        for (FlagPass e : FlagPass.values()) {
            if(e.getValue().equals(this.flagPass)){
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
    
    protected Date gtLoadtime;
    protected Date ltLoadtime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProducid() {
        return productId;
    }

    public void setProducid(Long productId) {
        this.productId = productId;
    }

    public String getMarketarea() {
        return marketarea;
    }

    public void setMarketarea(String marketarea) {
        this.marketarea = marketarea;
    }

    public String getDetermini() {
        return determini;
    }

    public void setDetermini(String determini) {
        this.determini = determini;
    }

    public Date getLoadtime() {
        return loadtime;
    }

    public void setLoadtime(Date loadtime) {
        this.loadtime = loadtime;
    }

    public String getLoadaddress() {
        return loadaddress;
    }

    public void setLoadaddress(String loadaddress) {
        this.loadaddress = loadaddress;
    }

    public String getBoxNum() {
        return boxNum;
    }

    public void setBoxNum(String boxNum) {
        this.boxNum = boxNum;
    }

    public String getUninum() {
        return unitNum;
    }

    public void setUninum(String unitNum) {
        this.unitNum = unitNum;
    }

    public String getBoxTotal() {
        return boxTotal;
    }

    public void setBoxTotal(String boxTotal) {
        this.boxTotal = boxTotal;
    }

    public String getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(String totalWeight) {
        this.totalWeight = totalWeight;
    }

    public String getFlagPass() {
        return flagPass;
    }

    public void setFlagPass(String flagPass) {
        this.flagPass = flagPass;
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

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getUnitNum() {
        return unitNum;
    }

    public void setUnitNum(String unitNum) {
        this.unitNum = unitNum;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public Date getGtLoadtime() {
        return gtLoadtime;
    }

    public void setGtLoadtime(Date gtLoadtime) {
        this.gtLoadtime = gtLoadtime;
    }

    public Date getLtLoadtime() {
        return ltLoadtime;
    }

    public void setLtLoadtime(Date ltLoadtime) {
        this.ltLoadtime = ltLoadtime;
    }

}
