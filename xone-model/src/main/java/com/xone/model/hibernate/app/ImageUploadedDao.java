package com.xone.model.hibernate.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.generic.HibernateDao;

public interface ImageUploadedDao extends HibernateDao<ImageUploaded> {

	public int deleteLogicById(Long id);
	
	public List<Long> findAllIdsByRefId(Long refId, ImageUploaded.RefType refType);
	
	public Map<Long, List<Long>> findAllIdsByRefIds(List<Long> refIds, ImageUploaded.RefType refType, int index, int maxResult);

}