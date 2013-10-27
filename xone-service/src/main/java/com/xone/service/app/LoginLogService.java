package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.LoginLog;
import com.xone.model.hibernate.support.Pagination;

public interface LoginLogService {

	public LoginLog save(LoginLog entity);
	
	public LoginLog update(LoginLog entity);

	public LoginLog findById(Long id);
	
	public void delete(LoginLog entity);

	public List<LoginLog> findAllByMap(Map<String, String> params);
	
	public LoginLog findByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
	
}
