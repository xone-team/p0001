package com.xone.action.app.purchase;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.action.utils.ImageUtils;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.utils.DateUtils;
import com.xone.service.app.PurchaseService;

public class PurchaseAction extends Action {
	
	private static final long serialVersionUID = 8114006617561140444L;
	
	@Autowired
	protected PurchaseService purchaseService;
	
	protected Purchase purchase;
	protected ImageUploaded imageUploaded;
	protected List<Purchase> list = new ArrayList<Purchase>();
	protected String imageUploadPath;
	
	public String listAll() {
		return SUCCESS;
	}
	
	public String listSales() {
		return SUCCESS;
	}
	
	public String listGroups() {
		return SUCCESS;
	}
	
	public String indexAdd() {
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String create() {
		Map<String, String[]> map = (Map<String, String[]>)getRequest().getParameterMap();
		List<ImageUploaded> images = new ArrayList<ImageUploaded>();
		for (String image : map.get("images")) {
			ImageUploaded iu = new ImageUploaded();
			String [] aImage = image.split(";base64,");
			iu.setImageType(aImage[0].replaceFirst("data:", ""));
			iu.setImage(null);
			images.add(iu);
			String suffix = iu.getImageType().replaceFirst("image/", "");
			try {
				File file = new File(getImageUploadPath());
				if (!file.exists()) {
					file.mkdirs();
				}
				String filename = DateUtils.format(new Date(), "yyyyMMddHHmmssS") + suffix + System.currentTimeMillis() + "." + suffix;
				ImageIO.write(ImageUtils.decodeToImage(aImage[1]), suffix, new File(file.getCanonicalPath() + File.separator + filename));
				iu.setImage(filename);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
//		ImageUploaded image = getImageUploaded();
//		String [] aImage = image.getImage().split(";base64,");
//		image.setImageType(aImage[0].replaceFirst("data:", ""));
//		image.setImage(aImage[1]);
		setPurchase(purchaseService.save(getPurchase(), images));
		return SUCCESS;
	}
	
	public String listItems() {
		Map<String, String> map = getRequestMap();
		Map<String, String> params = new HashMap<String, String>();
		if ("down".equals(map.get("itemaction"))) {
			params.put("gtDateCreated", DateUtils.format(getPurchase().getDateCreated()));
		} else if ("up".equals(map.get("itemaction"))) {
			params.put("ltDateCreated", DateUtils.format(getPurchase().getDateCreated()));
		}
		setList(purchaseService.findAllByMap(params));
		return SUCCESS;
	}
	
	public String listAllForUser() {
		return SUCCESS;
	}
	
	public String listItemsForUser() {
		Map<String, String> map = getRequestMap();
		Map<String, String> params = new HashMap<String, String>();
		if ("down".equals(map.get("itemaction"))) {
			params.put("gtDateCreated", DateUtils.format(getPurchase().getDateCreated()));
		} else if ("up".equals(map.get("itemaction"))) {
			params.put("ltDateCreated", DateUtils.format(getPurchase().getDateCreated()));
		}
		setList(purchaseService.findAllByMap(params));
		return SUCCESS;
	}
	
	public String item() {
		return SUCCESS;
	}
	
	public String itemForUser() {
		return SUCCESS;
	}
	
	public String itemDetails() {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", String.valueOf(getPurchase().getId()));
		setPurchase(purchaseService.findByMap(params));
		return SUCCESS;
	}

	public String getImageUploadPath() {
		return imageUploadPath;
	}

	public void setImageUploadPath(String imageUploadPath) {
		this.imageUploadPath = imageUploadPath;
	}

	public List<Purchase> getList() {
		return list;
	}

	public void setList(List<Purchase> list) {
		this.list = list;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public ImageUploaded getImageUploaded() {
		return imageUploaded;
	}

	public void setImageUploaded(ImageUploaded imageUploaded) {
		this.imageUploaded = imageUploaded;
	}

	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}
	
}
