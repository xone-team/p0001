package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

import com.xone.model.hibernate.entity.Adbanner.AdType;
import com.xone.model.hibernate.support.CommonTypes;

/**
 * @TODO 请Hunny添加代码注释 
 * @author Hunny
 * @created 2011-3-12 下午08:45:43
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class Person implements Serializable {
	
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

// business logic
    protected Long idMin;
    protected Long idMax;
    protected Long userApplyMin;
    protected Long userApplyMax;
    protected String dateApplyMin;
    protected String dateApplyMax;
    protected Long userCheckMin;
    protected Long userCheckMax;
    protected String dateCheckMin;
    protected String dateCheckMax;
    protected Long userCreatedMin;
    protected Long userCreatedMax;
    protected String dateCreatedMin;
    protected String dateCreatedMax;
    protected Long userUpdatedMin;
    protected Long userUpdatedMax;
    protected String lastUpdatedMin;
    protected String lastUpdatedMax;
	
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
	
	public String getCreditName(){
        return CommonTypes.getYNTypeName(credit);
	}
	
	public String getFlagDeletedName(){
	    return CommonTypes.getYNTypeName(flagDeleted);
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
    public String getDateApplyMin() {
        return dateApplyMin;
    }
    public void setDateApplyMin(String dateApplyMin) {
        this.dateApplyMin = dateApplyMin;
    }
    public String getDateApplyMax() {
        return dateApplyMax;
    }
    public void setDateApplyMax(String dateApplyMax) {
        this.dateApplyMax = dateApplyMax;
    }
    public String getDateCheckMin() {
        return dateCheckMin;
    }
    public void setDateCheckMin(String dateCheckMin) {
        this.dateCheckMin = dateCheckMin;
    }
    public String getDateCheckMax() {
        return dateCheckMax;
    }
    public void setDateCheckMax(String dateCheckMax) {
        this.dateCheckMax = dateCheckMax;
    }
    public String getDateCreatedMin() {
        return dateCreatedMin;
    }
    public void setDateCreatedMin(String dateCreatedMin) {
        this.dateCreatedMin = dateCreatedMin;
    }
    public String getDateCreatedMax() {
        return dateCreatedMax;
    }
    public void setDateCreatedMax(String dateCreatedMax) {
        this.dateCreatedMax = dateCreatedMax;
    }
    public String getLastUpdatedMin() {
        return lastUpdatedMin;
    }
    public void setLastUpdatedMin(String lastUpdatedMin) {
        this.lastUpdatedMin = lastUpdatedMin;
    }
    public String getLastUpdatedMax() {
        return lastUpdatedMax;
    }
    public void setLastUpdatedMax(String lastUpdatedMax) {
        this.lastUpdatedMax = lastUpdatedMax;
    }
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
    public Long getUserApplyMin() {
        return userApplyMin;
    }
    public void setUserApplyMin(Long userApplyMin) {
        this.userApplyMin = userApplyMin;
    }
    public Long getUserApplyMax() {
        return userApplyMax;
    }
    public void setUserApplyMax(Long userApplyMax) {
        this.userApplyMax = userApplyMax;
    }
    public Long getUserCheckMin() {
        return userCheckMin;
    }
    public void setUserCheckMin(Long userCheckMin) {
        this.userCheckMin = userCheckMin;
    }
    public Long getUserCheckMax() {
        return userCheckMax;
    }
    public void setUserCheckMax(Long userCheckMax) {
        this.userCheckMax = userCheckMax;
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
	
}

