package com.xone.action.back.purchase;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.entity.Purchase;
import com.xone.model.hibernate.support.Pagination;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.PurchaseService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class PurchaseBackAction extends LogicAction {

	/**
     * 
     */
	private static final long serialVersionUID = 5760763917137319953L;
	@Autowired
	protected PurchaseService purchaseService;
	protected Purchase purchase = new Purchase();
	protected List<Purchase> list = new ArrayList<Purchase>();
	protected Pagination pagination = new Pagination();

	protected File uploadFile1;
	protected String uploadFile1ContentType;
	protected String uploadFile1FileName;

	protected File uploadFile2;
	protected String uploadFile2ContentType;
	protected String uploadFile2FileName;

	protected File uploadFile3;
	protected String uploadFile3ContentType;
	protected String uploadFile3FileName;

	public Enum<?>[] getFlagDeleted() {
		return Purchase.FlagDeleted.values();
	}

	public Enum<?>[] getCheckStatus() {
		return Purchase.CheckStatus.values();
	}

	public Enum<?>[] getPurchaseType() {
		return Purchase.PurchaseType.values();
	}

	public Enum<?>[] getSaleType() {
		return Purchase.SaleType.values();
	}

	public String purchaseList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		MyBeanUtils.copyPropertiesToMap(getPurchase(), params, new CopyRules() {
			@Override
			public boolean myCopyRules(Object value) {
				return null != value;
			}

		}, new AssignRules() {
			@Override
			public String myAssignRules(Object value) {
				if (null != value && value instanceof Date) {
					return MyDateUtils.format((Date) value, "yyyy-MM-dd");
				}
				return value.toString();
			}
		}, null);
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getPurchaseService().findByParams(params);
		setPagination(p);
		return SUCCESS;
	}

	public String purchaseItem() throws Exception {
		Purchase entity = purchaseService.findById(getPurchase().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setPurchase(entity);
		return SUCCESS;
	}

	public String purchaseCreate() throws Exception {
//		purchase.setPurchaseNum("0");
		return SUCCESS;
	}

	public String purchaseEdit() throws Exception {
		Purchase entity = getPurchaseService().findById(getPurchase().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setPurchase(entity);
		return SUCCESS;
	}

	public String purchaseSave() throws Exception {
		purchase.setUserCreated(getUserId());
		purchase.setDateCreated(new Date());
		purchase.setUserUpdated(getUserId());
		purchase.setLastUpdated(new Date());

		purchase.setUserApply(getUserId());
		purchase.setDateApply(new Date());

		try {
			setPurchase(getPurchaseService().save(getPurchase(), getImageList()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			if( e instanceof FileUploadException){
				addFieldError("uploadFile1", "请上传小于2M的png,jpg,gif图片");
			}
			return INPUT;
		}
		return SUCCESS;
	}

	private List<ImageUploaded> getImageList() {
		List<ImageUploaded> images = new ArrayList<ImageUploaded>();
		if (uploadFile1 != null) {
			ImageUploaded imageUploaded1 = createUploadImageByFile(
					getImageUploadPath(), ImageUploaded.RefType.PURCHASE,
					getUploadFile1(), getUploadFile1ContentType(),
					getUploadFile1FileName());
			images.add(imageUploaded1);
		}
		if (uploadFile2 != null) {
			ImageUploaded imageUploaded2 = createUploadImageByFile(
					getImageUploadPath(), ImageUploaded.RefType.PURCHASE,
					getUploadFile2(), getUploadFile2ContentType(),
					getUploadFile2FileName());
			images.add(imageUploaded2);
		}
		if (uploadFile3 != null) {
			ImageUploaded imageUploaded3 = createUploadImageByFile(
					getImageUploadPath(), ImageUploaded.RefType.PURCHASE,
					getUploadFile3(), getUploadFile3ContentType(),
					getUploadFile3FileName());
			images.add(imageUploaded3);
		}

		return images;
	}

	public String purchaseUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap()
				.get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			Purchase entity = getPurchaseService().findById(
					getPurchase().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getPurchaseService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			Purchase entity = getPurchaseService().findById(
					getPurchase().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}

			List<Long> oldIds = entity.getIds();
			List<Long> newIds = purchase.getIds();

			MyBeanUtils.copyProperties(getPurchase(), entity, Purchase.class,
					null, new CopyRules() {
						@Override
						public boolean myCopyRules(Object value) {
							return (null != value);
						}
					});
			entity.setUserUpdated(getUserId());
			entity.setLastUpdated(new Date());
//			if (Purchase.CheckStatus.DENIED.getValue().equals(
//					purchase.getPurchaseCheck().getCheckStatus())
//					|| Purchase.CheckStatus.PASSED.getValue().equals(
//							purchase.getPurchaseCheck().getCheckStatus())) {
				entity.setUserCheck(getUserId());
				entity.setDateCheck(new Date());
				entity.getPurchaseCheck().setUserCheck(getUserId());
//			}

			entity.setIds(oldIds);
			try {
				setPurchase(getPurchaseService().update(entity, getImageList(),
						newIds));
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				if( e instanceof FileUploadException){
					addFieldError("uploadFile1", "请上传小于2M的png,jpg,gif图片");
				}
				return INPUT;
			}
		}
		return SUCCESS;
	}

	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
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

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public File getUploadFile1() {
		return uploadFile1;
	}

	public void setUploadFile1(File uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}

	public String getUploadFile1ContentType() {
		return uploadFile1ContentType;
	}

	public void setUploadFile1ContentType(String uploadFile1ContentType) {
		this.uploadFile1ContentType = uploadFile1ContentType;
	}

	public String getUploadFile1FileName() {
		return uploadFile1FileName;
	}

	public void setUploadFile1FileName(String uploadFile1FileName) {
		this.uploadFile1FileName = uploadFile1FileName;
	}

	public File getUploadFile2() {
		return uploadFile2;
	}

	public void setUploadFile2(File uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}

	public String getUploadFile2ContentType() {
		return uploadFile2ContentType;
	}

	public void setUploadFile2ContentType(String uploadFile2ContentType) {
		this.uploadFile2ContentType = uploadFile2ContentType;
	}

	public String getUploadFile2FileName() {
		return uploadFile2FileName;
	}

	public void setUploadFile2FileName(String uploadFile2FileName) {
		this.uploadFile2FileName = uploadFile2FileName;
	}

	public File getUploadFile3() {
		return uploadFile3;
	}

	public void setUploadFile3(File uploadFile3) {
		this.uploadFile3 = uploadFile3;
	}

	public String getUploadFile3ContentType() {
		return uploadFile3ContentType;
	}

	public void setUploadFile3ContentType(String uploadFile3ContentType) {
		this.uploadFile3ContentType = uploadFile3ContentType;
	}

	public String getUploadFile3FileName() {
		return uploadFile3FileName;
	}

	public void setUploadFile3FileName(String uploadFile3FileName) {
		this.uploadFile3FileName = uploadFile3FileName;
	}

}
