package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Category implements Serializable {

	protected Long id;
	protected String name;
	protected String detail;
	protected Integer sort;
	protected String flagDeleted;
	protected Long userCreated;
	protected Date dateCreated;
	protected Long userUpdated;
	protected Date lastUpdated;

// business logic
	protected Long idMin;
	protected Long idMax;
	protected Integer sortMin;
	protected Integer sortMax;
	protected Long userCreatedMin;
	protected Long userCreatedMax;
	protected String dateCreatedMin;
	protected String dateCreatedMax;
	protected Long userUpdatedMin;
	protected Long userUpdatedMax;
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
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


	
}
