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
import com.xone.service.app.PurchaseServiceImpl;

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
	
	public String create() {
//		ImageUploaded image = getImageUploaded();
//		String [] aImage = image.getImage().split(";base64,");
//		image.setImageType(aImage[0].replaceFirst("data:", ""));
//		image.setImage(aImage[1]);
		List<ImageUploaded> images = findImageByParams();
		setPurchase(purchaseService.save(getPurchase(), images));
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
			iu.setRefType(ImageUploaded.RefType.PURCHASE.getValue());
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
	
	public String updateItem() {
		Long id = getPurchase().getId();
		if (null != id) {
			Purchase p = findById(id);
			if (null == p || null == p.getId()) {
				getMapValue().put("msg", "无此记录.");
				return ERROR;
			}
//			if (p.get) {
//				getMapValue().put("msg", "已经通过审核的信息不能进行更新操作");
//				return ERROR;
//			}
			setPurchase(p);
			return SUCCESS;
		}
		getMapValue().put("msg", "缺失数据标识.");
		return ERROR;
	}
	
	protected Purchase findById(Long id) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", String.valueOf(id));
		return purchaseService.findByMap(params);
	}
	
	public String update() {
		Purchase pu = getPurchase();
		if (null == pu || null == pu.getId()) {
			getMapValue().put("msg", "无此记录.");
			return ERROR;
		}
		Purchase entity = findById(pu.getId());
//		if (p.get) {
//		getMapValue().put("msg", "已经通过审核的信息不能进行更新操作");
//		return ERROR;
//	}
		entity.setPurchaseName(pu.getPurchaseName());
		entity.setPurchaseNum(pu.getPurchaseNum());
		entity.setPurchaseType(pu.getPurchaseType());
		entity.setPurchaseValid(pu.getPurchaseValid());
		entity.setPurchaseLocation(pu.getPurchaseLocation());
		entity.setPurchaseDesc(pu.getPurchaseDesc());
		entity.setPurchaseAddress(pu.getPurchaseAddress());
		List<ImageUploaded> imageUploadeds = findImageByParams();
		entity = purchaseService.update(entity, imageUploadeds, pu.getIds());
		setPurchase(entity);
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
