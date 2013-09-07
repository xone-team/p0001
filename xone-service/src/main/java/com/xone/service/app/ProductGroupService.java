package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.ProductGroup;
import com.xone.model.hibernate.support.Pagination;

public interface ProductGroupService {

	public ProductGroup save(ProductGroup entity);
	
	public ProductGroup update(ProductGroup entity);

	public ProductGroup findById(Long id);
	
	public void delete(ProductGroup entity);

	public List<ProductGroup> findAllByMap(Map<String, String> params);
	
	public ProductGroup findByMap(Map<String, String> params);
	
	public Pagination findByParams(Map<String, String> params);
	
	public int getOrderProductNum(Long productId);
	
	public int getOrderPersonNum(Long productId);

	public int getProductLeftNum(Long productId);
	
	public ProductGroup updateToCancelGroup(ProductGroup entity);
}
