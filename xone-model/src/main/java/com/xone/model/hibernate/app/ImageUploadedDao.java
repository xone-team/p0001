package com.xone.model.hibernate.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.generic.HibernateDao;

public interface ImageUploadedDao extends HibernateDao<ImageUploaded> {

	public List<Long> findAllIdsByRefId(Long refId);
	
	public Map<Long, List<Long>> findAllIdsByRefIds(List<Long> refIds, int index, int maxResult);

}