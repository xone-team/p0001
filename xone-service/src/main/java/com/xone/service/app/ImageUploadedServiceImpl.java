package com.xone.service.app;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ImageUploadedDao;
import com.xone.model.hibernate.entity.ImageUploaded;

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
	public ImageUploaded findById(Long id) {
		return getImageUploadedDao().findById(id);
	}
}