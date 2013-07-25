package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class UserRoles implements Serializable {

	protected Long id;
	protected Long userId;
	protected Long roleId;
	protected String enable;
	protected Long userCreated;
	protected Date dateCreated;
	protected Long userUpdated;
	protected Date lastUpdated;

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
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
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
	public Long getRoleIdMin() {
		return roleIdMin;
	}
	public void setRoleIdMin(Long roleIdMin) {
		this.roleIdMin = roleIdMin;
	}
	public Long getRoleIdMax() {
		return roleIdMax;
	}
	public void setRoleIdMax(Long roleIdMax) {
		this.roleIdMax = roleIdMax;
	}
	public String getEnableMin() {
		return enableMin;
	}
	public void setEnableMin(String enableMin) {
		this.enableMin = enableMin;
	}
	public String getEnableMax() {
		return enableMax;
	}
	public void setEnableMax(String enableMax) {
		this.enableMax = enableMax;
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
