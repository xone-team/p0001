package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.CompanyInfo;
import com.xone.model.hibernate.support.Pagination;

public interface CompanyInfoService {

	public CompanyInfo save(CompanyInfo entity);
	
	public CompanyInfo update(CompanyInfo entity);

	public CompanyInfo findById(Long id);
	
	public void delete(CompanyInfo entity);

	public List<CompanyInfo> findAllByMap(Map<String, String> params);
	
	public CompanyInfo findByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
	
}
