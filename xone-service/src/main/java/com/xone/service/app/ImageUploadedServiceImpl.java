package com.xone.service.app;
import java.text.ParseException;
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

import com.xone.model.hibernate.app.ImageUploadedDao;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.support.Pagination;
public class ImageUploadedServiceImpl implements ImageUploadedService {
    private static final Log log = LogFactory.getLog(ImageUploadedServiceImpl.class);

	@Autowired
	protected ImageUploadedDao imageUploadedDao;

	public ImageUploadedDao getImageUploadedDao() {
		return imageUploadedDao;
	}

	public void setImageUploadedDao(ImageUploadedDao imageUploadedDao) {
		this.imageUploadedDao = imageUploadedDao;
	}

	@Override
	public ImageUploaded save(ImageUploaded entity) {
		return getImageUploadedDao().save(entity);
	}
	
	@Override
	public ImageUploaded update(ImageUploaded entity) {
		return getImageUploadedDao().update(entity);
	}
	
	@Override
	public void delete(ImageUploaded entity) {
		getImageUploadedDao().deleteById(entity.getId());
	}

	@Override
	public ImageUploaded findById(Long id) {
		return getImageUploadedDao().findById(id);
	}
	
	@Override
	public List<ImageUploaded> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(ImageUploaded.class);
		
		handleCriteriaByParams(detachedCriteria, params);
		
		return getImageUploadedDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(ImageUploaded.class);
		
		handleCriteriaByParams(detachedCriteria, params);
		
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getImageUploadedDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
        String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
        String refId = params.get("refId");
        if (!StringUtils.isBlank(refId)) {
            criteria.add(Restrictions.eq("refId", Long.parseLong(refId)));
        }
        String refType = params.get("refType");
        if (!StringUtils.isBlank(refType)) {
            criteria.add(Restrictions.like("refType", "%" + refType + "%"));
        }
        String imageType = params.get("imageType");
        if (!StringUtils.isBlank(imageType)) {
            criteria.add(Restrictions.like("imageType", "%" + imageType + "%"));
        }
        String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            criteria.add(Restrictions.eq("userCreated", Long.parseLong(userCreated)));
        }
        String dateCreatedMin = params.get("dateCreatedMin");
        if (!StringUtils.isBlank(dateCreatedMin)) {
            try {
                criteria.add(Restrictions.ge("dateCreated", DateUtils.parseDate(dateCreatedMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[dateCreatedMin] parsed exception :", e);
            }
        }
        String dateCreatedMax = params.get("dateCreatedMax");
        if (!StringUtils.isBlank(dateCreatedMax)) {
            try {
                criteria.add(Restrictions.lt("dateCreated", DateUtils.addDays(DateUtils.parseDate(dateCreatedMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[dateCreatedMax] parsed exception :", e);
            }
        }
        String userUpdated = params.get("userUpdated");
        if (!StringUtils.isBlank(userUpdated)) {
            criteria.add(Restrictions.eq("userUpdated", Long.parseLong(userUpdated)));
        }
        String lastUpdatedMin = params.get("lastUpdatedMin");
        if (!StringUtils.isBlank(lastUpdatedMin)) {
            try {
                criteria.add(Restrictions.ge("lastUpdated", DateUtils.parseDate(lastUpdatedMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[lastUpdatedMin] parsed exception :", e);
            }
        }
        String lastUpdatedMax = params.get("lastUpdatedMax");
        if (!StringUtils.isBlank(lastUpdatedMax)) {
            try {
                criteria.add(Restrictions.lt("lastUpdated", DateUtils.addDays(DateUtils.parseDate(lastUpdatedMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[lastUpdatedMax] parsed exception :", e);
            }
        }
        String image = params.get("image");
        if (!StringUtils.isBlank(image)) {
            criteria.add(Restrictions.like("image", "%" + image + "%"));
        }
        String flagDeleted = params.get("flagDeleted");
        if (!StringUtils.isBlank(flagDeleted)) {
            criteria.add(Restrictions.like("flagDeleted", "%" + flagDeleted + "%"));
        }
        
        criteria.addOrder(Order.desc("dateCreated"));
    }
}