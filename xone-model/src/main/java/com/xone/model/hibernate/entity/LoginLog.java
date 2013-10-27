package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class LoginLog extends MyModel implements Serializable {

	protected Long id;
	protected Long userId;
	protected String ip;
	protected String category;
	protected String userAgent;
	protected String mac;
	protected Date dateCreated;
	protected Date lastUpdated;
	
	/**
	 * 登录类型
	 */
	public enum LoginCatetory {
		MOBILE("0", "移动端登录"), WEB("1", "网站端登录"), BACK("2", "后台登录"), SUBSCRIBE("3", "订阅登录");
        protected String value;
        protected String name;
        private LoginCatetory(String v, String n) {
            this.value = v;
            this.name = n;
        }
        public String getValue() {
            return this.value;
        }
        public String getName() {
            return this.name;
        }
	}

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
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	public String getMac() {
		return mac;
	}
	public void setMac(String mac) {
		this.mac = mac;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public Date getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}


	
}
