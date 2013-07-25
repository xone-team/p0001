package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Resources implements Serializable {

	protected Long id;
	protected String name;
	protected Integer resourceType;
	protected Integer priority;
	protected String resourceUrl;
	protected String remark;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getResourceType() {
		return resourceType;
	}
	public void setResourceType(Integer resourceType) {
		this.resourceType = resourceType;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getResourceUrl() {
		return resourceUrl;
	}
	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public String getNameMin() {
		return nameMin;
	}
	public void setNameMin(String nameMin) {
		this.nameMin = nameMin;
	}
	public String getNameMax() {
		return nameMax;
	}
	public void setNameMax(String nameMax) {
		this.nameMax = nameMax;
	}
	public Integer getResourceTypeMin() {
		return resourceTypeMin;
	}
	public void setResourceTypeMin(Integer resourceTypeMin) {
		this.resourceTypeMin = resourceTypeMin;
	}
	public Integer getResourceTypeMax() {
		return resourceTypeMax;
	}
	public void setResourceTypeMax(Integer resourceTypeMax) {
		this.resourceTypeMax = resourceTypeMax;
	}
	public Integer getPriorityMin() {
		return priorityMin;
	}
	public void setPriorityMin(Integer priorityMin) {
		this.priorityMin = priorityMin;
	}
	public Integer getPriorityMax() {
		return priorityMax;
	}
	public void setPriorityMax(Integer priorityMax) {
		this.priorityMax = priorityMax;
	}
	public String getResourceUrlMin() {
		return resourceUrlMin;
	}
	public void setResourceUrlMin(String resourceUrlMin) {
		this.resourceUrlMin = resourceUrlMin;
	}
	public String getResourceUrlMax() {
		return resourceUrlMax;
	}
	public void setResourceUrlMax(String resourceUrlMax) {
		this.resourceUrlMax = resourceUrlMax;
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
