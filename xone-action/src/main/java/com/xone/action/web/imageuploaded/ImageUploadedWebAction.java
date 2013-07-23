package com.xone.action.web.imageuploaded;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.ImageUploadedService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class ImageUploadedWebAction extends Action {
	
	@Autowired
	protected ImageUploadedService imageUploadedService;
	protected ImageUploaded imageUploaded = new ImageUploaded();
	protected List<ImageUploaded> list = new ArrayList<ImageUploaded>();
	protected Pagination pagination = new Pagination();
	
	public String imageUploadedList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getImageUploadedService().findByParams(params);
//		List<ImageUploaded> l = getImageUploadedService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
	public String imageUploadedItem() throws Exception {
		ImageUploaded entity = getImageUploadedService().findById(getImageUploaded().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setImageUploaded(entity);
		return SUCCESS;
	}
	
	public String imageUploadedCreate() throws Exception {
		return SUCCESS;
	}
	
	public String imageUploadedEdit() throws Exception {
		ImageUploaded entity = getImageUploadedService().findById(getImageUploaded().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setImageUploaded(entity);
		return SUCCESS;
	}
	
	public String imageUploadedSave() throws Exception {
		setImageUploaded(getImageUploadedService().save(getImageUploaded()));
		return SUCCESS;
	}
	
	public String imageUploadedUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			ImageUploaded entity = getImageUploadedService().findById(getImageUploaded().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getImageUploadedService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			ImageUploaded entity = getImageUploadedService().findById(getImageUploaded().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getImageUploaded(), entity, ImageUploaded.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			setImageUploaded(getImageUploadedService().update(entity));
		}
		return SUCCESS;
	}

	public ImageUploadedService getImageUploadedService() {
		return imageUploadedService;
	}

	public void setImageUploadedService(ImageUploadedService imageUploadedService) {
		this.imageUploadedService = imageUploadedService;
	}

	public List<ImageUploaded> getList() {
		return list;
	}

	public void setList(List<ImageUploaded> list) {
		this.list = list;
	}

	public ImageUploaded getImageUploaded() {
		return imageUploaded;
	}

	public void setImageUploaded(ImageUploaded imageUploaded) {
		this.imageUploaded = imageUploaded;
	}
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
