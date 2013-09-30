package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Links;

public interface LinksService {

	public Links findById(Long id);
	
	public List<Links> findAllByLinkNos(List<String> linkNos);
	
	public List<Links> findAllByMap(Map<String, String> params);
	
}
