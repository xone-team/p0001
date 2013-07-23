package com.xone.action.app.assistant;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.service.app.ImageUploadedService;

public class AssistantAction extends LogicAction {
	
	private static final long serialVersionUID = -334632510092302567L;

	@Autowired
	protected ImageUploadedService imageUploadedService;
	
	protected String imageUploadPath;
	
	protected String redirect;
	protected Long id;

	public String main() {
		if (null == getUserMap() || getUserMap().isEmpty()) {
			setRedirect("assistant/index.html");
			return "redirect";
		}
		return SUCCESS;
	}
	
	public String image() {
		return super.image(id, imageUploadPath, getImageUploadedService());
	}
	
	public String getImageUploadPath() {
		return imageUploadPath;
	}

	public void setImageUploadPath(String uploadPath) {
		this.imageUploadPath = uploadPath;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	public ImageUploadedService getImageUploadedService() {
		return imageUploadedService;
	}

	public void setImageUploadedService(ImageUploadedService imageUploadedService) {
		this.imageUploadedService = imageUploadedService;
	}
	
}
