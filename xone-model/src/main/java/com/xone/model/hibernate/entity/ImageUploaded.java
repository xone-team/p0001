package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class ImageUploaded implements Serializable {
	
	private static final long serialVersionUID = -6681022707035534978L;
	
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
	
	/**
	 * 相关类型
	 */
	public enum RefType {
		PRODUCT("0"), PURCHASE("1"), ABBANNER("2");
		protected String value = null;
		
		private RefType(String v) {
			this.value = v;
		}
		
		public String getValue() {
			return this.value;
		}
	}
	
	protected Long id;
	protected Long refId;
	protected String refType;
	protected String imageType;
	protected Long userCreated;
	protected Date dateCreated;
	protected Long userUpdated;
	protected Date lastUpdated;
	protected String image;
	protected String flagDeleted;
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
	public String getRefType() {
		return refType;
	}
	public void setRefType(String refType) {
		this.refType = refType;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
	public String getImageType() {
		return imageType;
	}
	public void setImageType(String imageType) {
		this.imageType = imageType;
	}
	public String getFlagDeleted() {
		return flagDeleted;
	}
	public void setFlagDeleted(String flagDeleted) {
		this.flagDeleted = flagDeleted;
	}
}
