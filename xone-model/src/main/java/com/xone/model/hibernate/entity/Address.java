package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Address implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = -5997499155803356386L;
    protected Long id;
    protected String provinceCode;
    protected String cityCode;
    protected String districtCode;
    protected String detail;
    protected String zip;
    protected String flagDeleted;
    protected Long userCreated;
    protected Date dateCreated;
    protected Long userUpdated;
    protected Date lastUpdated;
    
 // business logic
    protected String dateCreatedMin;
    protected String dateCreatedMax;
    protected String lastUpdatedMin;
    protected String lastUpdatedMax;
    
    
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getProvinceCode() {
        return provinceCode;
    }
    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }
    public String getCityCode() {
        return cityCode;
    }
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }
    public String getDistrictCode() {
        return districtCode;
    }
    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }
    public String getDetail() {
        return detail;
    }
    public void setDetail(String detail) {
        this.detail = detail;
    }
    public String getZip() {
        return zip;
    }
    public void setZip(String zip) {
        this.zip = zip;
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
    
}
