package com.xone.action.web.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.AdbannerService;
import com.xone.service.app.ImageUploadedService;
import com.xone.service.app.ProductService;
import com.xone.service.app.PurchaseService;

public class GenericPageAction extends LogicAction {

	private static final long serialVersionUID = 3931276775119871344L;
	
	@Autowired
	protected ImageUploadedService imageUploadedService;
	
	protected String imageUploadPath;
	
	protected Long id;
	@Autowired
	protected ProductService productService;
	protected Pagination productPage = new Pagination();
	@Autowired
	protected PurchaseService purchaseService;
	protected Pagination purchasePage = new Pagination();
	@Autowired
	protected AdbannerService adbannerService;
	protected List<Adbanner> adList = new ArrayList<Adbanner>();

	public String index() throws Exception {
		
		// get products
	    Map<String, String> params = new HashMap<String, String>();
	    params.put("flagDeleted", Product.FlagDeleted.NORMAL.getValue());
	    params.put("pageSize", "20");
	    params.put("pageNo", "0");
	    Pagination p = getProductService().findByParams(params);
	    setProductPage(p);
	    
	    // get purchases
	    params = new HashMap<String, String>();
	    params.put("flagDeleted", Purchase.FlagDeleted.NORMAL.getValue());
	    params.put("pageSize", "20");
	    params.put("pageNo", "0");
	    p = getPurchaseService().findByParams(params);
	    setPurchasePage(p);
	    
	    // get ad
		params = new HashMap<String, String>();
		setAdList(getAdbannerService().findItemsByMap(params));
		
		return SUCCESS;
	}
	
	public String about() throws Exception {
		return SUCCESS;
	}
	
	public String image() {
		return super.image(getId(), getImageUploadPath(), getImageUploadedService());
	}

	public ImageUploadedService getImageUploadedService() {
		return imageUploadedService;
	}

	public void setImageUploadedService(ImageUploadedService imageUploadedService) {
		this.imageUploadedService = imageUploadedService;
	}

	public String getImageUploadPath() {
		return imageUploadPath;
	}

	public void setImageUploadPath(String imageUploadPath) {
		this.imageUploadPath = imageUploadPath;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public Pagination getProductPage() {
		return productPage;
	}

	public void setProductPage(Pagination productPage) {
		this.productPage = productPage;
	}

	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}

	public Pagination getPurchasePage() {
		return purchasePage;
	}

	public void setPurchasePage(Pagination purchasePage) {
		this.purchasePage = purchasePage;
	}

	public AdbannerService getAdbannerService() {
		return adbannerService;
	}

	public void setAdbannerService(AdbannerService adbannerService) {
		this.adbannerService = adbannerService;
	}

	public List<Adbanner> getAdList() {
		return adList;
	}

	public void setAdList(List<Adbanner> adList) {
		this.adList = adList;
	}
	
}
