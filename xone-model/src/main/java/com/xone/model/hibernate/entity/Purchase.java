package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Purchase implements Serializable {
	private static final long serialVersionUID = 3871230298774379727L;
	
	/**
	 * 审核状态
	 */
	public enum CheckStatus {
		WAITING("0"), PASSED("1"), DENIED("2");
		protected String value;
		private CheckStatus(String v) {
			this.value = v;
		}
		public String getValue() {
			return this.value;
		}
	}
	
	/**
	 * 删除标志
	 */
	public enum FlagDeleted {
		NORMAL("0"), DELETED("1");
		protected String value = "0";
		private FlagDeleted(String value) {
			this.value = value;
		}
		public String getValue() {
			return this.value;
		}
	}
	
	protected Long id;
	protected String purchaseName;
	protected String purchaseType;
	protected String checkStatus;
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
	
	public String getPurchaseTypeName() {
		if ("0".equals(purchaseType)) {
			return "冻品";
		} else if ("1".equals(purchaseType)) {
			return "干货";
		} else if ("2".equals(purchaseType)) {
			return "活鲜";
		} else if ("3".equals(purchaseType)) {
			return "水果";
		} else if ("4".equals(purchaseType)) {
			return "调料";
		}
		return "未知";
	}
	
	public String getCheckStatusName() {
		if (CheckStatus.WAITING.getValue().equals(getCheckStatus())) {
			return "待审核";
		} else if (CheckStatus.PASSED.getValue().equals(getCheckStatus())) {
			return "审核通过";
		} else if (CheckStatus.DENIED.getValue().equals(getCheckStatus())) {
			return "审核不通过";
		}
		return "未知";
	}
	
	protected List<Long> ids = new ArrayList<Long>();
	
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
	
	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
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
	public Date getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public List<Long> getIds() {
		return ids;
	}
	public void setIds(List<Long> ids) {
		this.ids = ids;
	}
}
