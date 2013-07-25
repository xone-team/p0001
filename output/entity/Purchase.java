package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Purchase implements Serializable {

	protected Long id;
	protected String purchaseName;
	protected String purchaseType;
	protected String purchaseNum;
	protected Date purchaseValid;
	protected String purchaseAddress;
	protected String purchaseLocation;
	protected String purchaseDesc;
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
	protected String purchaseValidMin;
	protected String purchaseValidMax;
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
	public String getPurchaseName() {
		return purchaseName;
	}
	public void setPurchaseName(String purchaseName) {
		this.purchaseName = purchaseName;
	}
	public String getPurchaseType() {
		return purchaseType;
	}
	public void setPurchaseType(String purchaseType) {
		this.purchaseType = purchaseType;
	}
	public String getPurchaseNum() {
		return purchaseNum;
	}
	public void setPurchaseNum(String purchaseNum) {
		this.purchaseNum = purchaseNum;
	}
	public Date getPurchaseValid() {
		return purchaseValid;
	}
	public void setPurchaseValid(Date purchaseValid) {
		this.purchaseValid = purchaseValid;
	}
	public String getPurchaseAddress() {
		return purchaseAddress;
	}
	public void setPurchaseAddress(String purchaseAddress) {
		this.purchaseAddress = purchaseAddress;
	}
	public String getPurchaseLocation() {
		return purchaseLocation;
	}
	public void setPurchaseLocation(String purchaseLocation) {
		this.purchaseLocation = purchaseLocation;
	}
	public String getPurchaseDesc() {
		return purchaseDesc;
	}
	public void setPurchaseDesc(String purchaseDesc) {
		this.purchaseDesc = purchaseDesc;
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
	public Date getLasupdated() {
		return lastUpdated;
	}
	public void setLasupdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
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
	public String getPurchaseNameMin() {
		return purchaseNameMin;
	}
	public void setPurchaseNameMin(String purchaseNameMin) {
		this.purchaseNameMin = purchaseNameMin;
	}
	public String getPurchaseNameMax() {
		return purchaseNameMax;
	}
	public void setPurchaseNameMax(String purchaseNameMax) {
		this.purchaseNameMax = purchaseNameMax;
	}
	public String getPurchaseTypeMin() {
		return purchaseTypeMin;
	}
	public void setPurchaseTypeMin(String purchaseTypeMin) {
		this.purchaseTypeMin = purchaseTypeMin;
	}
	public String getPurchaseTypeMax() {
		return purchaseTypeMax;
	}
	public void setPurchaseTypeMax(String purchaseTypeMax) {
		this.purchaseTypeMax = purchaseTypeMax;
	}
	public String getPurchaseNumMin() {
		return purchaseNumMin;
	}
	public void setPurchaseNumMin(String purchaseNumMin) {
		this.purchaseNumMin = purchaseNumMin;
	}
	public String getPurchaseNumMax() {
		return purchaseNumMax;
	}
	public void setPurchaseNumMax(String purchaseNumMax) {
		this.purchaseNumMax = purchaseNumMax;
	}
	public Date getPurchaseValidMin() {
		return purchaseValidMin;
	}
	public void setPurchaseValidMin(Date purchaseValidMin) {
		this.purchaseValidMin = purchaseValidMin;
	}
	public Date getPurchaseValidMax() {
		return purchaseValidMax;
	}
	public void setPurchaseValidMax(Date purchaseValidMax) {
		this.purchaseValidMax = purchaseValidMax;
	}
	public String getPurchaseAddressMin() {
		return purchaseAddressMin;
	}
	public void setPurchaseAddressMin(String purchaseAddressMin) {
		this.purchaseAddressMin = purchaseAddressMin;
	}
	public String getPurchaseAddressMax() {
		return purchaseAddressMax;
	}
	public void setPurchaseAddressMax(String purchaseAddressMax) {
		this.purchaseAddressMax = purchaseAddressMax;
	}
	public String getPurchaseLocationMin() {
		return purchaseLocationMin;
	}
	public void setPurchaseLocationMin(String purchaseLocationMin) {
		this.purchaseLocationMin = purchaseLocationMin;
	}
	public String getPurchaseLocationMax() {
		return purchaseLocationMax;
	}
	public void setPurchaseLocationMax(String purchaseLocationMax) {
		this.purchaseLocationMax = purchaseLocationMax;
	}
	public String getPurchaseDescMin() {
		return purchaseDescMin;
	}
	public void setPurchaseDescMin(String purchaseDescMin) {
		this.purchaseDescMin = purchaseDescMin;
	}
	public String getPurchaseDescMax() {
		return purchaseDescMax;
	}
	public void setPurchaseDescMax(String purchaseDescMax) {
		this.purchaseDescMax = purchaseDescMax;
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
	
}
