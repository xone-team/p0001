package com.xone.service.app;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.LinksDao;
import com.xone.model.hibernate.app.UserLinksDao;
import com.xone.model.hibernate.entity.Links;
import com.xone.model.hibernate.entity.UserLinks;
import com.xone.model.hibernate.support.Pagination;

public class UserLinksServiceImpl implements UserLinksService {
	private static final Log log = LogFactory.getLog(UserLinksServiceImpl.class);

	@Autowired
	protected UserLinksDao userLinksDao;
	
	@Autowired
	protected LinksDao linksDao;

	@Override
	public UserLinks save(UserLinks entity) {
		return getUserLinksDao().save(entity);
	}
	
	@Override
	public UserLinks update(UserLinks entity) {
		return getUserLinksDao().update(entity);
	}
	
	@Override
	public void delete(UserLinks entity) {
		getUserLinksDao().deleteById(entity.getId());
	}

	@Override
	public UserLinks findById(Long id) {
		return getUserLinksDao().findById(id);
	}
	
	@Override
    public UserLinks findByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserLinks.class);
        List<UserLinks> l = getUserLinksDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
        if (null == l) {
            return new UserLinks();
        }
        return l.get(0);
    }
	
	@Override
	public String updateUserLink(String linkNo, Long userId) {
		Links links = getLinksDao().findUniqueByProperty("linkNo", linkNo);
		if (null == links) {
			return "keep";
		}
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserLinks.class);
        detachedCriteria.add(Restrictions.eq("userId", userId));
        detachedCriteria.add(Restrictions.eq("linkNo", linkNo));
        List<UserLinks> l = getUserLinksDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
        if (null != l && !l.isEmpty()) {
            delete(l.get(0));
            return "remove";
        }
        UserLinks userLinks = new UserLinks();
        userLinks.setLinkNo(linkNo);
        userLinks.setUserId(userId);
        save(userLinks);
		return "create";
	}
	
	@Override
	public List<UserLinks> findAllByUserId(Long userId) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(UserLinks.class);
		detachedCriteria.add(Restrictions.eq("userId", userId));
		return getUserLinksDao().findByDetachedCriteria(detachedCriteria);
	}

	@Override
	public List<UserLinks> findAllByMap(Map<String, String> params) {
		if (null == params || params.isEmpty()) {
			return Collections.emptyList();
		}
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(UserLinks.class);
		detachedCriteria.add(Restrictions.eq("userId", Long.parseLong(params.get("userId"))));
//        detachedCriteria.addOrder(Order.desc("dateCreated"));
		return getUserLinksDao().findByDetachedCriteria(detachedCriteria);
//				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(UserLinks.class);
		int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
		return getUserLinksDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}

	public UserLinksDao getUserLinksDao() {
		return userLinksDao;
	}

	public void setUserLinksDao(UserLinksDao userLinksDao) {
		this.userLinksDao = userLinksDao;
	}

	public LinksDao getLinksDao() {
		return linksDao;
	}

	public void setLinksDao(LinksDao linksDao) {
		this.linksDao = linksDao;
	}
	
}
