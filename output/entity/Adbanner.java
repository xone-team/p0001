package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Adbanner implements Serializable {

	protected Long id;
	protected Long refId;
	protected String adType;
	protected Long adRefId;
	protected Date adStart;
	protected Date adEnd;
	protected Long userId;
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
	protected String adStartMin;
	protected String adStartMax;
	protected String adEndMin;
	protected String adEndMax;
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
	public Long getRefId() {
		return refId;
	}
	public void setRefId(Long refId) {
		this.refId = refId;
	}
	public String getAdType() {
		return adType;
	}
	public void setAdType(String adType) {
		this.adType = adType;
	}
	public Long getAdRefId() {
		return adRefId;
	}
	public void setAdRefId(Long adRefId) {
		this.adRefId = adRefId;
	}
	public Date getAdStart() {
		return adStart;
	}
	public void setAdStart(Date adStart) {
		this.adStart = adStart;
	}
	public Date getAdEnd() {
		return adEnd;
	}
	public void setAdEnd(Date adEnd) {
		this.adEnd = adEnd;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
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
	public String getAdTypeMin() {
		return adTypeMin;
	}
	public void setAdTypeMin(String adTypeMin) {
		this.adTypeMin = adTypeMin;
	}
	public String getAdTypeMax() {
		return adTypeMax;
	}
	public void setAdTypeMax(String adTypeMax) {
		this.adTypeMax = adTypeMax;
	}
	public Long getAdRefIdMin() {
		return adRefIdMin;
	}
	public void setAdRefIdMin(Long adRefIdMin) {
		this.adRefIdMin = adRefIdMin;
	}
	public Long getAdRefIdMax() {
		return adRefIdMax;
	}
	public void setAdRefIdMax(Long adRefIdMax) {
		this.adRefIdMax = adRefIdMax;
	}
	public Date getAdStartMin() {
		return adStartMin;
	}
	public void setAdStartMin(Date adStartMin) {
		this.adStartMin = adStartMin;
	}
	public Date getAdStartMax() {
		return adStartMax;
	}
	public void setAdStartMax(Date adStartMax) {
		this.adStartMax = adStartMax;
	}
	public Date getAdEndMin() {
		return adEndMin;
	}
	public void setAdEndMin(Date adEndMin) {
		this.adEndMin = adEndMin;
	}
	public Date getAdEndMax() {
		return adEndMax;
	}
	public void setAdEndMax(Date adEndMax) {
		this.adEndMax = adEndMax;
	}
	public Long getUserIdMin() {
		return userIdMin;
	}
	public void setUserIdMin(Long userIdMin) {
		this.userIdMin = userIdMin;
	}
	public Long getUserIdMax() {
		return userIdMax;
	}
	public void setUserIdMax(Long userIdMax) {
		this.userIdMax = userIdMax;
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
