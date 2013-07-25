package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.ProductDao;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.support.Pagination;

public class ProductServiceImpl implements ProductService {
	private static final Log log = LogFactory.getLog(ProductServiceImpl.class);

	@Autowired
	protected ProductDao productDao;

	@Override
	public Product save(Product entity) {
		return getProductDao().save(entity);
	}
	
	@Override
	public Product update(Product entity) {
		return getProductDao().update(entity);
	}
	
	@Override
	public void delete(Product entity) {
		getProductDao().deleteById(entity.getId());
	}

	@Override
	public Product findById(Long id) {
		return getProductDao().findById(id);
	}

	@Override
	public List<Product> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Product.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		return getProductDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Product.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getProductDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
		String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
		String productName = params.get("productName");
        if (!StringUtils.isBlank(productName)) {
            criteria.add(Restrictions.like("productName", "%" + productName + "%"));
        }
		String productType = params.get("productType");
        if (!StringUtils.isBlank(productType)) {
            criteria.add(Restrictions.like("productType", "%" + productType + "%"));
        }
		String saleType = params.get("saleType");
        if (!StringUtils.isBlank(saleType)) {
            criteria.add(Restrictions.like("saleType", "%" + saleType + "%"));
        }
		String productPrice = params.get("productPrice");
        if (!StringUtils.isBlank(productPrice)) {
            criteria.add(Restrictions.like("productPrice", "%" + productPrice + "%"));
        }
		String productNum = params.get("productNum");
        if (!StringUtils.isBlank(productNum)) {
            criteria.add(Restrictions.like("productNum", "%" + productNum + "%"));
        }
        String productValidMin = params.get("productValidMin");
        if (!StringUtils.isBlank(productValidMin)) {
            try {
                criteria.add(Restrictions.ge("productValid", DateUtils.parseDate(productValidMin, "yyyy-MM-dd" )));
            } catch (ParseException e) {
                log.error("[productValidMin] parsed exception :", e);
            }
        }
        String productValidMax = params.get("productValidMax");
        if (!StringUtils.isBlank(productValidMax)) {
            try {
                criteria.add(Restrictions.lt("productValid", DateUtils.addDays(DateUtils.parseDate(productValidMax, "yyyy-MM-dd" ), 1)));
            } catch (ParseException e) {
                log.error("[productValidMax] parsed exception :", e);
            }
        }
		String productAddress = params.get("productAddress");
        if (!StringUtils.isBlank(productAddress)) {
            criteria.add(Restrictions.like("productAddress", "%" + productAddress + "%"));
        }
		String productLocation = params.get("productLocation");
        if (!StringUtils.isBlank(productLocation)) {
            criteria.add(Restrictions.like("productLocation", "%" + productLocation + "%"));
        }
		String productDesc = params.get("productDesc");
        if (!StringUtils.isBlank(productDesc)) {
            criteria.add(Restrictions.like("productDesc", "%" + productDesc + "%"));
        }
		String flagDeleted = params.get("flagDeleted");
        if (!StringUtils.isBlank(flagDeleted)) {
            criteria.add(Restrictions.like("flagDeleted", "%" + flagDeleted + "%"));
        }
		String userApply = params.get("userApply");
        if (!StringUtils.isBlank(userApply)) {
            criteria.add(Restrictions.eq("userApply", Long.parseLong(userApply)));
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
            criteria.add(Restrictions.eq("userCheck", Long.parseLong(userCheck)));
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
		String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            criteria.add(Restrictions.eq("userCreated", Long.parseLong(userCreated)));
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
            criteria.add(Restrictions.eq("userUpdated", Long.parseLong(userUpdated)));
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

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
}
