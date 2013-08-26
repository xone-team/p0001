package com.xone.service.app;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.OverheadDao;
import com.xone.model.hibernate.app.ProductDao;
import com.xone.model.hibernate.app.PurchaseDao;
import com.xone.model.hibernate.entity.Overhead;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;

public class OverheadServiceImpl implements OverheadService {
    private static final Log log = LogFactory.getLog(OverheadServiceImpl.class);

    @Autowired
    protected OverheadDao overheadDao;
    @Autowired
    protected ProductDao productDao;
    @Autowired
    protected PurchaseDao purchaseDao;

    @Override
    public Overhead save(Overhead entity) {
        entity.setCheckStatus(Overhead.CheckStatus.WAITING.getValue());
        entity.setFlagDeleted(Overhead.FlagDeleted.NORMAL.getValue());
        return getOverheadDao().save(entity);
    }

    @Override
    public Overhead update(Overhead entity) {
        return getOverheadDao().update(entity);
    }

    @Override
    public void delete(Overhead entity) {
        getOverheadDao().deleteById(entity.getId());
    }

    @Override
    public Overhead findById(Long id) {
        return getOverheadDao().findById(id);
    }
    
    /**
     * 查询是否已存在相关置顶
     * @param refId
     * @param overheadType
     * @return
     */
    @Override
    public int countByRefIdAndType(Long refId, String overheadType, Long currentId){
      DetachedCriteria c = DetachedCriteria.forClass(Overhead.class);
      c.add(Restrictions.eq("refId", refId));
      c.add(Restrictions.eq("overheadType", overheadType));
      c.add(Restrictions.eq("flagDeleted", "0"));
      c.add(Restrictions.eq("checkStatus", "0"));
      if(currentId != null){
        c.add(Restrictions.ne("id", currentId));
      }
      return overheadDao.countByProperty(c);
    }

    @Override
    public Overhead findByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Overhead.class);

//        handleCriteriaByParams(detachedCriteria, params);
        String refId = params.get("refId");
        if (!StringUtils.isBlank(refId)) {
        	detachedCriteria.add(Restrictions.eq("refId", new Long(refId)));
        }
        String overheadType = params.get("overheadType");
        if (!StringUtils.isBlank(overheadType)) {
        	detachedCriteria.add(Restrictions.eq("overheadType", overheadType));
        }

        List<Overhead> l = getOverheadDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
        if (null == l || l.isEmpty()) {
            return new Overhead();
        }
        return l.get(0);
    }

    /**
     * 列表置顶查询
     */
    @Override
    public List<Overhead> findAllByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Overhead.class);

//        handleCriteriaByParams(detachedCriteria, params);

        String overheadType = params.get("overheadType");
        if (!StringUtils.isBlank(overheadType)) {
        	detachedCriteria.add(Restrictions.like("overheadType", overheadType));
        }
        String flagDeleted = params.get("flagDeleted");
        if (!StringUtils.isBlank(flagDeleted)) {
        	detachedCriteria.add(Restrictions.eq("flagDeleted", flagDeleted));
        }
        String checkStatus = params.get("checkStatus");
        if (!StringUtils.isBlank(checkStatus)) {
        	detachedCriteria.add(Restrictions.eq("checkStatus", checkStatus));
        }
        detachedCriteria.addOrder(Order.desc("dateCreated"));
        return getOverheadDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
    }

    public Pagination findByParams(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Overhead.class);
        handleCriteriaByParams(detachedCriteria, params);
        int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
        int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
        Pagination result = getOverheadDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
        
        // add product and purchase
        @SuppressWarnings("unchecked")
		List<Overhead> overheadList = result.getList();
        List<Long> productIds = new ArrayList<Long>();
        List<Long> purchaseIds = new ArrayList<Long>();
        for(Overhead overhead : overheadList){
        	if(Overhead.OverheadType.PURCHASE.getValue().equals(overhead.getOverheadType())){
        		purchaseIds.add(overhead.getRefId());
        	}else{
        		productIds.add(overhead.getRefId());
        	}
        }
        
        List<Product> productList = null;
        List<Purchase> purchaseList = null;
        if(productIds.size() > 0){
        	detachedCriteria = DetachedCriteria.forClass(Product.class);
        	detachedCriteria.add(Restrictions.in("id", productIds));
        	productList = productDao.findListByDetachedCriteria(detachedCriteria, -1, -1);
        }
        
        if(purchaseIds.size() > 0){
        	detachedCriteria = DetachedCriteria.forClass(Purchase.class);
        	detachedCriteria.add(Restrictions.in("id", purchaseIds));
        	purchaseList = purchaseDao.findListByDetachedCriteria(detachedCriteria, -1, -1);
        }	
        
        List<Overhead> newOverheadList = new ArrayList<Overhead>();
        
        for(Overhead overhead : overheadList){
        	if(Overhead.OverheadType.PURCHASE.getValue().equals(overhead.getOverheadType())){
        		if(purchaseList != null){
        			for(Purchase purchase : purchaseList){
        				if(purchase.getId().equals(overhead.getRefId())){
        					overhead.setPurchase(purchase);
        					break;
        				}
        			}
        		}
        	}else{
        		if(productList != null){
        			for(Product product : productList){
        				if(product.getId().equals(overhead.getRefId())){
        					overhead.setProduct(product);
        					break;
        				}
        			}
        		}
        	}
        	newOverheadList.add(overhead);
        }
        result.setList(newOverheadList);
        
        return result;
    }

    protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params) {
        String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", new Long(id)));
        }
        String idMin = params.get("idMin");
        if (!StringUtils.isBlank(idMin)) {
            criteria.add(Restrictions.ge("id", new Long(idMin)));
        }
        String idMax = params.get("idMax");
        if (!StringUtils.isBlank(idMax)) {
            criteria.add(Restrictions.le("id", new Long(idMax)));
        }
        String overheadType = params.get("overheadType");
        if (!StringUtils.isBlank(overheadType)) {
            criteria.add(Restrictions.like("overheadType", "%" + overheadType + "%"));
        }
        String refId = params.get("refId");
        if (!StringUtils.isBlank(refId)) {
            criteria.add(Restrictions.eq("refId", new Long(refId)));
        }
        String refIdMin = params.get("refIdMin");
        if (!StringUtils.isBlank(refIdMin)) {
            criteria.add(Restrictions.ge("refId", new Long(refIdMin)));
        }
        String refIdMax = params.get("refIdMax");
        if (!StringUtils.isBlank(refIdMax)) {
            criteria.add(Restrictions.le("refId", new Long(refIdMax)));
        }
        String checkStatus = params.get("checkStatus");
        if (!StringUtils.isBlank(checkStatus)) {
            criteria.add(Restrictions.like("checkStatus", "%" + checkStatus + "%"));
        }
        String remark = params.get("remark");
        if (!StringUtils.isBlank(remark)) {
            criteria.add(Restrictions.like("remark", "%" + remark + "%"));
        }
        String userApply = params.get("userApply");
        if (!StringUtils.isBlank(userApply)) {
            criteria.add(Restrictions.eq("userApply", new Long(userApply)));
        }
        String userApplyMin = params.get("userApplyMin");
        if (!StringUtils.isBlank(userApplyMin)) {
            criteria.add(Restrictions.ge("userApply", new Long(userApplyMin)));
        }
        String userApplyMax = params.get("userApplyMax");
        if (!StringUtils.isBlank(userApplyMax)) {
            criteria.add(Restrictions.le("userApply", new Long(userApplyMax)));
        }
        String dateApplyMin = params.get("dateApplyMin");
        if (!StringUtils.isBlank(dateApplyMin)) {
            try {
                criteria.add(Restrictions.ge("dateApply", DateUtils.parseDate(dateApplyMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[dateApplyMin] parsed exception :", e);
            }
        }
        String dateApplyMax = params.get("dateApplyMax");
        if (!StringUtils.isBlank(dateApplyMax)) {
            try {
                criteria.add(Restrictions.lt("dateApply", DateUtils.addDays(DateUtils.parseDate(dateApplyMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[dateApplyMax] parsed exception :", e);
            }
        }
        String userCheck = params.get("userCheck");
        if (!StringUtils.isBlank(userCheck)) {
            criteria.add(Restrictions.eq("userCheck", new Long(userCheck)));
        }
        String userCheckMin = params.get("userCheckMin");
        if (!StringUtils.isBlank(userCheckMin)) {
            criteria.add(Restrictions.ge("userCheck", new Long(userCheckMin)));
        }
        String userCheckMax = params.get("userCheckMax");
        if (!StringUtils.isBlank(userCheckMax)) {
            criteria.add(Restrictions.le("userCheck", new Long(userCheckMax)));
        }
        String dateCheckMin = params.get("dateCheckMin");
        if (!StringUtils.isBlank(dateCheckMin)) {
            try {
                criteria.add(Restrictions.ge("dateCheck", DateUtils.parseDate(dateCheckMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[dateCheckMin] parsed exception :", e);
            }
        }
        String dateCheckMax = params.get("dateCheckMax");
        if (!StringUtils.isBlank(dateCheckMax)) {
            try {
                criteria.add(Restrictions.lt("dateCheck", DateUtils.addDays(DateUtils.parseDate(dateCheckMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[dateCheckMax] parsed exception :", e);
            }
        }
        String flagDeleted = params.get("flagDeleted");
        if (!StringUtils.isBlank(flagDeleted)) {
            criteria.add(Restrictions.like("flagDeleted", "%" + flagDeleted + "%"));
        }
        String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            criteria.add(Restrictions.eq("userCreated", new Long(userCreated)));
        }
        String userCreatedMin = params.get("userCreatedMin");
        if (!StringUtils.isBlank(userCreatedMin)) {
            criteria.add(Restrictions.ge("userCreated", new Long(userCreatedMin)));
        }
        String userCreatedMax = params.get("userCreatedMax");
        if (!StringUtils.isBlank(userCreatedMax)) {
            criteria.add(Restrictions.le("userCreated", new Long(userCreatedMax)));
        }
        String dateCreatedMin = params.get("dateCreatedMin");
        if (!StringUtils.isBlank(dateCreatedMin)) {
            try {
                criteria.add(Restrictions.ge("dateCreated", DateUtils.parseDate(dateCreatedMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[dateCreatedMin] parsed exception :", e);
            }
        }
        String dateCreatedMax = params.get("dateCreatedMax");
        if (!StringUtils.isBlank(dateCreatedMax)) {
            try {
                criteria.add(Restrictions.lt("dateCreated", DateUtils.addDays(DateUtils.parseDate(dateCreatedMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[dateCreatedMax] parsed exception :", e);
            }
        }
        String userUpdated = params.get("userUpdated");
        if (!StringUtils.isBlank(userUpdated)) {
            criteria.add(Restrictions.eq("userUpdated", new Long(userUpdated)));
        }
        String userUpdatedMin = params.get("userUpdatedMin");
        if (!StringUtils.isBlank(userUpdatedMin)) {
            criteria.add(Restrictions.ge("userUpdated", new Long(userUpdatedMin)));
        }
        String userUpdatedMax = params.get("userUpdatedMax");
        if (!StringUtils.isBlank(userUpdatedMax)) {
            criteria.add(Restrictions.le("userUpdated", new Long(userUpdatedMax)));
        }
        String lastUpdatedMin = params.get("lastUpdatedMin");
        if (!StringUtils.isBlank(lastUpdatedMin)) {
            try {
                criteria.add(Restrictions.ge("lastUpdated", DateUtils.parseDate(lastUpdatedMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[lastUpdatedMin] parsed exception :", e);
            }
        }
        String lastUpdatedMax = params.get("lastUpdatedMax");
        if (!StringUtils.isBlank(lastUpdatedMax)) {
            try {
                criteria.add(Restrictions.lt("lastUpdated", DateUtils.addDays(DateUtils.parseDate(lastUpdatedMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[lastUpdatedMax] parsed exception :", e);
            }
        }
        
        criteria.addOrder(Order.desc("dateCreated"));
    }

    public OverheadDao getOverheadDao() {
        return overheadDao;
    }

    public void setOverheadDao(OverheadDao overheadDao) {
        this.overheadDao = overheadDao;
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

}
