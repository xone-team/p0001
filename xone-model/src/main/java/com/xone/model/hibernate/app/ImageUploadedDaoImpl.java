package com.xone.model.hibernate.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.generic.AbstractHibernateDao;

public class ImageUploadedDaoImpl extends AbstractHibernateDao<ImageUploaded> implements ImageUploadedDao {
	
	public int deleteLogicById(Long id) {
		return getHibernateTemplate().bulkUpdate("update " + ImageUploaded.class.getName() + " clazz set clazz.flagDeleted = ? where clazz.id = ?", new Object[] {
			ImageUploaded.FlagDeleted.DELETED.getValue(), id
		});
	}

	public List<Long> findAllIdsByRefId(Long refId, ImageUploaded.RefType refType) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ImageUploaded.class);
		detachedCriteria.add(Restrictions.eq("refId", refId));
		detachedCriteria.add(Restrictions.eq("refType", refType.getValue()));
		detachedCriteria.add(Restrictions.eq("flagDeleted", ImageUploaded.FlagDeleted.NORMAL.getValue()));
		List<ImageUploaded> l = this.findListByDetachedCriteria(detachedCriteria, 0, 5);
		if (null == l || l.size() <= 0) {
			return Collections.emptyList();
		}
		List<Long> ids = new ArrayList<Long>();
		for (ImageUploaded i : l) {
			ids.add(i.getId());
		}
		return ids;
	}
	
	public Map<Long, List<Long>> findAllIdsByRefIds(List<Long> refIds, ImageUploaded.RefType refType, int index, int maxResult) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ImageUploaded.class);
		detachedCriteria.add(Restrictions.in("refId", refIds));
		detachedCriteria.add(Restrictions.eq("refType", refType.getValue()));
		detachedCriteria.add(Restrictions.eq("flagDeleted", ImageUploaded.FlagDeleted.NORMAL.getValue()));
		List<ImageUploaded> l = this.findListByDetachedCriteria(detachedCriteria, index, maxResult);
		if (null == l || l.size() <= 0) {
			return Collections.emptyMap();
		}
		Map<Long, List<Long>> result = new HashMap<Long, List<Long>>();
		for (ImageUploaded i : l) {
			Long refId = i.getRefId();
			List<Long> ids = result.get(refId);
			if (null == ids) {
				ids = new ArrayList<Long>();
			}
			ids.add(i.getId());
			result.put(refId, ids);
		}
		return result;
	}

}