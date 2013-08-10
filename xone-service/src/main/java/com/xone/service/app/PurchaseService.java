package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;
public interface PurchaseService {
	
	public Purchase save(Purchase entity);
	
	public Purchase save(Purchase entity, List<ImageUploaded> imageUploadeds);

	public Purchase update(Purchase entity);

	public Purchase findById(Long id);
	
	public void delete(Purchase entity);	
	public List<Purchase> save(List<Purchase> entity);
	
	public Purchase save(Purchase entity, ImageUploaded imageUploaded);
	
	public Purchase update(Purchase entity, List<ImageUploaded> imageUploadeds, List<Long> imageIds);
	
	public List<Purchase> findAllByMap(Map<String, Object> params);
	
	public List<Purchase> findAllByMapForUser(Map<String, String> params);
	
	public Purchase findByMap(Map<String, String> params);

	public Pagination findByParams(Map<String, String> params);
}
