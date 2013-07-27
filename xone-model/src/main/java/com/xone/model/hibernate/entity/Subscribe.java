package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Subscribe implements Serializable {
	
	private static final long serialVersionUID = 7964924149839984200L;
	
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

	public String getSaleTypeName() {
		if ("0".equals(saleType)) {
			return "普通";
		} else if ("1".equals(saleType)) {
			return "促销";
		} else if ("2".equals(saleType)) {
			return "组团";
		}
		return "全部";
	}
	
	public String getCreditName() {
		if ("1".equals(credit)) {
			return "信誉好";
		} else if ("2".equals(credit)) {
			return "信誉一般";
		}
		return "全部";
	}
	
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
	public String getProductNameKey() {
		return productNameKey;
	}
	public void setProductNameKey(String productNameKey) {
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
	public Date getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
}