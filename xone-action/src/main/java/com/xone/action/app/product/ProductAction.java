package com.xone.action.app.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.action.utils.ImageUtils;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Product;
import com.xone.model.utils.DateUtils;
import com.xone.service.app.ProductService;

public class ProductAction extends Action {
	
	
	private static final long serialVersionUID = -5292513131447154086L;
	
	@Autowired
	protected ProductService productService;
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
		return SUCCESS;
	}
	
	public String create() {
		List<ImageUploaded> images = findImageByParams();
		setProduct(getProductService().save(getProduct(), images));
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	protected List<ImageUploaded> findImageByParams() {
		Map<String, String[]> map = (Map<String, String[]>)getRequest().getParameterMap();
		List<ImageUploaded> images = new ArrayList<ImageUploaded>();
		for (String image : map.get("images")) {
			String [] aImage = image.split(";base64,");
			if (aImage.length != 2 || !aImage[0].startsWith("data:")) {
				continue;
			}
			ImageUploaded iu = new ImageUploaded();
			iu.setImageType(aImage[0].replaceFirst("data:", ""));
			iu.setImage(null);
			iu.setRefType(ImageUploaded.RefType.PRODUCT.getValue());
			images.add(iu);
			String suffix = iu.getImageType().replaceFirst("image/", "");
			try {
				File file = new File(getImageUploadPath());
				if (!file.exists()) {
					file.mkdirs();
				}
				String filename = getUniqueId() + "." + suffix;
				ImageIO.write(ImageUtils.decodeToImage(aImage[1]), suffix, new File(file.getCanonicalPath() + File.separator + filename));
				iu.setImage(filename);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return images;
	}
	
	public String listItems() {
		Map<String, String> map = getRequestMap();
		Map<String, String> params = new HashMap<String, String>();
		if ("down".equals(map.get("itemaction"))) {
			params.put("gtDateCreated", DateUtils.format(getProduct().getDateCreated()));
		} else if ("up".equals(map.get("itemaction"))) {
			params.put("ltDateCreated", DateUtils.format(getProduct().getDateCreated()));
		}
		params.put("saleType", getProduct().getSaleType());
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
			params.put("gtDateCreated", DateUtils.format(getProduct().getDateCreated()));
		} else if ("up".equals(map.get("itemaction"))) {
			params.put("ltDateCreated", DateUtils.format(getProduct().getDateCreated()));
		}
		params.put("saleType", getProduct().getSaleType());
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
//		if (p.get) {
//		getMapValue().put("msg", "已经通过审核的信息不能进行更新操作");
//		return ERROR;
//	}
		entity.setProductName(pu.getProductName());
		entity.setProductNum(pu.getProductNum());
		entity.setProductType(pu.getProductType());
		entity.setProductValid(pu.getProductValid());
		entity.setProductLocation(pu.getProductLocation());
		entity.setProductDesc(pu.getProductDesc());
		entity.setProductAddress(pu.getProductAddress());
		List<ImageUploaded> imageUploadeds = findImageByParams();
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
//			if (p.get) {
//				getMapValue().put("msg", "已经通过审核的信息不能进行更新操作");
//				return ERROR;
//			}
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
