package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.UserLinks;
import com.xone.model.hibernate.support.Pagination;

public interface UserLinksService {

	public UserLinks save(UserLinks entity);
	
	public UserLinks update(UserLinks entity);

	public UserLinks findById(Long id);
	
	public void delete(UserLinks entity);
	
	public String updateUserLink(String linkNo, Long userId);
	
	public List<UserLinks> findAllByUserId(Long userId);

	public List<UserLinks> findAllByMap(Map<String, String> params);
	
	public UserLinks findByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
	
}
