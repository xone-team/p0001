package com.xone.action.web.purchase;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.PurchaseService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class PurchaseWebAction extends Action {

	private static final long serialVersionUID = -4877998730097178103L;
	
	@Autowired
	protected PurchaseService purchaseService;
	protected List<Purchase> list = new ArrayList<Purchase>();
	protected Purchase purchase = new Purchase();
	protected Pagination pagination = new Pagination();
    
    public Enum<?>[] getFlagDeleted() {
        return Purchase.FlagDeleted.values();
    }
    public Enum<?>[] getCheckStatus() {
        return Purchase.CheckStatus.values();
    }
    public Enum<?>[] getProductType() {
        return Purchase.PurchaseType.values();
    }
    public Enum<?>[] getSaleType() {
        return Purchase.SaleType.values();
    }

    public String purchaseList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("userApply", getUserId().toString());
        params.put("flagDeleted", Purchase.FlagDeleted.NORMAL.getValue());
		
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getPurchaseService().findByParams(params);
		setPagination(p);
		return SUCCESS;
	}
    
    public String purchaseListAjax() throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        
        params.put("flagDeleted", Purchase.FlagDeleted.NORMAL.getValue());
        
        params.put("pageSize", String.valueOf(getPagination().getPageSize()));
        params.put("pageNo", String.valueOf(getPagination().getPageNo()));
        Pagination p = getPurchaseService().findByParams(params);
        setPagination(p);
        return SUCCESS;
    }
	
	public String purchaseItem() throws Exception {
		Purchase entity = getPurchaseService().findById(getPurchase().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setPurchase(entity);
		return SUCCESS;
	}
	
	public String purchaseCreate() throws Exception {
	    purchase.setPurchaseNum("0");
		return SUCCESS;
	}
	
	public String purchaseEdit() throws Exception {
		Purchase entity = getPurchaseService().findById(getPurchase().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setPurchase(entity);
		return SUCCESS;
	}
	
	public String purchaseSave() throws Exception {
        purchase.setUserCreated(getUserId());
        purchase.setDateCreated(new Date());
        purchase.setUserUpdated(getUserId());
        purchase.setLastUpdated(new Date());

        purchase.setUserApply(getUserId());
        purchase.setDateApply(new Date());
	    
		setPurchase(getPurchaseService().save(getPurchase()));
		return SUCCESS;
	}
	
	public String purchaseUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			Purchase entity = getPurchaseService().findById(getPurchase().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getPurchaseService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			Purchase entity = getPurchaseService().findById(getPurchase().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getPurchase(), entity, Purchase.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			
			entity.setUserUpdated(getUserId());
            entity.setLastUpdated(new Date());
			setPurchase(getPurchaseService().update(entity));
		}
		return SUCCESS;
	}
	
	public String list() throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		List<Purchase> l = getPurchaseService().findAllByMap(params);
		if (null != l && !l.isEmpty()) {
			getList().addAll(l);
		}
		return SUCCESS;
	}
	
	public String item() {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", String.valueOf(getPurchase().getId()));
		setPurchase(getPurchaseService().findByMap(params));
		return SUCCESS;
	}

	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}

	public List<Purchase> getList() {
		return list;
	}

	public void setList(List<Purchase> list) {
		this.list = list;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

}
