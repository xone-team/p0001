package com.xone.service.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.AddressDao;
import com.xone.model.hibernate.entity.Address;
import com.xone.model.hibernate.support.Pagination;

public class AddressServiceImpl implements AddressService {
	private static final Log log = LogFactory.getLog(AddressServiceImpl.class);

	@Autowired
	protected AddressDao addressDao;

	@Override
	public Address save(Address entity) {
		return getAddressDao().save(entity);
	}
	
	@Override
	public Address update(Address entity) {
		return getAddressDao().update(entity);
	}
	
	@Override
	public void delete(Address entity) {
		getAddressDao().deleteById(entity.getId());
	}

	@Override
	public Address findById(Long id) {
		return getAddressDao().findById(id);
	}

	@Override
	public List<Address> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Address.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		return getAddressDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Address.class);
				
		handleCriteriaByParams(detachedCriteria, params);
				
		int pageSize = com.xone.model.utils.StringUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.StringUtils.parseInt(params.get("pageNo"), 0);
		return getAddressDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}
	
	protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params){
		String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
		String provinceCode = params.get("provinceCode");
        if (!StringUtils.isBlank(provinceCode)) {
            criteria.add(Restrictions.like("provinceCode", "%" + provinceCode + "%"));
        }
		String cityCode = params.get("cityCode");
        if (!StringUtils.isBlank(cityCode)) {
            criteria.add(Restrictions.like("cityCode", "%" + cityCode + "%"));
        }
		String districtCode = params.get("districtCode");
        if (!StringUtils.isBlank(districtCode)) {
            criteria.add(Restrictions.like("districtCode", "%" + districtCode + "%"));
        }
		String detail = params.get("detail");
        if (!StringUtils.isBlank(detail)) {
            criteria.add(Restrictions.like("detail", "%" + detail + "%"));
        }
		String zip = params.get("zip");
        if (!StringUtils.isBlank(zip)) {
            criteria.add(Restrictions.like("zip", "%" + zip + "%"));
        }
		String flagDeleted = params.get("flagDeleted");
        if (!StringUtils.isBlank(flagDeleted)) {
            criteria.add(Restrictions.like("flagDeleted", "%" + flagDeleted + "%"));
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

	public AddressDao getAddressDao() {
		return addressDao;
	}

	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}
	
}
