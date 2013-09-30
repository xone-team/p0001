package com.xone.service.app;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.LinksDao;
import com.xone.model.hibernate.entity.Links;
import com.xone.model.hibernate.support.Pagination;

public class LinksServiceImpl implements LinksService {
	private static final Log log = LogFactory.getLog(LinksServiceImpl.class);

	@Autowired
	protected LinksDao linksDao;

	@Override
	public Links findById(Long id) {
		return getLinksDao().findById(id);
	}
	
	@Override
	public List<Links> findAllByLinkNos(List<String> linkNos) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Links.class);
		if (null != linkNos && !linkNos.isEmpty()) {
			detachedCriteria.add(Restrictions.in("linkNo", linkNos));
		}
        detachedCriteria.addOrder(Order.asc("dateCreated"));
		return getLinksDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 100);
	}

	@Override
	public List<Links> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Links.class);
        detachedCriteria.addOrder(Order.desc("dateCreated"));
		return getLinksDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Links.class);
		int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
		return getLinksDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}

	public LinksDao getLinksDao() {
		return linksDao;
	}

	public void setLinksDao(LinksDao linksDao) {
		this.linksDao = linksDao;
	}
	
}
