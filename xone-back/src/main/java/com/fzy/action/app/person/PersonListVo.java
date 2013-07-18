package com.fzy.action.app.person;

import java.util.Date;

public class PersonListVo {
	
	Long id;
	String username;
	String password;
	String nickName;
	String provinceCode;
	Long updatedUser;
	Date updatedDate;
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
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
    public String getProvinceCode() {
        return provinceCode;
    }
    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }
    public Long getUpdatedUser() {
        return updatedUser;
    }
    public void setUpdatedUser(Long updatedUser) {
        this.updatedUser = updatedUser;
    }
    public Date getUpdatedDate() {
        return updatedDate;
    }
    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

}
