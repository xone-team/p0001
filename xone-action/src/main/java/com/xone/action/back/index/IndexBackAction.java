package com.xone.action.back.index;

import com.xone.action.base.Action;
import com.xone.service.app.IndexService;

public class IndexBackAction extends Action {
	/**
     * 
     */
    private static final long serialVersionUID = -2885159799683878566L;
    Integer productCount = new Integer(0);
    Integer deliveryCount = new Integer(0);
    Integer purchaseCount = new Integer(0);
    
    IndexService indexService;
    public String dispatch() throws Exception {
		return SUCCESS;
	}
	public String count() throws Exception {
        productCount = indexService.getTodoProductCount();
        deliveryCount = indexService.getTodoDeliveryCount();
        purchaseCount = indexService.getTodoPurchaseCount();
	    return SUCCESS;
	}
    public Integer getProductCount() {
        return productCount;
    }
    public void setProductCount(Integer productCount) {
        this.productCount = productCount;
    }
    public Integer getDeliveryCount() {
        return deliveryCount;
    }
    public void setDeliveryCount(Integer deliveryCount) {
        this.deliveryCount = deliveryCount;
    }
    public Integer getPurchaseCount() {
        return purchaseCount;
    }
    public void setPurchaseCount(Integer purchaseCount) {
        this.purchaseCount = purchaseCount;
    }
    public IndexService getIndexService() {
        return indexService;
    }
    public void setIndexService(IndexService indexService) {
        this.indexService = indexService;
    }

}
