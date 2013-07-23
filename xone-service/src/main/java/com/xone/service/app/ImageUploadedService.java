package com.xone.service.app;


import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.support.Pagination;

public interface ImageUploadedService {

	public ImageUploaded save(ImageUploaded entity);
	
	public ImageUploaded update(ImageUploaded entity);

	public ImageUploaded findById(Long id);
	
	public void delete(ImageUploaded entity);

	public List<ImageUploaded> findAllByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
	
}