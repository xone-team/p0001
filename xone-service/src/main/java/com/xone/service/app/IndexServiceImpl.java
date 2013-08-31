package com.xone.service.app;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.AdbannerDao;
import com.xone.model.hibernate.app.DeliveryDao;
import com.xone.model.hibernate.app.ProductDao;
import com.xone.model.hibernate.app.PurchaseDao;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.entity.Purchase;

public class IndexServiceImpl implements IndexService {
    protected static final Log log = LogFactory.getLog(IndexServiceImpl.class);

    @Autowired
    protected ProductDao productDao;

    @Autowired
    protected PurchaseDao purchaseDao;
    
    @Autowired
    protected DeliveryDao deliveryDao;
    
    @Autowired
    protected AdbannerDao adbannerDao;
    
    @Override
    public Integer getTodoProductCount() {
        DetachedCriteria c = DetachedCriteria.forClass(Product.class);
        c.add(Restrictions.eq("checkStatus", Product.CheckStatus.WAITING.getValue()));
        int result = getProductDao().countByProperty(c);
        return result;
    }

    @Override
    public Integer getTodoPurchaseCount() {
        DetachedCriteria c = DetachedCriteria.forClass(Purchase.class);
        c.add(Restrictions.eq("checkStatus", Purchase.CheckStatus.WAITING.getValue()));
        return getPurchaseDao().countByProperty(c);
    }

    @Override
    public Integer getTodoDeliveryCount() {
        DetachedCriteria c = DetachedCriteria.forClass(Delivery.class);
        c.add(Restrictions.eq("flagPass", Delivery.FlagPass.HANDLING.getValue()));
        return getDeliveryDao().countByProperty(c);
    }
    
    @Override
    public Integer getAlertAdbanner(Date alertDate) {
    	DetachedCriteria c = DetachedCriteria.forClass(Adbanner.class);
    	c.add(Restrictions.eq("flagDeleted", Adbanner.FlagDeleted.NORMAL.getValue()));
    	c.add(Restrictions.lt("adEnd", alertDate));
    	return getAdbannerDao().countByProperty(c);
    }

    public ProductDao getProductDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    public PurchaseDao getPurchaseDao() {
        return purchaseDao;
    }

    public void setPurchaseDao(PurchaseDao purchaseDao) {
        this.purchaseDao = purchaseDao;
    }

    public DeliveryDao getDeliveryDao() {
        return deliveryDao;
    }

    public void setDeliveryDao(DeliveryDao deliveryDao) {
        this.deliveryDao = deliveryDao;
    }

	public AdbannerDao getAdbannerDao() {
		return adbannerDao;
	}

	public void setAdbannerDao(AdbannerDao adbannerDao) {
		this.adbannerDao = adbannerDao;
	}


}
