package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Purchase;

public interface PurchaseService {
	
	public Purchase save(Purchase entity);
	
	public Purchase save(Purchase entity, List<ImageUploaded> imageUploadeds);
	
	public List<Purchase> save(List<Purchase> entity);
	
	public Purchase save(Purchase entity, ImageUploaded imageUploaded);
	
	public List<Purchase> findAllByMap(Map<String, String> params);
	
	public Purchase findByMap(Map<String, String> params);

}
