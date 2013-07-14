package com.xone.service.app;

import com.xone.model.hibernate.entity.ImageUploaded;

public interface ImageUploadedService {

	public ImageUploaded save(ImageUploaded entity);

	public ImageUploaded findById(Long id);
	
}