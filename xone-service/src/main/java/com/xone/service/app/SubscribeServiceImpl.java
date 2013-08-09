package com.xone.service.app;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
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

import com.xone.model.hibernate.app.PersonDao;
import com.xone.model.hibernate.app.ProductDao;
import com.xone.model.hibernate.app.SubscribeDao;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.utils.MyServerUtils;

public class SubscribeServiceImpl implements SubscribeService {
    protected static final Log log = LogFactory.getLog(SubscribeServiceImpl.class);

    @Autowired
    protected SubscribeDao subscribeDao;
    
    @Autowired
    protected PersonDao personDao;
    
    @Autowired
    protected ProductDao productDao;

    @Override
    public Subscribe save(Subscribe entity) {
    	entity.setFlagDeleted(Subscribe.FlagDeleted.NORMAL.getValue());
        return getSubscribeDao().save(entity);
    }

    @Override
    public Subscribe update(Subscribe entity) {
        return getSubscribeDao().update(entity);
    }

    @Override
    public void delete(Subscribe entity) {
        getSubscribeDao().deleteById(entity.getId());
    }

    @Override
    public Subscribe findById(Long id) {
        return getSubscribeDao().findById(id);
    }
    
    /**
     * 如果用户点击订阅后的处理逻辑
     */
    @Override
    public Map<String, String> updateSubscribeProductInfo(Map<String, String> params) {
    	if (null == params || params.isEmpty()) {
    		return Collections.emptyMap();
    	}
		String pu = params.get("_pu");
		String pm = params.get("_pm");
		String pd = params.get("_pd");
		if (StringUtils.isBlank(pu) || StringUtils.isBlank(pm) || StringUtils.isBlank(pd)) {
			return Collections.emptyMap();
		}
    	Map<String, String> param = new HashMap<String, String>();
    	param.put("id", pu);
    	param.put("lastMacUpdated", pm);
    	Person p = getPersonDao().findByParams(params);
    	if (null != p && null != p.getId()) {
    		Subscribe subscribe = getSubscribeDao().findById(MyServerUtils.parseLong(pd));
    		Map<String, String> pResult = new HashMap<String, String>();
    		pResult.put("saleType", subscribe.getSaleType());
    		pResult.put("productName", subscribe.getProductNameKey());
    		pResult.put("productLocation", subscribe.getMarketarea());
//    		pResult.put("credit", subscribe.getSaleType());
    		pResult.put("gtDateCreated", MyServerUtils.format(subscribe.getDateCheck()));
    		if (null != subscribe && null != subscribe.getId()) {
    			subscribe.setDateCheck(new Date());
    			getSubscribeDao().update(subscribe);
    			return pResult;
    		}
    	}
    	return Collections.emptyMap();
    }
    
    /**
     * 查阅订阅的相关信息
     */
    @Override
    public List<Subscribe> findAllSubscribe(Map<String, String> params) {
    	if (null == params || params.isEmpty()) {
    		return Collections.emptyList();
    	}
        String pid = params.get("id");
        String mac = params.get("_m");
        if (StringUtils.isBlank(pid) || StringUtils.isBlank(mac)) {
        	return Collections.emptyList();
        }
        Map<String, String> pParams = new HashMap<String, String>();
        pParams.put("id", pid);
        pParams.put("lastMacUpdated", mac);
        Person person = getPersonDao().findByParams(pParams);
        if (null == person || null == person.getId()) {//如果没有该用户，也是空订阅
        	return Collections.emptyList();
        }
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Subscribe.class);
        detachedCriteria.add(Restrictions.eq("userCreated", MyServerUtils.parseLong(pid)));
		detachedCriteria.addOrder(Order.desc("dateCreated"));
        List<Subscribe> subscribeList = getSubscribeDao().findListByDetachedCriteria(detachedCriteria, 0, 3);
        if (null == subscribeList || subscribeList.isEmpty()) {
        	return Collections.emptyList();
        }
        List<Subscribe> mySubscribe = new ArrayList<Subscribe>();
        for (Subscribe subscribe : subscribeList) {
        	DetachedCriteria productCriteria = DetachedCriteria.forClass(Product.class);
        	if (!StringUtils.isBlank(subscribe.getSaleType())) {
        		productCriteria.add(Restrictions.eq("saleType", subscribe.getSaleType()));
        	}
        	if (!StringUtils.isBlank(subscribe.getProductNameKey())) {
        		productCriteria.add(Restrictions.like("productName", "%" + subscribe.getProductNameKey() + "%"));
        	}
        	if (!StringUtils.isBlank(subscribe.getMarketarea())) {
        		productCriteria.add(Restrictions.like("productLocation", "%" + subscribe.getMarketarea() + "%"));
        	}
//        	if (!StringUtils.isBlank(subscribe.getProductNameKey())) {//公司信誉
//    		productCriteria.add(Restrictions.like("productName", "%" + subscribe.getProductNameKey() + "%"));
//    	}
        	Date dateCheck = subscribe.getDateCheck();
        	if (null != dateCheck) {
        		productCriteria.add(Restrictions.ge("dateCreated", dateCheck));
        	}
        	int i = getProductDao().countByProperty(productCriteria);
        	if (i > 0) {
        		mySubscribe.add(subscribe);
        	}
        }
        return mySubscribe;
    }

    @Override
    public List<Subscribe> findAllByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Subscribe.class);
        String gtDateCreated = params.get("gtDateCreated");
        if (!StringUtils.isBlank(gtDateCreated)) {
            try {
                detachedCriteria.add(Restrictions.gt("dateCreated", DateUtils.parseDate(gtDateCreated, new String[] { "yyyy-MM-dd HH:mm:ss" })));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        String ltDateCreated = params.get("ltDateCreated");
        if (!StringUtils.isBlank(ltDateCreated)) {
            try {
                detachedCriteria.add(Restrictions.lt("dateCreated", DateUtils.parseDate(ltDateCreated, new String[] { "yyyy-MM-dd HH:mm:ss" })));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
		if (!StringUtils.isBlank(params.get("refId"))) {
			detachedCriteria.add(Restrictions.eq("refId",
					Long.parseLong(params.get("refId"))));
		}
		String userCreated = params.get("userCreated");
		if (!StringUtils.isBlank(userCreated)) {
			detachedCriteria.add(Restrictions.eq("userCreated",
					Long.parseLong(userCreated)));
		}
		detachedCriteria.add(Restrictions.eq("flagDeleted",
				Subscribe.FlagDeleted.NORMAL.getValue()));
		detachedCriteria.addOrder(Order.desc("dateCreated"));

        return getSubscribeDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
    }

    public Pagination findByParams(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Subscribe.class);
        int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
        int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
        return getSubscribeDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
    }

    public SubscribeDao getSubscribeDao() {
        return subscribeDao;
    }

    public void setSubscribeDao(SubscribeDao subscribeDao) {
        this.subscribeDao = subscribeDao;
    }

	public PersonDao getPersonDao() {
		return personDao;
	}

	public void setPersonDao(PersonDao personDao) {
		this.personDao = personDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

}