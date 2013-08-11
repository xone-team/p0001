package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.support.Pagination;

public interface ProductService {

	public Product save(Product entity);
	
	public Product save(Product entity, List<ImageUploaded> imageUploadeds);

	public Product update(Product entity);
	
	public Product save(Product entity, ImageUploaded imageUploadeds);

	public Product findById(Long id);

	public void delete(Product entity);
	
	public Product update(Product entity, List<ImageUploaded> imageUploadeds, List<Long> imageIds);
	
	public Product findByMap(Map<String, String> params);

	public List<Product> findAllByMap(Map<String, Object> params);
	
	public List<Product> findAllByMapForUser(Map<String, String> params);

	public Pagination findByParams(Map<String, String> params);
	
	/**
	 * 过期更新
	 */
	public void updateFlagDeletedWhenExpired();
	
}