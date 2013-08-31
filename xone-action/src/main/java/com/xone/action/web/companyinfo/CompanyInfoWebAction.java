package com.xone.action.web.companyinfo;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.model.hibernate.entity.CompanyInfo;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.support.Pagination;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.CompanyInfoService;
import com.xone.service.app.PersonService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class CompanyInfoWebAction extends LogicAction {

  /**
   * 
   */
  private static final long serialVersionUID = 935686216115181955L;
  @Autowired
  protected CompanyInfoService companyInfoService;
  protected CompanyInfo companyInfo = new CompanyInfo();
  protected List<CompanyInfo> list = new ArrayList<CompanyInfo>();
  protected Pagination pagination = new Pagination();

  protected File uploadFile1;
  protected String uploadFile1ContentType;
  protected String uploadFile1FileName;

  protected File uploadFile2;
  protected String uploadFile2ContentType;
  protected String uploadFile2FileName;

  protected File uploadFile3;
  protected String uploadFile3ContentType;
  protected String uploadFile3FileName;

  protected String imageUploadPath;

  protected Person person = new Person();
  protected PersonService personService;

  public String companyInfoList() throws Exception {
    Map<String, String> params = new HashMap<String, String>();
    MyBeanUtils.copyPropertiesToMap(getCompanyInfo(), params, new CopyRules() {
      @Override
      public boolean myCopyRules(Object value) {
        return null != value;
      }
    }, new AssignRules() {
      @Override
      public String myAssignRules(Object value) {
        if (null != value && value instanceof Date) {
          return MyDateUtils.format((Date) value, "yyyy-MM-dd");
        }
        return value.toString();
      }
    }, null);
    
    params.put("userId", getUserId().toString());
    
    params.put("pageSize", String.valueOf(getPagination().getPageSize()));
    params.put("pageNo", String.valueOf(getPagination().getPageNo()));
    Pagination p = getCompanyInfoService().findByParams(params);
    setPagination(p);
    return SUCCESS;
  }

  public String companyInfoItem() throws Exception {
    CompanyInfo entity = getCompanyInfoService().findById(getCompanyInfo().getId());
    if (null == entity || null == entity.getId()) {
      return ERROR;
    }
    setCompanyInfo(entity);
    return SUCCESS;
  }

  public String companyInfoCreate() throws Exception {
    return SUCCESS;
  }

  public String companyInfoEdit() throws Exception {
    CompanyInfo entity = getCompanyInfoService().findById(getCompanyInfo().getId());
    if (null == entity || null == entity.getId()) {
      return ERROR;
    }
    setCompanyInfo(entity);
    return SUCCESS;
  }

  public String companyInfoSave() throws Exception {
    companyInfo.setUserCreated(getUserId());
    companyInfo.setDateCreated(new Date());
    companyInfo.setUserUpdated(getUserId());
    companyInfo.setLastUpdated(new Date());
    companyInfo.setUserId(getUserId());
    try {
      setCompanyInfo(getCompanyInfoService().save(companyInfo, getImageList()));
    } catch (Exception e) {
      log.error(e.getMessage(), e);
      addActionError(e.getMessage());
      return INPUT;
    }
    return SUCCESS;
  }

  private List<ImageUploaded> getImageList() {
    List<ImageUploaded> images = new ArrayList<ImageUploaded>();
    if (uploadFile1 != null) {
      ImageUploaded imageUploaded1 =
          createUploadImageByFile(imageUploadPath, ImageUploaded.RefType.COMPANY, getUploadFile1(),
              getUploadFile1ContentType(), getUploadFile1FileName());
      images.add(imageUploaded1);
    }
    if (uploadFile2 != null) {
      ImageUploaded imageUploaded2 =
          createUploadImageByFile(imageUploadPath, ImageUploaded.RefType.COMPANY, getUploadFile2(),
              getUploadFile2ContentType(), getUploadFile2FileName());
      images.add(imageUploaded2);
    }
    if (uploadFile3 != null) {
      ImageUploaded imageUploaded3 =
          createUploadImageByFile(imageUploadPath, ImageUploaded.RefType.COMPANY, getUploadFile3(),
              getUploadFile3ContentType(), getUploadFile3FileName());
      images.add(imageUploaded3);
    }

    return images;
  }

  public String companyInfoUpdate() throws Exception {
    if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
      return ERROR;
    }
    String opt =
        null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap()
            .get("delete");
    if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
      CompanyInfo entity = getCompanyInfoService().findById(getCompanyInfo().getId());
      if (null == entity || null == entity.getId()) {
        return ERROR;
      }
      getCompanyInfoService().delete(entity);
      return "list";
    }
    if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
      CompanyInfo entity = getCompanyInfoService().findById(getCompanyInfo().getId());
      if (null == entity || null == entity.getId()) {
        return ERROR;
      }
      List<Long> oldIds = entity.getIds();
      List<Long> newIds = companyInfo.getIds();
      
      MyBeanUtils.copyProperties(getCompanyInfo(), entity, CompanyInfo.class, null,
          new CopyRules() {
            @Override
            public boolean myCopyRules(Object value) {
              return (null != value);
            }
          });

      entity.setUserUpdated(getUserId());
      entity.setLastUpdated(new Date());
      try {
        entity.setIds(oldIds);
        setCompanyInfo(getCompanyInfoService().update(entity, getImageList(), newIds));
      } catch (Exception e) {
        log.error(e.getMessage(), e);
        addActionError(e.getMessage());
        return INPUT;
      }
    }
    return SUCCESS;
  }

  public CompanyInfoService getCompanyInfoService() {
    return companyInfoService;
  }

  public void setCompanyInfoService(CompanyInfoService companyInfoService) {
    this.companyInfoService = companyInfoService;
  }

  public List<CompanyInfo> getList() {
    return list;
  }

  public void setList(List<CompanyInfo> list) {
    this.list = list;
  }

  public CompanyInfo getCompanyInfo() {
    return companyInfo;
  }

  public void setCompanyInfo(CompanyInfo companyInfo) {
    this.companyInfo = companyInfo;
  }

  public Pagination getPagination() {
    return pagination;
  }

  public void setPagination(Pagination pagination) {
    this.pagination = pagination;
  }

  public Person getPerson() {
    return person;
  }

  public void setPerson(Person person) {
    this.person = person;
  }

  public PersonService getPersonService() {
    return personService;
  }

  public void setPersonService(PersonService personService) {
    this.personService = personService;
  }

  public File getUploadFile1() {
    return uploadFile1;
  }

  public void setUploadFile1(File uploadFile1) {
    this.uploadFile1 = uploadFile1;
  }

  public String getUploadFile1ContentType() {
    return uploadFile1ContentType;
  }

  public void setUploadFile1ContentType(String uploadFile1ContentType) {
    this.uploadFile1ContentType = uploadFile1ContentType;
  }

  public String getUploadFile1FileName() {
    return uploadFile1FileName;
  }

  public void setUploadFile1FileName(String uploadFile1FileName) {
    this.uploadFile1FileName = uploadFile1FileName;
  }

  public File getUploadFile2() {
    return uploadFile2;
  }

  public void setUploadFile2(File uploadFile2) {
    this.uploadFile2 = uploadFile2;
  }

  public String getUploadFile2ContentType() {
    return uploadFile2ContentType;
  }

  public void setUploadFile2ContentType(String uploadFile2ContentType) {
    this.uploadFile2ContentType = uploadFile2ContentType;
  }

  public String getUploadFile2FileName() {
    return uploadFile2FileName;
  }

  public void setUploadFile2FileName(String uploadFile2FileName) {
    this.uploadFile2FileName = uploadFile2FileName;
  }

  public File getUploadFile3() {
    return uploadFile3;
  }

  public void setUploadFile3(File uploadFile3) {
    this.uploadFile3 = uploadFile3;
  }

  public String getUploadFile3ContentType() {
    return uploadFile3ContentType;
  }

  public void setUploadFile3ContentType(String uploadFile3ContentType) {
    this.uploadFile3ContentType = uploadFile3ContentType;
  }

  public String getUploadFile3FileName() {
    return uploadFile3FileName;
  }

  public void setUploadFile3FileName(String uploadFile3FileName) {
    this.uploadFile3FileName = uploadFile3FileName;
  }

  public String getImageUploadPath() {
    return imageUploadPath;
  }

  public void setImageUploadPath(String imageUploadPath) {
    this.imageUploadPath = imageUploadPath;
  }

}
