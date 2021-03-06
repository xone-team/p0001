package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @TODO 请Hunny添加代码注释 
 * @author Hunny
 * @created 2011-3-12 下午08:45:43
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class Person extends MyModel implements Serializable {
	
	public static String [] getLogicUserLevel(String userLevel) {
		if (UserLevel.A.getValue().equals(userLevel)) {//如果是A级用户，则AB级的数据可以查看
			return new String[] {
				UserLevel.A.getValue(), UserLevel.B.getValue()	
			};
		} else if (UserLevel.B.getValue().equals(userLevel)) {//如果是B级用户，则ABC级的数据都可以查看
			return new String[] {
				UserLevel.A.getValue(), UserLevel.B.getValue(), UserLevel.C.getValue()	
			};
		} else if (UserLevel.C.getValue().equals(userLevel)) {//如果是C级用户,则BC级的数据可以查看
			return new String[] {
				UserLevel.B.getValue(), UserLevel.C.getValue()	
			};
		}
		//如果没有登录或者登录后身份不是A或者B或者C级用户，则只能查看B级用户数据
		return new String [] {
			UserLevel.B.getValue()
		};
	}
    
	public enum Credit {
		YES("1", "已认证"), NO("0", "未认证");
		protected String value;
		protected String name;

		private Credit(String v, String n) {
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

	public enum UserLevel {
		A("A", "A级客户"), B("B", "B级客户"), C("C", "C级客户");
		protected String value;
		protected String name;

		private UserLevel(String v, String n) {
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
	
	protected static final long serialVersionUID = -7335577468841978562L;
    protected Long id;
    protected String username;
    protected String password;
    protected Long userApply;
    protected Date dateApply;
    protected Long userCheck;
    protected Date dateCheck;
    protected String flagDeleted;
    protected Long userCreated;
    protected Date dateCreated;
    protected Long userUpdated;
    protected Date lastUpdated;
    protected String nickName;
    protected String cellphone;
    protected String contactor;
    protected String qq;
    protected String email;
    protected String address;
    protected String credit;
    protected String userLevel;
    protected String lastMacUpdated;

	
	/**
	 * 以下为业务字段
	 * @return
	 */
	protected String repassword;
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	
	public String getCreditName() {
		for (Credit e : Credit.values()) {
			if (e.getValue().equals(this.credit)) {
				return e.getName();
			}
		}
		return UNKNOWN_STATUS_NAME;
	}

	public String getFlagDeletedName() {
		for (FlagDeleted e : FlagDeleted.values()) {
			if (e.getValue().equals(this.flagDeleted)) {
				return e.getName();
			}
		}
		return UNKNOWN_STATUS_NAME;
	}

	public String getUserLevelName() {
		for (UserLevel e : UserLevel.values()) {
			if (e.getValue().equals(this.userLevel)) {
				return e.getName();
			}
		}
		return UNKNOWN_STATUS_NAME;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getContactor() {
		return contactor;
	}
	public void setContactor(String contactor) {
		this.contactor = contactor;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
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
	public String getLastMacUpdated() {
		return lastMacUpdated;
	}
	public void setLastMacUpdated(String lastMacUpdated) {
		this.lastMacUpdated = lastMacUpdated;
	}
	
}

