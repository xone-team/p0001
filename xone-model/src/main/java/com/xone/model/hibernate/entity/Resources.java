package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class Resources extends MyModel implements Serializable {
	
	private static final long serialVersionUID = -4661493000071477326L;
	
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
	
	public enum ResourceType {
        BACK("1", "后台"), WEB("2", "网站"), APP("3", "移动");
        protected String value;
        protected String name;

        private ResourceType(String v, String n) {
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
    
    public String getResourceTypeName(){
        String result = null;
        for (ResourceType e : ResourceType.values()) {
            if(e.getValue().equals(this.resourceType)){
                result = e.getName();
                break;
            }
        }
        return result == null ? UNKNOWN_STATUS_NAME : result;
    }
    
    public enum Enable {
      YES("1", "可用"), NO("0", "不可用");
      protected String value;
      protected String name;
      
      private Enable(String v, String n) {
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
    
    public String getEnableName(){
      String result = null;
      for (Enable e : Enable.values()) {
        if(e.getValue().equals(this.enable)){
          result = e.getName();
          break;
        }
      }
      return result == null ? UNKNOWN_STATUS_NAME : result;
    }
	
    // business logic
    protected Long idMin;
    protected Long idMax;
    protected Integer resourceTypeMin;
    protected Integer resourceTypeMax;
    protected Integer priorityMin;
    protected Integer priorityMax;
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
	public Date getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
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
	
	
	
}