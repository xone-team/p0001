package com.xone.action.back.purchase;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.PurchaseService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class PurchaseBackAction extends Action {
	
	/**
     * 
     */
    private static final long serialVersionUID = 5760763917137319953L;
    @Autowired
	protected PurchaseService purchaseService;
	protected Purchase purchase = new Purchase();
	protected List<Purchase> list = new ArrayList<Purchase>();
	protected Pagination pagination = new Pagination();
	
//	protected CommonTypes commonTypes = CommonTypes.getInstance();
//	protected Map<String, Object[]> types = new HashMap<String, Object[]>();
//	
//	@Override
//    public void prepare() throws Exception {
//	    purchase.setPerson(new Person());
//	    purchase.setCheck(new PurcCheck());
//	    
//        types.put("yn", Person.YN.values());
//        types.put("checkStatus", Product.CheckStatus.values());
//        types.put("productType", Product.ProductType.values());
//        types.put("saleType", Product.SaleType.values());
//	    super.prepare();
//    }

    public String purchaseList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		MyBeanUtils.copyPropertiesToMap(getPurchase(), params, new CopyRules() {
			@Override
			public boolean myCopyRules(Object value) {
				return null != value;
			}
			
		}, new AssignRules() {
			@Override
			public String myAssignRules(Object value) {
				if (null != value && value instanceof Date) {
					return MyDateUtils.format((Date)value, "yyyy-MM-dd");
				}
				return value.toString();
			}
		}, null);
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getPurchaseService().findByParams(params);
//		List<Purchase> l = getPurchaseService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
//	public String purchaseListAjax() throws Exception {
//		return purchaseList();
//	}
	
	public String purchaseItem() throws Exception {
		Purchase entity = purchaseService.findById(getPurchase().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setPurchase(entity);
		return SUCCESS;
	}
	
//	protected Purchase findById(Long id) {
//		Map<String, String> params = new HashMap<String, String>();
//		params.put("id", String.valueOf(id));
//		return purchaseService.findByMap(params);
//	}
	
	public String purchaseCreate() throws Exception {
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
	    purchase.setPurchaseNum("0");
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
            if(Product.CheckStatus.DENIED.getValue().equals(entity.getCheckStatus())
                    ||Product.CheckStatus.PASSED.getValue().equals(entity.getCheckStatus())){
                entity.setUserCheck(getUserId());
                entity.setDateCheck(new Date());
                entity.getCheck().setUserCheck(getUserId());
            }
			setPurchase(getPurchaseService().update(entity));
		}
		return SUCCESS;
	}
	
//    public String purchaseDelete() throws Exception {
//        Purchase entity = getPurchaseService().findById(getPurchase().getId());
//        purchaseService.delete(entity);
//        return SUCCESS;
//    }

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
//
//    public Map<String, Object[]> getTypes() {
//        return types;
//    }
//
//    public void setTypes(Map<String, Object[]> types) {
//        this.types = types;
//    }

}
