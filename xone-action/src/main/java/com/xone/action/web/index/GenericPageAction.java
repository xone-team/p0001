package com.xone.action.web.index;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.entity.Overhead;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.AdbannerService;
import com.xone.service.app.ImageUploadedService;
import com.xone.service.app.OverheadService;
import com.xone.service.app.ProductService;
import com.xone.service.app.PurchaseService;

public class GenericPageAction extends LogicAction {

	private static final long serialVersionUID = 3931276775119871344L;
	
	@Autowired
	protected ImageUploadedService imageUploadedService;
	
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
	@Autowired
	protected OverheadService overheadService;
	protected Pagination overheadPage = new Pagination();

	public String index() throws Exception {
		
		// get products
	    Map<String, String> params = new HashMap<String, String>();
	    params.put("checkStatus", Product.CheckStatus.PASSED.getValue());
	    params.put("flagDeleted", Product.FlagDeleted.NORMAL.getValue());
	    params.put("pageSize", "10");
	    params.put("pageNo", "0");
	    Pagination p = getProductService().findByParams(params);
	    setProductPage(p);
	    
	    // get purchases
	    params = new HashMap<String, String>();
	    params.put("flagDeleted", Purchase.FlagDeleted.NORMAL.getValue());
	    params.put("pageSize", "10");
	    params.put("pageNo", "0");
	    p = getPurchaseService().findByParams(params);
	    setPurchasePage(p);
	    
//	    params = new HashMap<String, String>();
//	    params.put("checkStatus", Overhead.CheckStatus.PASSED.getValue());
//	    overheadPage = overheadService.findByParams(params);
//	    
//	    // get ad
//		params = new HashMap<String, String>();
//		setAdList(getAdbannerService().findItemsByMap(params));
		
		return SUCCESS;
	}
	
	public String about() throws Exception {
		return SUCCESS;
	}
	
	public String image() {
		return super.image(getId(), getImageUploadPath(), getImageUploadedService());
	}
	
	public String mobile() {
		try {
			String id = getRequest().getParameter("mid");
			if (!"android".equals(id) && !"iphone".equals(id)) {
				return SUCCESS;
			}
			if (null == getImageUploadPath()) {
				return SUCCESS;
			}
	        response.setContentType("application/octet-stream");// 设置返回的文件类型 
	        response.setCharacterEncoding("UTF-8");
        	File file = new File(getImageUploadPath());
	        File mobileFile = null;
	        if ("android".equals(id)) {
	        	mobileFile = new File(file.getCanonicalPath() + File.separator + id + ".apk");
//	        response.addHeader("Content-Type", "application/vnd.android.package-archive");
	        	response.setHeader("Content-Disposition", "attachment;filename=mobile.apk");
	        } else if ("iphone".equals(id)) {
	        	mobileFile = new File(file.getCanonicalPath() + File.separator + id + ".ipa");
	        	response.setHeader("Content-Disposition", "attachment;filename=mobile.ipa");
	        }
	        IOUtils.copy(new FileInputStream(mobileFile), response.getOutputStream());
            response.flushBuffer();
		} catch (Exception e) {
			e.printStackTrace();
			return SUCCESS;
		}
		return null;
	}

	public ImageUploadedService getImageUploadedService() {
		return imageUploadedService;
	}

	public void setImageUploadedService(ImageUploadedService imageUploadedService) {
		this.imageUploadedService = imageUploadedService;
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

	public OverheadService getOverheadService() {
		return overheadService;
	}

	public void setOverheadService(OverheadService overheadService) {
		this.overheadService = overheadService;
	}

	public Pagination getOverheadPage() {
		return overheadPage;
	}

	public void setOverheadPage(Pagination overheadPage) {
		this.overheadPage = overheadPage;
	}

}
