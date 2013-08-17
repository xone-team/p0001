package com.xone.action.app.assistant;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.model.hibernate.entity.CompanyInfo;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.CompanyInfoService;
import com.xone.service.app.ImageUploadedService;
import com.xone.service.app.SubscribeService;

public class AssistantAction extends LogicAction {
	
	private static final long serialVersionUID = -334632510092302567L;

	@Autowired
	protected ImageUploadedService imageUploadedService;
	
	@Autowired
	protected SubscribeService subscribeService;
	
	@Autowired
	protected CompanyInfoService companyInfoService;
	
	protected List<Subscribe> list = new ArrayList<Subscribe>();
	protected String imageUploadPath;
	protected CompanyInfo companyInfo = new CompanyInfo();
	
	protected String redirect;
	protected Long id;

	public String main() {
		if (null == getUserMap() || getUserMap().isEmpty()) {
			setRedirect("assistant/index.html");
			return "redirect";
		}
		return SUCCESS;
	}
	
	/**
	 * 公司详细信息
	 * @return
	 */
	public String companyInfo() {
		setCompanyInfo(getCompanyInfoService().findById(getCompanyInfo().getId()));
		return SUCCESS;
	}
	
	public String subscribe() {
		List<Subscribe> l = getSubscribeService().findAllSubscribe(getRequestMap());
		if (null != l && !l.isEmpty()) {
			getList().addAll(l);
		}
		//最后一次请求数据库查询订阅的时间
		getMapValue().put("lastSubscribeUpdated", MyDateUtils.format(new Date()));
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

	public List<Subscribe> getList() {
		return list;
	}

	public void setList(List<Subscribe> list) {
		this.list = list;
	}

	public ImageUploadedService getImageUploadedService() {
		return imageUploadedService;
	}

	public void setImageUploadedService(ImageUploadedService imageUploadedService) {
		this.imageUploadedService = imageUploadedService;
	}

	public SubscribeService getSubscribeService() {
		return subscribeService;
	}

	public void setSubscribeService(SubscribeService subscribeService) {
		this.subscribeService = subscribeService;
	}

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}

	public CompanyInfoService getCompanyInfoService() {
		return companyInfoService;
	}

	public void setCompanyInfoService(CompanyInfoService companyInfoService) {
		this.companyInfoService = companyInfoService;
	}
	
}
