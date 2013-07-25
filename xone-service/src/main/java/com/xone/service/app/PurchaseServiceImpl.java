package com.xone.service.app;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
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

import com.xone.model.hibernate.app.ImageUploadedDao;
import com.xone.model.hibernate.app.PurchaseDao;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;
public class PurchaseServiceImpl implements PurchaseService {
    
    private static final Log log = LogFactory.getLog(PurchaseServiceImpl.class);

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
	public List<Purchase> save(List<Purchase> entity) {
		return getPurchaseDao().save(entity);
	}
	
	@Override
	public Purchase save(Purchase entity, ImageUploaded imageUploaded) {
		entity = getPurchaseDao().save(entity);
		imageUploaded.setRefId(entity.getId());
		imageUploaded.setRefType(ImageUploaded.RefType.PURCHASE.getValue());
		imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL.getValue());
		imageUploaded = getImageUploadedDao().save(imageUploaded);
		entity.getIds().add(imageUploaded.getId());
		return entity;
	}
	
	@Override
	public Purchase save(Purchase entity, List<ImageUploaded> imageUploadeds) {
		entity = getPurchaseDao().save(entity);
		for (ImageUploaded imageUploaded : imageUploadeds) {
			imageUploaded.setRefId(entity.getId());
			imageUploaded.setRefType(ImageUploaded.RefType.PURCHASE.getValue());
			imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL.getValue());
		}
		imageUploadeds = getImageUploadedDao().save(imageUploadeds);
		List<Long> ids = new ArrayList<Long>();
		for (ImageUploaded imageUploaded : imageUploadeds) {
			ids.add(imageUploaded.getId());
		}
		entity.setIds(ids);
		return entity;
	}
	
	public Purchase update(Purchase entity, List<ImageUploaded> imageUploadeds, List<Long> imageIds) {
		entity = getPurchaseDao().update(entity);
		for (ImageUploaded imageUploaded : imageUploadeds) {
			imageUploaded.setRefId(entity.getId());
			imageUploaded.setRefType(ImageUploaded.RefType.PURCHASE.getValue());
			imageUploaded.setFlagDeleted(ImageUploaded.FlagDeleted.NORMAL.getValue());
		}
		imageUploadeds = getImageUploadedDao().save(imageUploadeds);
		Map<Long, Boolean> imageIdMap = new HashMap<Long, Boolean>();
		List<Long> ids = new ArrayList<Long>();
		for (Long id : imageIds) {
			imageIdMap.put(id, true);
		}
		for (Long id : entity.getIds()) {
			if (null == imageIdMap.get(id)) {
				getImageUploadedDao().deleteLogicById(id);
			} else {
				ids.add(id);
			}
		}
		for (ImageUploaded imageUploaded : imageUploadeds) {
			ids.add(imageUploaded.getId());
		}
		entity.setIds(ids);
		return entity;
	}
	
	@Override
	public List<Purchase> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Purchase.class);
		String gtDateCreated = params.get("gtDateCreated");
		if (!StringUtils.isBlank(gtDateCreated)) {
			try {
				detachedCriteria.add(Restrictions.gt("dateCreated", DateUtils.parseDate(gtDateCreated, new String[] {
						"yyyy-MM-dd HH:mm:ss"
				})));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		String ltDateCreated = params.get("ltDateCreated");
		if (!StringUtils.isBlank(ltDateCreated)) {
			try {
				detachedCriteria.add(Restrictions.lt("dateCreated", DateUtils.parseDate(ltDateCreated, new String[] {
						"yyyy-MM-dd HH:mm:ss"
				})));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		handleCriteriaByParams(detachedCriteria, params);
		
		List<Purchase> list = getPurchaseDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
		if (null != list && !list.isEmpty()) {
			List<Long> ids = new ArrayList<Long>();
			for (Purchase p : list) {
				ids.add(p.getId());
			}
			Map<Long, List<Long>> maps = getImageUploadedDao().findAllIdsByRefIds(ids, ImageUploaded.RefType.PURCHASE, 0, ids.size() * 3);
			for (int i = 0; i < ids.size(); i++) {
				Purchase ip = list.get(i);
				List<Long> imageIds = maps.get(ip.getId());
				if (null != imageIds) {
					ip.setIds(maps.get(ip.getId()));
				}
				list.set(i, ip);
			}
		}
		return list;
	}

	@Override
	public Purchase findByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Purchase.class);

		handleCriteriaByParams(detachedCriteria, params);
		
		List<Purchase> l = getPurchaseDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
		if (null == l || l.isEmpty()) {
			return new Purchase();
		}
		Purchase p = l.get(0);
		List<Long> ids = getImageUploadedDao().findAllIdsByRefId(p.getId(), ImageUploaded.RefType.PURCHASE);
		p.setIds(ids);
		return p;
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

	@Override
	public Purchase update(Purchase entity) {
		return getPurchaseDao().update(entity);
	}
	
	@Override
	public void delete(Purchase entity) {
		getPurchaseDao().deleteById(entity.getId());
	}
	
	@Override
	public Purchase findById(Long id) {
		return getPurchaseDao().findById(id);
	}

	@Override
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Purchase.class);
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getPurchaseDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
}
