package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {

	protected Long id;
	protected String username;
	protected String password;
	protected Long userApply;
	protected Date dateApply;
	protected Long userCheck;
	protected Date dateCheck;
	protected String flagDeleted;
	protected Long userCreated;
	protected Date dateCreated;
	protected Long userUpdated;
	protected Date lastUpdated;
	protected String nickName;
	protected String cellphone;
	protected String contactor;
	protected String qq;
	protected String email;
	protected String address;
	protected String credit;
	protected String userLevel;

// business logic
	protected String dateApplyMin;
	protected String dateApplyMax;
	protected String dateCheckMin;
	protected String dateCheckMax;
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
	public String getContactor() {
		return contactor;
	}
	public void setContactor(String contactor) {
		this.contactor = contactor;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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

// business logic
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
	public String getUsernameMin() {
		return usernameMin;
	}
	public void setUsernameMin(String usernameMin) {
		this.usernameMin = usernameMin;
	}
	public String getUsernameMax() {
		return usernameMax;
	}
	public void setUsernameMax(String usernameMax) {
		this.usernameMax = usernameMax;
	}
	public String getPasswordMin() {
		return passwordMin;
	}
	public void setPasswordMin(String passwordMin) {
		this.passwordMin = passwordMin;
	}
	public String getPasswordMax() {
		return passwordMax;
	}
	public void setPasswordMax(String passwordMax) {
		this.passwordMax = passwordMax;
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
	public Date getDateApplyMin() {
		return dateApplyMin;
	}
	public void setDateApplyMin(Date dateApplyMin) {
		this.dateApplyMin = dateApplyMin;
	}
	public Date getDateApplyMax() {
		return dateApplyMax;
	}
	public void setDateApplyMax(Date dateApplyMax) {
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
	public Date getDateCheckMin() {
		return dateCheckMin;
	}
	public void setDateCheckMin(Date dateCheckMin) {
		this.dateCheckMin = dateCheckMin;
	}
	public Date getDateCheckMax() {
		return dateCheckMax;
	}
	public void setDateCheckMax(Date dateCheckMax) {
		this.dateCheckMax = dateCheckMax;
	}
	public String getFlagDeletedMin() {
		return flagDeletedMin;
	}
	public void setFlagDeletedMin(String flagDeletedMin) {
		this.flagDeletedMin = flagDeletedMin;
	}
	public String getFlagDeletedMax() {
		return flagDeletedMax;
	}
	public void setFlagDeletedMax(String flagDeletedMax) {
		this.flagDeletedMax = flagDeletedMax;
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
	public Date getDateCreatedMin() {
		return dateCreatedMin;
	}
	public void setDateCreatedMin(Date dateCreatedMin) {
		this.dateCreatedMin = dateCreatedMin;
	}
	public Date getDateCreatedMax() {
		return dateCreatedMax;
	}
	public void setDateCreatedMax(Date dateCreatedMax) {
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
	public Date getLasupdatedMin() {
		return lastUpdatedMin;
	}
	public void setLasupdatedMin(Date lastUpdatedMin) {
		this.lastUpdatedMin = lastUpdatedMin;
	}
	public Date getLasupdatedMax() {
		return lastUpdatedMax;
	}
	public void setLasupdatedMax(Date lastUpdatedMax) {
		this.lastUpdatedMax = lastUpdatedMax;
	}
	public String getNickNameMin() {
		return nickNameMin;
	}
	public void setNickNameMin(String nickNameMin) {
		this.nickNameMin = nickNameMin;
	}
	public String getNickNameMax() {
		return nickNameMax;
	}
	public void setNickNameMax(String nickNameMax) {
		this.nickNameMax = nickNameMax;
	}
	public String getCellphoneMin() {
		return cellphoneMin;
	}
	public void setCellphoneMin(String cellphoneMin) {
		this.cellphoneMin = cellphoneMin;
	}
	public String getCellphoneMax() {
		return cellphoneMax;
	}
	public void setCellphoneMax(String cellphoneMax) {
		this.cellphoneMax = cellphoneMax;
	}
	public String getContactorMin() {
		return contactorMin;
	}
	public void setContactorMin(String contactorMin) {
		this.contactorMin = contactorMin;
	}
	public String getContactorMax() {
		return contactorMax;
	}
	public void setContactorMax(String contactorMax) {
		this.contactorMax = contactorMax;
	}
	public String getQqMin() {
		return qqMin;
	}
	public void setQqMin(String qqMin) {
		this.qqMin = qqMin;
	}
	public String getQqMax() {
		return qqMax;
	}
	public void setQqMax(String qqMax) {
		this.qqMax = qqMax;
	}
	public String getEmailMin() {
		return emailMin;
	}
	public void setEmailMin(String emailMin) {
		this.emailMin = emailMin;
	}
	public String getEmailMax() {
		return emailMax;
	}
	public void setEmailMax(String emailMax) {
		this.emailMax = emailMax;
	}
	public String getAddressMin() {
		return addressMin;
	}
	public void setAddressMin(String addressMin) {
		this.addressMin = addressMin;
	}
	public String getAddressMax() {
		return addressMax;
	}
	public void setAddressMax(String addressMax) {
		this.addressMax = addressMax;
	}
	public String getCreditMin() {
		return creditMin;
	}
	public void setCreditMin(String creditMin) {
		this.creditMin = creditMin;
	}
	public String getCreditMax() {
		return creditMax;
	}
	public void setCreditMax(String creditMax) {
		this.creditMax = creditMax;
	}
	public String getUserLevelMin() {
		return userLevelMin;
	}
	public void setUserLevelMin(String userLevelMin) {
		this.userLevelMin = userLevelMin;
	}
	public String getUserLevelMax() {
		return userLevelMax;
	}
	public void setUserLevelMax(String userLevelMax) {
		this.userLevelMax = userLevelMax;
	}
	
}
