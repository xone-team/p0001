package com.fzy.action.app.person;

import com.fzy.web.RestForm;

public class PersonForm implements RestForm{
    /**
     * 
     */
    private static final long serialVersionUID = -1429790760349997890L;
    protected String id;
    protected String username;
    protected String password;
    protected String nickName;
    protected String cellphone;
    protected String contact;
    protected String qq;
    protected String email;
    protected String credit;
    protected String userLevel;
    
    protected String locationProvinceCode;
    protected String locationCityCode;
    protected String locationDistrictCode;
    protected String locationDetail;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getNickName() {
        return nickName;
    }
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    public String getCellphone() {
        return cellphone;
    }
    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    public String getQq() {
        return qq;
    }
    public void setQq(String qq) {
        this.qq = qq;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getCredit() {
        return credit;
    }
    public void setCredit(String credit) {
        this.credit = credit;
    }
    public String getUserLevel() {
        return userLevel;
    }
    public void setUserLevel(String userLevel) {
        this.userLevel = userLevel;
    }
    public String getLocationProvinceCode() {
        return locationProvinceCode;
    }
    public void setLocationProvinceCode(String locationProvinceCode) {
        this.locationProvinceCode = locationProvinceCode;
    }
    public String getLocationCityCode() {
        return locationCityCode;
    }
    public void setLocationCityCode(String locationCityCode) {
        this.locationCityCode = locationCityCode;
    }
    public String getLocationDistrictCode() {
        return locationDistrictCode;
    }
    public void setLocationDistrictCode(String locationDistrictCode) {
        this.locationDistrictCode = locationDistrictCode;
    }
    public String getLocationDetail() {
        return locationDetail;
    }
    public void setLocationDetail(String locationDetail) {
        this.locationDetail = locationDetail;
    }
    
}