package com.xone.service.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.CompanyInfoDao;
import com.xone.model.hibernate.app.ImageUploadedDao;
import com.xone.model.hibernate.entity.CompanyInfo;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.support.Pagination;

public class CompanyInfoServiceImpl implements CompanyInfoService {
  Log log = LogFactory.getLog(CompanyInfoServiceImpl.class);

  @Autowired
  protected CompanyInfoDao companyInfoDao;

  @Autowired
  protected ImageUploadedDao imageUploadedDao;

  @Override
  public CompanyInfo save(CompanyInfo entity) {
    return getCompanyInfoDao().save(entity);
  }

  @Override
  public CompanyInfo update(CompanyInfo entity) {
    return getCompanyInfoDao().update(entity);
  }

  @Override
  public void delete(CompanyInfo entity) {
    getCompanyInfoDao().deleteById(entity.getId());
  }

  @Override
  public CompanyInfo save(CompanyInfo entity, List<ImageUploaded> imageUploadeds) {
    entity = getCompanyInfoDao().save(entity);
    for (ImageUploaded imageUploaded : imageUploadeds) {
      imageUploaded.setRefId(entity.getId());
      imageUploaded.setRefType(ImageUploaded.RefType.COMPANY.getValue());
      imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL.getValue());
    }
    imageUploadeds = getImageUploadedDao().save(imageUploadeds);
    List<Long> ids = new ArrayList<Long>();
    for (ImageUploaded imageUploaded : imageUploadeds) {
      ids.add(imageUploaded.getId());
    }
    entity.setIds(ids);
    return entity;
  }
  
  @Override
  public CompanyInfo update(CompanyInfo entity, List<ImageUploaded> imageUploadeds, List<Long> imageIds) {
      for (ImageUploaded imageUploaded : imageUploadeds) {
          imageUploaded.setRefId(entity.getId());
          imageUploaded.setRefType(ImageUploaded.RefType.COMPANY.getValue());
          imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL.getValue());
      }
      imageUploadeds = getImageUploadedDao().save(imageUploadeds);
      Map<Long, Boolean> imageIdMap = new HashMap<Long, Boolean>();
      List<Long> ids = new ArrayList<Long>();
      for (Long id : imageIds) {
          imageIdMap.put(id, true);
      }
      for (Long id : entity.getIds()) {
          if (null == imageIdMap.get(id)) {
              getImageUploadedDao().deleteLogicById(id);
          } else {
              ids.add(id);
          }
      }
      for (ImageUploaded imageUploaded : imageUploadeds) {
          ids.add(imageUploaded.getId());
      }
      entity.setIds(ids);

      entity = getCompanyInfoDao().update(entity);
      
      return entity;
  }

  /**
   * 根据公司标识查询公司信息，包括公司关联的图片信息
   */
  @Override
  public CompanyInfo findById(Long id) {
    CompanyInfo companyInfo = getCompanyInfoDao().findById(id);
    if (null != companyInfo) {
      List<Long> ids =
          getImageUploadedDao().findAllIdsByRefId(companyInfo.getId(),
              ImageUploaded.RefType.COMPANY);
      companyInfo.setIds(ids);
    }
    return companyInfo;
  }

  @Override
  public CompanyInfo findByMap(Map<String, String> params) {
    DetachedCriteria detachedCriteria = DetachedCriteria.forClass(CompanyInfo.class);
    List<CompanyInfo> l = getCompanyInfoDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
    if (null == l) {
      return new CompanyInfo();
    }
    return l.get(0);
  }

  @Override
  public List<CompanyInfo> findAllByMap(Map<String, String> params) {
    DetachedCriteria detachedCriteria = DetachedCriteria.forClass(CompanyInfo.class);
    detachedCriteria.addOrder(Order.desc("dateCreated"));
    return getCompanyInfoDao().findListByDetachedCriteria(detachedCriteria, 0, 10);
  }

  public Pagination findByParams(Map<String, String> params) {
    DetachedCriteria detachedCriteria = DetachedCriteria.forClass(CompanyInfo.class);
    int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
    int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
    return getCompanyInfoDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
  }

  public CompanyInfoDao getCompanyInfoDao() {
    return companyInfoDao;
  }

  public void setCompanyInfoDao(CompanyInfoDao companyInfoDao) {
    this.companyInfoDao = companyInfoDao;
  }

  public ImageUploadedDao getImageUploadedDao() {
    return imageUploadedDao;
  }

  public void setImageUploadedDao(ImageUploadedDao imageUploadedDao) {
    this.imageUploadedDao = imageUploadedDao;
  }

}
