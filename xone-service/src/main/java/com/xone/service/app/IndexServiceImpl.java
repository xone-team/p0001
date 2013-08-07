package com.xone.service.app;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.DeliveryDao;
import com.xone.model.hibernate.app.ProductDao;
import com.xone.model.hibernate.app.PurchaseDao;
import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.entity.Purchase;

public class IndexServiceImpl implements IndexService {
    protected static final Log log = LogFactory.getLog(IndexServiceImpl.class);

    @Autowired
    protected ProductDao productDao;

    protected PurchaseDao purchaseDao;
    
    protected DeliveryDao deliveryDao;
    
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
        c.add(Restrictions.eq("checkStatus", Product.CheckStatus.WAITING.getValue()));
        return getPurchaseDao().countByProperty(c);
    }

    @Override
    public Integer getTodoDeliveryCount() {
        DetachedCriteria c = DetachedCriteria.forClass(Delivery.class);
        c.add(Restrictions.eq("flagPass", Delivery.FlagPass.HANDLING.getValue()));
        return getDeliveryDao().countByProperty(c);
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


}
