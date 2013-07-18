package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Product;

public interface ProductService {

	public Product save(Product entity);
	
	public Product save(Product entity, List<ImageUploaded> imageUploadeds);
	
	public Product save(Product entity, ImageUploaded imageUploadeds);

	public Product findById(Long id);
	
	public Product update(Product entity, List<ImageUploaded> imageUploadeds, List<Long> imageIds);
	
	public Product findByMap(Map<String, String> params);

	public List<Product> findAllByMap(Map<String, String> params);
	
}