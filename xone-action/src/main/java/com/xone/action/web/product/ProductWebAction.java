package com.xone.action.web.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Product;
import com.xone.service.app.ProductService;

public class ProductWebAction extends Action {

	private static final long serialVersionUID = -249087929101371902L;
	
	@Autowired
	protected ProductService productService;
	protected List<Product> list = new ArrayList<Product>();

	public String list() {
		Map<String, String> params = new HashMap<String, String>();
		List<Product> l = getProductService().findAllByMap(params);
		if (null != l && !l.isEmpty()) {
			list.addAll(l);
		}
		return SUCCESS;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}
	
}
