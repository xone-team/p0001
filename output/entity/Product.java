package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable {

	protected Long id;
	protected String productName;
	protected String productType;
	protected String saleType;
	protected String productPrice;
	protected String productNum;
	protected Date productValid;
	protected String productAddress;
	protected String productLocation;
	protected String productDesc;
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
	protected String productValidMin;
	protected String productValidMax;
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
	public String getProducname() {
		return productName;
	}
	public void setProducname(String productName) {
		this.productName = productName;
	}
	public String getProductype() {
		return productType;
	}
	public void setProductype(String productType) {
		this.productType = productType;
	}
	public String getSaleType() {
		return saleType;
	}
	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}
	public String getProducprice() {
		return productPrice;
	}
	public void setProducprice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProducnum() {
		return productNum;
	}
	public void setProducnum(String productNum) {
		this.productNum = productNum;
	}
	public Date getProducvalid() {
		return productValid;
	}
	public void setProducvalid(Date productValid) {
		this.productValid = productValid;
	}
	public String getProducaddress() {
		return productAddress;
	}
	public void setProducaddress(String productAddress) {
		this.productAddress = productAddress;
	}
	public String getProduclocation() {
		return productLocation;
	}
	public void setProduclocation(String productLocation) {
		this.productLocation = productLocation;
	}
	public String getProducdesc() {
		return productDesc;
	}
	public void setProducdesc(String productDesc) {
		this.productDesc = productDesc;
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
	public String getProducnameMin() {
		return productNameMin;
	}
	public void setProducnameMin(String productNameMin) {
		this.productNameMin = productNameMin;
	}
	public String getProducnameMax() {
		return productNameMax;
	}
	public void setProducnameMax(String productNameMax) {
		this.productNameMax = productNameMax;
	}
	public String getProductypeMin() {
		return productTypeMin;
	}
	public void setProductypeMin(String productTypeMin) {
		this.productTypeMin = productTypeMin;
	}
	public String getProductypeMax() {
		return productTypeMax;
	}
	public void setProductypeMax(String productTypeMax) {
		this.productTypeMax = productTypeMax;
	}
	public String getSaleTypeMin() {
		return saleTypeMin;
	}
	public void setSaleTypeMin(String saleTypeMin) {
		this.saleTypeMin = saleTypeMin;
	}
	public String getSaleTypeMax() {
		return saleTypeMax;
	}
	public void setSaleTypeMax(String saleTypeMax) {
		this.saleTypeMax = saleTypeMax;
	}
	public String getProducpriceMin() {
		return productPriceMin;
	}
	public void setProducpriceMin(String productPriceMin) {
		this.productPriceMin = productPriceMin;
	}
	public String getProducpriceMax() {
		return productPriceMax;
	}
	public void setProducpriceMax(String productPriceMax) {
		this.productPriceMax = productPriceMax;
	}
	public String getProducnumMin() {
		return productNumMin;
	}
	public void setProducnumMin(String productNumMin) {
		this.productNumMin = productNumMin;
	}
	public String getProducnumMax() {
		return productNumMax;
	}
	public void setProducnumMax(String productNumMax) {
		this.productNumMax = productNumMax;
	}
	public Date getProducvalidMin() {
		return productValidMin;
	}
	public void setProducvalidMin(Date productValidMin) {
		this.productValidMin = productValidMin;
	}
	public Date getProducvalidMax() {
		return productValidMax;
	}
	public void setProducvalidMax(Date productValidMax) {
		this.productValidMax = productValidMax;
	}
	public String getProducaddressMin() {
		return productAddressMin;
	}
	public void setProducaddressMin(String productAddressMin) {
		this.productAddressMin = productAddressMin;
	}
	public String getProducaddressMax() {
		return productAddressMax;
	}
	public void setProducaddressMax(String productAddressMax) {
		this.productAddressMax = productAddressMax;
	}
	public String getProduclocationMin() {
		return productLocationMin;
	}
	public void setProduclocationMin(String productLocationMin) {
		this.productLocationMin = productLocationMin;
	}
	public String getProduclocationMax() {
		return productLocationMax;
	}
	public void setProduclocationMax(String productLocationMax) {
		this.productLocationMax = productLocationMax;
	}
	public String getProducdescMin() {
		return productDescMin;
	}
	public void setProducdescMin(String productDescMin) {
		this.productDescMin = productDescMin;
	}
	public String getProducdescMax() {
		return productDescMax;
	}
	public void setProducdescMax(String productDescMax) {
		this.productDescMax = productDescMax;
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
