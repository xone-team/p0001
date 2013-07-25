package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Delivery implements Serializable {

	protected Long id;
	protected Long productId;
	protected String marketarea;
	protected String determini;
	protected String loadtime;
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
	public String getLoadtime() {
		return loadtime;
	}
	public void setLoadtime(String loadtime) {
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
	public Long getProducidMin() {
		return productIdMin;
	}
	public void setProducidMin(Long productIdMin) {
		this.productIdMin = productIdMin;
	}
	public Long getProducidMax() {
		return productIdMax;
	}
	public void setProducidMax(Long productIdMax) {
		this.productIdMax = productIdMax;
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
	public String getDeterminiMin() {
		return determiniMin;
	}
	public void setDeterminiMin(String determiniMin) {
		this.determiniMin = determiniMin;
	}
	public String getDeterminiMax() {
		return determiniMax;
	}
	public void setDeterminiMax(String determiniMax) {
		this.determiniMax = determiniMax;
	}
	public String getLoadtimeMin() {
		return loadtimeMin;
	}
	public void setLoadtimeMin(String loadtimeMin) {
		this.loadtimeMin = loadtimeMin;
	}
	public String getLoadtimeMax() {
		return loadtimeMax;
	}
	public void setLoadtimeMax(String loadtimeMax) {
		this.loadtimeMax = loadtimeMax;
	}
	public String getLoadaddressMin() {
		return loadaddressMin;
	}
	public void setLoadaddressMin(String loadaddressMin) {
		this.loadaddressMin = loadaddressMin;
	}
	public String getLoadaddressMax() {
		return loadaddressMax;
	}
	public void setLoadaddressMax(String loadaddressMax) {
		this.loadaddressMax = loadaddressMax;
	}
	public String getBoxNumMin() {
		return boxNumMin;
	}
	public void setBoxNumMin(String boxNumMin) {
		this.boxNumMin = boxNumMin;
	}
	public String getBoxNumMax() {
		return boxNumMax;
	}
	public void setBoxNumMax(String boxNumMax) {
		this.boxNumMax = boxNumMax;
	}
	public String getUninumMin() {
		return unitNumMin;
	}
	public void setUninumMin(String unitNumMin) {
		this.unitNumMin = unitNumMin;
	}
	public String getUninumMax() {
		return unitNumMax;
	}
	public void setUninumMax(String unitNumMax) {
		this.unitNumMax = unitNumMax;
	}
	public String getBoxTotalMin() {
		return boxTotalMin;
	}
	public void setBoxTotalMin(String boxTotalMin) {
		this.boxTotalMin = boxTotalMin;
	}
	public String getBoxTotalMax() {
		return boxTotalMax;
	}
	public void setBoxTotalMax(String boxTotalMax) {
		this.boxTotalMax = boxTotalMax;
	}
	public String getTotalWeightMin() {
		return totalWeightMin;
	}
	public void setTotalWeightMin(String totalWeightMin) {
		this.totalWeightMin = totalWeightMin;
	}
	public String getTotalWeightMax() {
		return totalWeightMax;
	}
	public void setTotalWeightMax(String totalWeightMax) {
		this.totalWeightMax = totalWeightMax;
	}
	public String getFlagPassMin() {
		return flagPassMin;
	}
	public void setFlagPassMin(String flagPassMin) {
		this.flagPassMin = flagPassMin;
	}
	public String getFlagPassMax() {
		return flagPassMax;
	}
	public void setFlagPassMax(String flagPassMax) {
		this.flagPassMax = flagPassMax;
	}
	public String getRemarkMin() {
		return remarkMin;
	}
	public void setRemarkMin(String remarkMin) {
		this.remarkMin = remarkMin;
	}
	public String getRemarkMax() {
		return remarkMax;
	}
	public void setRemarkMax(String remarkMax) {
		this.remarkMax = remarkMax;
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
