package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Category;
import com.xone.model.hibernate.support.Pagination;
public interface CategoryService {

	public Category save(Category entity);
	public Category update(Category entity);
	public Category findById(Long id);
	
	public void delete(Category entity);
	public List<Category> findAllByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
}