package com.xone.service.app;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ImageUploadedDao;
import com.xone.model.hibernate.app.PurchaseDao;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Purchase;

public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	protected PurchaseDao purchaseDao;
	
	@Autowired
	protected ImageUploadedDao imageUploadedDao;
	
	public PurchaseDao getPurchaseDao() {
		return purchaseDao;
	}


	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

	public ImageUploadedDao getImageUploadedDao() {
		return imageUploadedDao;
	}

	public void setImageUploadedDao(ImageUploadedDao imageUploadedDao) {
		this.imageUploadedDao = imageUploadedDao;
	}


	@Override
	public Purchase save(Purchase entity) {
		return getPurchaseDao().save(entity);
	}


	@Override
	public Purchase save(Purchase entity, ImageUploaded imageUploaded) {
		entity = getPurchaseDao().save(entity);
		imageUploaded.setRefId(entity.getId());
		imageUploaded = getImageUploadedDao().save(imageUploaded);
		entity.getIds().add(imageUploaded.getId());
		return entity;
	}

}
