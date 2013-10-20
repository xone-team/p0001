package com.xone.action.app.assistant;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.LogicAction;
import com.xone.model.hibernate.entity.CompanyInfo;
import com.xone.model.hibernate.entity.Links;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.hibernate.entity.UserLinks;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.CompanyInfoService;
import com.xone.service.app.ImageUploadedService;
import com.xone.service.app.LinksService;
import com.xone.service.app.SubscribeService;
import com.xone.service.app.UserLinksService;

public class AssistantAction extends LogicAction {
	
	private static final long serialVersionUID = -334632510092302567L;

	@Autowired
	protected ImageUploadedService imageUploadedService;
	
	@Autowired
	protected SubscribeService subscribeService;
	
	@Autowired
	protected CompanyInfoService companyInfoService;
	
	@Autowired
	protected LinksService linksService;
	
	@Autowired
	protected UserLinksService userLinksService;
	
	protected List<Subscribe> list = new ArrayList<Subscribe>();
	protected List<Links> links = new ArrayList<Links>();
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
	
	public String guide() {
		Long userId = getUserId();
		List<String> list = new ArrayList<String>();
		if (userId > 0) {
			List<UserLinks> userLinks = getUserLinksService().findAllByUserId(getUserId());
			for (UserLinks ul : userLinks) {
				list.add(ul.getLinkNo());
			}
		} else {
			list.addAll(Arrays.asList(new String[] {
				"A001", "A002", "A003", "A004", "A005", "A006"	
			}));
		}
		if (!list.isEmpty()) {
			List<Links> l = getLinksService().findAllByLinkNos(list);
			if (null != l && !l.isEmpty()) {
				getLinks().addAll(l);
			}
		}
		if (getLinks().isEmpty()) {
			getLinks().add(new Links());
			getLinks().add(new Links());
			getLinks().add(new Links());
		}
		Links addLink = new Links();
		addLink.setLink("/assistant/linkkeys.html");
		addLink.setLinkType("add");
		getLinks().add(addLink);
		return SUCCESS;
	}
	
	public String dolink() {
		Long userId = getUserId();
		Map<String, String> param = getRequestMap();
		if (StringUtils.isNotBlank(param.get("linkno")) && userId > 0) {
			getMapValue().put("UR", getUserLinksService().updateUserLink(param.get("linkno").trim(), userId));
		}
		return SUCCESS;
	}
	
	public String linkkeys() {
		List<UserLinks> userLinks = getUserLinksService().findAllByUserId(getUserId());
		Map<String, String> target = new HashMap<String, String>();
		if (null != userLinks && !userLinks.isEmpty()) {
			for (UserLinks ul : userLinks) {
				target.put(ul.getLinkNo(), "OK");
			}
		}
		List<Links> list = getLinksService().findAllByLinkNos(null);
		for (Links link : list) {
			if ("OK".equals(target.get(link.getLinkNo()))) {
				link.setSelected(true);
			} else {
				link.setSelected(false);
			}
			getLinks().add(link);
		}
		return SUCCESS;
	}
	
	public String market() {
		return SUCCESS;
	}
	
	public String redirect() {
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
		return super.image(id, getImageUploadPath(), getImageUploadedService());
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

	public LinksService getLinksService() {
		return linksService;
	}

	public void setLinksService(LinksService linksService) {
		this.linksService = linksService;
	}

	public UserLinksService getUserLinksService() {
		return userLinksService;
	}

	public void setUserLinksService(UserLinksService userLinksService) {
		this.userLinksService = userLinksService;
	}

	public List<Links> getLinks() {
		return links;
	}

	public void setLinks(List<Links> links) {
		this.links = links;
	}
	
}
