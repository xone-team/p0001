package com.xone.service.app;

import java.text.ParseException;
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

import com.xone.model.hibernate.app.DeliveryDao;
import com.xone.model.hibernate.entity.Delivery;
import com.xone.model.hibernate.support.Pagination;

public class DeliveryServiceImpl implements DeliveryService {
    private static final Log log = LogFactory.getLog(DeliveryServiceImpl.class);

    @Autowired
    protected DeliveryDao deliveryDao;

    public DeliveryDao getDeliveryDao() {
        return deliveryDao;
    }

    public void setDeliveryDao(DeliveryDao deliveryDao) {
        this.deliveryDao = deliveryDao;
    }

    @Override
    public Delivery save(Delivery delivery) {
        return getDeliveryDao().save(delivery);
    }

    @Override
    public Delivery update(Delivery entity) {
        return getDeliveryDao().update(entity);
    }

    @Override
    public void delete(Delivery entity) {
        getDeliveryDao().deleteById(entity.getId());
    }

    @Override
    public Delivery findById(Long id) {
        return getDeliveryDao().findById(id);
    }

    @Override
    public List<Delivery> findAllByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Delivery.class);
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
        
        handleCriteriaByParams(detachedCriteria, params);
        
        
        return getDeliveryDao().findListByDetachedCriteria(detachedCriteria, 0, 5);
    }

    @Override
    public Delivery findByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Delivery.class);
        String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            detachedCriteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
        String marketarea = params.get("marketarea");
        if (!StringUtils.isBlank(marketarea)) {
            detachedCriteria.add(Restrictions.like("marketarea", "%" + marketarea + "%"));
        }
        String determini = params.get("determini");
        if (!StringUtils.isBlank(determini)) {
            detachedCriteria.add(Restrictions.like("determini", "%" + determini + "%"));
        }
        String gtLoadtime = params.get("gtLoadtime");
        if (!StringUtils.isBlank(gtLoadtime)) {
            try {
				detachedCriteria.add(Restrictions.gt("loadtime", DateUtils.parseDate(gtLoadtime, new String[] {
						"yyyy-MM-dd"
				})));
			} catch (ParseException e) {
				e.printStackTrace();
			}
        }
        String ltLoadtime = params.get("ltLoadtime");
        if (!StringUtils.isBlank(ltLoadtime)) {
        	try {
        		detachedCriteria.add(Restrictions.gt("loadtime", DateUtils.parseDate(ltLoadtime, new String[] {
        				"yyyy-MM-dd"
        		})));
        	} catch (ParseException e) {
        		e.printStackTrace();
        	}
        }
        String loadaddress = params.get("loadaddress");
        if (!StringUtils.isBlank(loadaddress)) {
            detachedCriteria.add(Restrictions.like("loadaddress", "%" + loadaddress + "%"));
        }
        String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            detachedCriteria.add(Restrictions.eq("userCreated", Long.parseLong(userCreated)));
        }
        detachedCriteria.addOrder(Order.desc("dateCreated"));
        List<Delivery> l = getDeliveryDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
        if (null == l) {
            return new Delivery();
        }
        return l.get(0);
    }

    public Pagination findByParams(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Delivery.class);
        String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            detachedCriteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
        String marketarea = params.get("marketarea");
        if (!StringUtils.isBlank(marketarea)) {
            detachedCriteria.add(Restrictions.like("marketarea", "%" + marketarea + "%"));
        }
        String determini = params.get("determini");
        if (!StringUtils.isBlank(determini)) {
            detachedCriteria.add(Restrictions.like("determini", "%" + determini + "%"));
        }
        String gtLoadtime = params.get("gtLoadtime");
        if (!StringUtils.isBlank(gtLoadtime)) {
            try {
				detachedCriteria.add(Restrictions.gt("loadtime", DateUtils.parseDate(gtLoadtime, new String[] {
						"yyyy-MM-dd"
				})));
			} catch (ParseException e) {
				e.printStackTrace();
			}
        }
        String ltLoadtime = params.get("ltLoadtime");
        if (!StringUtils.isBlank(ltLoadtime)) {
        	try {
        		detachedCriteria.add(Restrictions.lt("loadtime", DateUtils.addDays(DateUtils.parseDate(ltLoadtime, new String[] {
        				"yyyy-MM-dd"
        		}), 1)));
        	} catch (ParseException e) {
        		e.printStackTrace();
        	}
        }
        String loadaddress = params.get("loadaddress");
        if (!StringUtils.isBlank(loadaddress)) {
            detachedCriteria.add(Restrictions.like("loadaddress", "%" + loadaddress + "%"));
        }
        String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            detachedCriteria.add(Restrictions.eq("userCreated", Long.parseLong(userCreated)));
        }
        detachedCriteria.addOrder(Order.desc("dateCreated"));
        int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
        int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
        return getDeliveryDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
    }

    protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
        String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
        String marketarea = params.get("marketarea");
        if (!StringUtils.isBlank(marketarea)) {
            criteria.add(Restrictions.like("marketarea", "%" + marketarea + "%"));
        }
        String determini = params.get("determini");
        if (!StringUtils.isBlank(determini)) {
            criteria.add(Restrictions.like("determini", "%" + determini + "%"));
        }
        String loadtime = params.get("loadtime");
        if (!StringUtils.isBlank(loadtime)) {
            criteria.add(Restrictions.like("loadtime", "%" + loadtime + "%"));
        }
        String loadaddress = params.get("loadaddress");
        if (!StringUtils.isBlank(loadaddress)) {
            criteria.add(Restrictions.like("loadaddress", "%" + loadaddress + "%"));
        }
        String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            criteria.add(Restrictions.eq("userCreated", Long.parseLong(userCreated)));
        }
        criteria.addOrder(Order.desc("dateCreated"));
    }
}
