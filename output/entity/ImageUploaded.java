package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class ImageUploaded implements Serializable {

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

// business logic
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
	public String getRefType() {
		return refType;
	}
	public void setRefType(String refType) {
		this.refType = refType;
	}
	public String getImageType() {
		return imageType;
	}
	public void setImageType(String imageType) {
		this.imageType = imageType;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getFlagDeleted() {
		return flagDeleted;
	}
	public void setFlagDeleted(String flagDeleted) {
		this.flagDeleted = flagDeleted;
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
	public String getRefTypeMin() {
		return refTypeMin;
	}
	public void setRefTypeMin(String refTypeMin) {
		this.refTypeMin = refTypeMin;
	}
	public String getRefTypeMax() {
		return refTypeMax;
	}
	public void setRefTypeMax(String refTypeMax) {
		this.refTypeMax = refTypeMax;
	}
	public String getImageTypeMin() {
		return imageTypeMin;
	}
	public void setImageTypeMin(String imageTypeMin) {
		this.imageTypeMin = imageTypeMin;
	}
	public String getImageTypeMax() {
		return imageTypeMax;
	}
	public void setImageTypeMax(String imageTypeMax) {
		this.imageTypeMax = imageTypeMax;
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
	public String getImageMin() {
		return imageMin;
	}
	public void setImageMin(String imageMin) {
		this.imageMin = imageMin;
	}
	public String getImageMax() {
		return imageMax;
	}
	public void setImageMax(String imageMax) {
		this.imageMax = imageMax;
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
	
}
