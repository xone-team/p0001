package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Subscribe implements Serializable {

	protected Long id;
	protected String marketarea;
	protected String productNameKey;
	protected String saleType;
	protected String credit;
	protected Long refId;
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
	public String getMarketarea() {
		return marketarea;
	}
	public void setMarketarea(String marketarea) {
		this.marketarea = marketarea;
	}
	public String getProducnameKey() {
		return productNameKey;
	}
	public void setProducnameKey(String productNameKey) {
		this.productNameKey = productNameKey;
	}
	public String getSaleType() {
		return saleType;
	}
	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public Long getRefId() {
		return refId;
	}
	public void setRefId(Long refId) {
		this.refId = refId;
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
	public String getMarketareaMin() {
		return marketareaMin;
	}
	public void setMarketareaMin(String marketareaMin) {
		this.marketareaMin = marketareaMin;
	}
	public String getMarketareaMax() {
		return marketareaMax;
	}
	public void setMarketareaMax(String marketareaMax) {
		this.marketareaMax = marketareaMax;
	}
	public String getProducnameKeyMin() {
		return productNameKeyMin;
	}
	public void setProducnameKeyMin(String productNameKeyMin) {
		this.productNameKeyMin = productNameKeyMin;
	}
	public String getProducnameKeyMax() {
		return productNameKeyMax;
	}
	public void setProducnameKeyMax(String productNameKeyMax) {
		this.productNameKeyMax = productNameKeyMax;
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
	public Long getRefIdMin() {
		return refIdMin;
	}
	public void setRefIdMin(Long refIdMin) {
		this.refIdMin = refIdMin;
	}
	public Long getRefIdMax() {
		return refIdMax;
	}
	public void setRefIdMax(Long refIdMax) {
		this.refIdMax = refIdMax;
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
	
}
