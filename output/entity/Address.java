package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Address implements Serializable {

	protected Long id;
	protected String provinceCode;
	protected String cityCode;
	protected String districtCode;
	protected String detail;
	protected String zip;
	protected String flagDeleted;
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
	public String getProvinceCode() {
		return provinceCode;
	}
	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getDistriccode() {
		return districtCode;
	}
	public void setDistriccode(String districtCode) {
		this.districtCode = districtCode;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
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
	public String getProvinceCodeMin() {
		return provinceCodeMin;
	}
	public void setProvinceCodeMin(String provinceCodeMin) {
		this.provinceCodeMin = provinceCodeMin;
	}
	public String getProvinceCodeMax() {
		return provinceCodeMax;
	}
	public void setProvinceCodeMax(String provinceCodeMax) {
		this.provinceCodeMax = provinceCodeMax;
	}
	public String getCityCodeMin() {
		return cityCodeMin;
	}
	public void setCityCodeMin(String cityCodeMin) {
		this.cityCodeMin = cityCodeMin;
	}
	public String getCityCodeMax() {
		return cityCodeMax;
	}
	public void setCityCodeMax(String cityCodeMax) {
		this.cityCodeMax = cityCodeMax;
	}
	public String getDistriccodeMin() {
		return districtCodeMin;
	}
	public void setDistriccodeMin(String districtCodeMin) {
		this.districtCodeMin = districtCodeMin;
	}
	public String getDistriccodeMax() {
		return districtCodeMax;
	}
	public void setDistriccodeMax(String districtCodeMax) {
		this.districtCodeMax = districtCodeMax;
	}
	public String getDetailMin() {
		return detailMin;
	}
	public void setDetailMin(String detailMin) {
		this.detailMin = detailMin;
	}
	public String getDetailMax() {
		return detailMax;
	}
	public void setDetailMax(String detailMax) {
		this.detailMax = detailMax;
	}
	public String getZipMin() {
		return zipMin;
	}
	public void setZipMin(String zipMin) {
		this.zipMin = zipMin;
	}
	public String getZipMax() {
		return zipMax;
	}
	public void setZipMax(String zipMax) {
		this.zipMax = zipMax;
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
