package com.xone.service.app;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ImageUploadedDao;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.support.Pagination;
public class ImageUploadedServiceImpl implements ImageUploadedService {

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
		return getImageUploadedDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(ImageUploaded.class);
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getImageUploadedDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
}