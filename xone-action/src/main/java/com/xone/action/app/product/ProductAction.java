
package com.xone.action.app.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.ProductService;
import com.xone.service.app.SubscribeService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;
import com.xone.service.app.utils.MyServerUtils;

public class ProductAction extends LogicAction {
	
	
	private static final long serialVersionUID = -5292513131447154086L;
	
	@Autowired
	protected ProductService productService;
	
	@Autowired
	protected SubscribeService subscribeService;
	
	protected Product product = new Product();
	protected String imageUploadPath;
	protected List<Product> list = new ArrayList<Product>();

	public String listAll() {
		product.setSaleType(Product.SaleType.NORMAL.getValue());
		return SUCCESS;
	}
	
	/**
	 * 手机上滑动更多
	 * @return
	 */
	public String listMobileMore() {
		return SUCCESS;
	}
	
	public String listSales() {
		product.setSaleType(Product.SaleType.SALES.getValue());
		return SUCCESS;
	}
	
	public String listGroups() {
		product.setSaleType(Product.SaleType.GROUPS.getValue());
		return SUCCESS;
	}
	
	public String add() {
		getProduct().setSaleType(Product.SaleType.NORMAL.getValue());
		return SUCCESS;
	}
	
	public String addSales() {
		getProduct().setSaleType(Product.SaleType.SALES.getValue());
		return SUCCESS;
	}
	
	public String addGroups() {
		getProduct().setSaleType(Product.SaleType.GROUPS.getValue());
		return SUCCESS;
	}
	
	public String create() {
		getProduct().setCheckStatus(Product.CheckStatus.WAITING.getValue());
		getProduct().setUserCreated(getUserId());
		List<ImageUploaded> images = super.createImageByParams(getImageUploadPath(), ImageUploaded.RefType.PRODUCT);
		setProduct(getProductService().save(getProduct(), images));
		return SUCCESS;
	}
	
	public String listSubscribeProduct() {
		Map<String, String> params = getSubscribeService().updateSubscribeProductInfo(getRequestMap());
		if (null != params && !params.isEmpty()) {
			getMapValue().putAll(params);
		}
		return SUCCESS;
	}
	
	public String listItems() {
		Map<String, String> map = getRequestMap();
		Map<String, String> params = new HashMap<String, String>();
		if ("down".equals(map.get("itemaction")) && null != getProduct().getDateCreated()) {
			params.put("gtDateCreated", MyDateUtils.format(getProduct().getDateCreated()));
		} else if ("up".equals(map.get("itemaction")) && null != getProduct().getDateCreated()) {
			params.put("ltDateCreated", MyDateUtils.format(getProduct().getDateCreated()));
		}
		if (null != getProduct().getGtDateCreated()) {
			params.put("gtDateCreated", MyServerUtils.format(getProduct().getGtDateCreated()));
		}
		if (!StringUtils.isBlank(getProduct().getProductName())) {
			params.put("productName", getProduct().getProductName());
		}
		params.put("saleType", getProduct().getSaleType());
		params.put("checkStatus", Product.CheckStatus.PASSED.getValue());
		params.put("flagDeleted", Product.FlagDeleted.NORMAL.getValue());
		setList(getProductService().findAllByMap(params));
		return SUCCESS;
	}
	
	public String itemDetails() {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", String.valueOf(getProduct().getId()));
		setProduct(getProductService().findByMap(params));
		return SUCCESS;
	}
	
	public String item() {
		return SUCCESS;
	}
	
	public String itemForUser() {
		return SUCCESS;
	}
	
	public String listAllForUser() {
		return SUCCESS;
	}
	
	public String listItemsForUser() {
		Map<String, String> map = getRequestMap();
		Map<String, String> params = new HashMap<String, String>();
		if ("down".equals(map.get("itemaction"))) {
			params.put("gtDateCreated", MyDateUtils.format(getProduct().getDateCreated()));
		} else if ("up".equals(map.get("itemaction"))) {
			params.put("ltDateCreated", MyDateUtils.format(getProduct().getDateCreated()));
		}
		params.put("saleType", getProduct().getSaleType());
		params.put("userCreated", String.valueOf(getUserId()));
		setList(getProductService().findAllByMap(params));
		return SUCCESS;
	}
	
	public String update() {
		Product pu = getProduct();
		if (null == pu || null == pu.getId()) {
			getMapValue().put("msg", "无此记录.");
			return ERROR;
		}
		Product entity = findById(pu.getId());
		if (Product.CheckStatus.PASSED.getValue().equals(entity.getCheckStatus())) {
			getMapValue().put("msg", "已经通过审核的信息不能进行更新操作");
			return ERROR;
		}
		MyBeanUtils.copyProperties(pu, entity, Product.class, null, new CopyRules() {
			@Override
			public boolean myCopyRules(Object value) {
				return (null != value);
			}
		});
		List<ImageUploaded> imageUploadeds = super.createImageByParams(getImageUploadPath(), ImageUploaded.RefType.PRODUCT);
		entity = getProductService().update(entity, imageUploadeds, pu.getIds());
		setProduct(entity);
		return SUCCESS;
	}
	
	public String updateItem() {
		Long id = getProduct().getId();
		if (null != id) {
			Product p = findById(id);
			if (null == p || null == p.getId()) {
				getMapValue().put("msg", "无此记录.");
				return ERROR;
			}
			if (Product.CheckStatus.PASSED.getValue().equals(p.getCheckStatus())) {
				getMapValue().put("msg", "已经通过审核的信息不能进行更新操作");
				return ERROR;
			}
			setProduct(p);
			return SUCCESS;
		}
		getMapValue().put("msg", "缺失数据标识.");
		return ERROR;
	}
	
	protected Product findById(Long id) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", String.valueOf(id));
		return getProductService().findByMap(params);
	}
	
	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public SubscribeService getSubscribeService() {
		return subscribeService;
	}

	public void setSubscribeService(SubscribeService subscribeService) {
		this.subscribeService = subscribeService;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getImageUploadPath() {
		return imageUploadPath;
	}

	public void setImageUploadPath(String imageUploadPath) {
		this.imageUploadPath = imageUploadPath;
	}

}
