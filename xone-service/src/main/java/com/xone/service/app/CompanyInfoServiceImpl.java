package com.xone.service.app;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
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
	public CompanyInfo save(CompanyInfo entity,
			List<ImageUploaded> imageUploadeds) {
		entity = getCompanyInfoDao().save(entity);
		for (ImageUploaded imageUploaded : imageUploadeds) {
			imageUploaded.setRefId(entity.getId());
			imageUploaded.setRefType(ImageUploaded.RefType.COMPANY.getValue());
			imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL
					.getValue());
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
	public CompanyInfo update(CompanyInfo entity,
			List<ImageUploaded> imageUploadeds, List<Long> imageIds) {
		for (ImageUploaded imageUploaded : imageUploadeds) {
			imageUploaded.setRefId(entity.getId());
			imageUploaded.setRefType(ImageUploaded.RefType.COMPANY.getValue());
			imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL
					.getValue());
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
			List<Long> ids = getImageUploadedDao().findAllIdsByRefId(
					companyInfo.getId(), ImageUploaded.RefType.COMPANY);
			companyInfo.setIds(ids);
		}
		return companyInfo;
	}

	@Override
	public CompanyInfo findByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(CompanyInfo.class);
		
		handleCriteriaByParams(detachedCriteria, params);
		
		List<CompanyInfo> l = getCompanyInfoDao().findListByDetachedCriteria(
				detachedCriteria, 0, 1);
		if (null == l) {
			return new CompanyInfo();
		}
		return l.get(0);
	}

	@Override
	public List<CompanyInfo> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(CompanyInfo.class);
		
		handleCriteriaByParams(detachedCriteria, params);
		
		return getCompanyInfoDao().findListByDetachedCriteria(detachedCriteria,
				0, 10);
	}

	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(CompanyInfo.class);
		
		handleCriteriaByParams(detachedCriteria, params);
		
		int pageSize = com.xone.model.utils.MyModelUtils.parseInt(
				params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.MyModelUtils.parseInt(
				params.get("pageNo"), 0);
		return getCompanyInfoDao().findByDetachedCriteria(detachedCriteria,
				pageSize, startIndex);
	}

	protected void handleCriteriaByParams(DetachedCriteria criteria,
			Map<String, String> params) {
		String id = params.get("id");
		if (!StringUtils.isBlank(id)) {
			criteria.add(Restrictions.eq("id", new Long(id)));
		}
		String name = params.get("name");
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("name", "%" + name + "%"));
		}
		String address = params.get("address");
		if (!StringUtils.isBlank(address)) {
			criteria.add(Restrictions.like("address", "%" + address + "%"));
		}
		String tel = params.get("tel");
		if (!StringUtils.isBlank(tel)) {
			criteria.add(Restrictions.like("tel", "%" + tel + "%"));
		}
		String mobile = params.get("mobile");
		if (!StringUtils.isBlank(mobile)) {
			criteria.add(Restrictions.like("mobile", "%" + mobile + "%"));
		}
		String contact = params.get("contact");
		if (!StringUtils.isBlank(contact)) {
			criteria.add(Restrictions.like("contact", "%" + contact + "%"));
		}
		String fax = params.get("fax");
		if (!StringUtils.isBlank(fax)) {
			criteria.add(Restrictions.like("fax", "%" + fax + "%"));
		}
		String intro = params.get("intro");
		if (!StringUtils.isBlank(intro)) {
			criteria.add(Restrictions.like("intro", "%" + intro + "%"));
		}
		String userId = params.get("userId");
		if (!StringUtils.isBlank(userId)) {
			criteria.add(Restrictions.eq("userId", new Long(userId)));
		}
		String userCreated = params.get("userCreated");
		if (!StringUtils.isBlank(userCreated)) {
			criteria.add(Restrictions.eq("userCreated", new Long(userCreated)));
		}
		String dateCreatedMin = params.get("dateCreatedMin");
		if (!StringUtils.isBlank(dateCreatedMin)) {
			try {
				criteria.add(Restrictions.ge("dateCreated",
						DateUtils.parseDate(dateCreatedMin, "yyyy-MM-dd")));
			} catch (ParseException e) {
				log.error("[dateCreatedMin] parsed exception :", e);
			}
		}
		String dateCreatedMax = params.get("dateCreatedMax");
		if (!StringUtils.isBlank(dateCreatedMax)) {
			try {
				criteria.add(Restrictions.lt("dateCreated", DateUtils.addDays(
						DateUtils.parseDate(dateCreatedMax, "yyyy-MM-dd"), 1)));
			} catch (ParseException e) {
				log.error("[dateCreatedMax] parsed exception :", e);
			}
		}
		String userUpdated = params.get("userUpdated");
		if (!StringUtils.isBlank(userUpdated)) {
			criteria.add(Restrictions.eq("userUpdated", new Long(userUpdated)));
		}
		String lastUpdatedMin = params.get("lastUpdatedMin");
		if (!StringUtils.isBlank(lastUpdatedMin)) {
			try {
				criteria.add(Restrictions.ge("lastUpdated",
						DateUtils.parseDate(lastUpdatedMin, "yyyy-MM-dd")));
			} catch (ParseException e) {
				log.error("[lastUpdatedMin] parsed exception :", e);
			}
		}
		String lastUpdatedMax = params.get("lastUpdatedMax");
		if (!StringUtils.isBlank(lastUpdatedMax)) {
			try {
				criteria.add(Restrictions.lt("lastUpdated", DateUtils.addDays(
						DateUtils.parseDate(lastUpdatedMax, "yyyy-MM-dd"), 1)));
			} catch (ParseException e) {
				log.error("[lastUpdatedMax] parsed exception :", e);
			}
		}

		criteria.addOrder(Order.desc("dateCreated"));
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
