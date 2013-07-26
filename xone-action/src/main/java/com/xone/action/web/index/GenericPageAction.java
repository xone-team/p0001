package com.xone.action.web.index;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.service.app.ImageUploadedService;

public class GenericPageAction extends LogicAction {

	private static final long serialVersionUID = 3931276775119871344L;
	
	@Autowired
	protected ImageUploadedService imageUploadedService;
	
	protected String imageUploadPath;
	
	protected Long id;

	public String index() throws Exception {
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
	
}
