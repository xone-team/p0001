package com.xone.model.hibernate.entity;

import java.util.Date;

import org.apache.commons.lang.xwork.StringUtils;


public class Delivery extends CommonEntity {

	private static final long serialVersionUID = -3781907189265242827L;
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
	
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
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
	public String getUnitNum() {
		return unitNum;
	}
	public void setUnitNum(String unitNum) {
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
	
	public String getHandleStatus() {
		if ("0".equals(getFlagPass())) {
			return "已交易";
		} else if ("1".equals(getFlagPass())) {
			return "已取消";
		}
		return "处理中";
	}
	
}
