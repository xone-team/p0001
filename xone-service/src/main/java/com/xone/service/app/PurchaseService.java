package com.xone.service.app;

import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Purchase;

public interface PurchaseService {
	
	public Purchase save(Purchase entity);
	
	public Purchase save(Purchase entity, ImageUploaded imageUploaded);

}
