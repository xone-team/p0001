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
import com.xone.action.utils.Shared;
import com.xone.model.hibernate.entity.Adbanner;
import com.xone.model.hibernate.entity.CompanyInfo;
import com.xone.model.hibernate.entity.Links;
import com.xone.model.hibernate.entity.Subscribe;
import com.xone.model.hibernate.entity.UserLinks;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.AdbannerService;
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
	
	@Autowired
	protected AdbannerService adbannerService;
	
	protected List<Subscribe> list = new ArrayList<Subscribe>();
	protected List<Links> links = new ArrayList<Links>();
	protected CompanyInfo companyInfo = new CompanyInfo();
	protected List<Adbanner> adList = new ArrayList<Adbanner>();
	private static List<String> FIXED_NO = new ArrayList<String>();
	private static Map<String, String> URL_APP = new HashMap<String, String>();//映射app地址
	protected String [] msgs = null;
	protected List<String> msgList = new ArrayList<String>();
	
	static {
		FIXED_NO.addAll(Arrays.asList(new String[] {
				"A001", "A002", "A003", "A022"	
		}));
		//URL_APP此处需要映射app地址
		URL_APP.put("A001", "#productlist&saleType=1");
		URL_APP.put("A002", "#productlist&saleType=0");
		URL_APP.put("A003", "#productlist&saleType=2");
		URL_APP.put("A022", "#purchaselist");
		
		URL_APP.put("A004", "/delivery/index.html");
		URL_APP.put("A005", "/login/indexRegister.html");
		URL_APP.put("A006", "/login/main.html");
		URL_APP.put("A007", "#productcreate&saleType=0");
		URL_APP.put("A008", "#productcreate&saleType=1");
		URL_APP.put("A009", "#productcreate&saleType=2");
		URL_APP.put("A010", "/purchase/indexAdd.html");
		URL_APP.put("A011", "/subscribe/add.html");
		URL_APP.put("A012", "javascript:Global.dialer();");
		URL_APP.put("A013", "/product/listAllForUser.html?product.saleType=0");
		URL_APP.put("A014", "/product/listAllForUser.html?product.saleType=1");
		URL_APP.put("A015", "/product/listAllForUser.html?product.saleType=2");
		URL_APP.put("A016", "/purchase/listAllForUser.html");
		URL_APP.put("A017", "/delivery/listIndex.html");
		URL_APP.put("A018", "/adbanner/list.html");
		URL_APP.put("A019", "/product/listOverheadForUser.html");
		URL_APP.put("A020", "/subscribe/list.html");
		URL_APP.put("A021", "/product/listGroupForUser.html");
	}
	
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

		Map<String, String> params = getRequestMap();
		params.put("adPosition", Adbanner.AdPosition.GUIDE.getValue());
		params.put("today", String.format("%1$tY-%1tm-%1$td %1$tH:%1$tM:%1$tS", new Date()));
		List<Adbanner> adl = adbannerService.findAllByMap(params);
		if (null != adl && !adl.isEmpty()) {
			getAdList().addAll(adl);
		}
		
		guideLinks();
		return SUCCESS;
	}
	
	/**
	 * 首页广告的提取
	 * @return
	 */
	public String guideJsonAdbanner() {
		Map<String, String> params = getRequestMap();
		params.put("adPosition", Adbanner.AdPosition.GUIDE.getValue());
		params.put("today", String.format("%1$tY-%1tm-%1$td %1$tH:%1$tM:%1$tS", new Date()));
		List<Adbanner> adl = adbannerService.findAllByMap(params);
		if (null != adl && !adl.isEmpty()) {
			getAdList().addAll(adl);
		}
		return SUCCESS;
	}
	
	public String guideJsonLinks() {
		Long userId = getUserId();
		List<String> list = new ArrayList<String>();
		if (userId > 0) {
			List<UserLinks> userLinks = getUserLinksService().findAllByUserId(getUserId());
			for (UserLinks ul : userLinks) {
				list.add(ul.getLinkNo());
			}
		} 
		list.addAll(FIXED_NO);
		if (!list.isEmpty()) {
			List<Links> l = getLinksService().findAllByLinkNos(list, getUserLevel());
			if (null != l && !l.isEmpty()) {
				for (Links lks : l) {
					String link = URL_APP.get(lks.getLinkNo());
					if (null == link) {
						link = "#";
					}
					lks.setLink(link);
					getLinks().add(lks);
				}
			}
		}
		if (getLinks().isEmpty()) {
			getLinks().add(new Links());
			getLinks().add(new Links());
			getLinks().add(new Links());
		}
		Links addLink = new Links();
		addLink.setLinkNo("MORE");
		addLink.setLink("#linkspage");
		addLink.setLinkType("add");
		getLinks().add(addLink);
		return SUCCESS;
	}
	
	public String guideLinks() {
		Long userId = getUserId();
		List<String> list = new ArrayList<String>();
		if (userId > 0) {
			List<UserLinks> userLinks = getUserLinksService().findAllByUserId(getUserId());
			for (UserLinks ul : userLinks) {
				list.add(ul.getLinkNo());
			}
		} 
		list.addAll(FIXED_NO);
		if (!list.isEmpty()) {
			List<Links> l = getLinksService().findAllByLinkNos(list, getUserLevel());
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
		List<Links> list = getLinksService().findAllByLinkNos(null, getUserLevel());
		for (Links link : list) {
			if (FIXED_NO.contains(link.getLinkNo())) {
				continue;
			}
			if ("OK".equals(target.get(link.getLinkNo()))) {
				link.setSelected(true);
			} else {
				link.setSelected(false);
			}
			getLinks().add(link);
		}
		return SUCCESS;
	}
	
	public String linkJsonkeys() {
		List<UserLinks> userLinks = getUserLinksService().findAllByUserId(getUserId());
		Map<String, String> target = new HashMap<String, String>();
		if (null != userLinks && !userLinks.isEmpty()) {
			for (UserLinks ul : userLinks) {
				target.put(ul.getLinkNo(), "OK");
			}
		}
		List<Links> list = getLinksService().findAllByLinkNos(null, getUserLevel());
		for (Links link : list) {
			if (FIXED_NO.contains(link.getLinkNo())) {
				continue;
			}
			if ("OK".equals(target.get(link.getLinkNo()))) {
				link.setSelected(true);
			} else {
				link.setSelected(false);
			}
			link.setAuth(null);
			link.setDateCreated(null);
			link.setLastUpdated(null);
			link.setLink(null);
			link.setLinkType(null);
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
	
	public String msgInfo() {
		if (null != getMsgs() && getMsgs().length > 0) {
			for (String msg : getMsgs()) {
				getMsgList().add(Shared.decode(msg));
			}
//			setMsgList(Arrays.asList(getMsgs()));
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
	
	/**
	 * 公司详细信息
	 * @return
	 */
	public String companyJsonInfo() {
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

	public AdbannerService getAdbannerService() {
		return adbannerService;
	}

	public void setAdbannerService(AdbannerService adbannerService) {
		this.adbannerService = adbannerService;
	}

	public List<Links> getLinks() {
		return links;
	}

	public void setLinks(List<Links> links) {
		this.links = links;
	}

	public List<Adbanner> getAdList() {
		return adList;
	}

	public void setAdList(List<Adbanner> adList) {
		this.adList = adList;
	}

	public String[] getMsgs() {
		return msgs;
	}

	public void setMsgs(String[] msgs) {
		this.msgs = msgs;
	}

	public List<String> getMsgList() {
		return msgList;
	}

	public void setMsgList(List<String> msgList) {
		this.msgList = msgList;
	}
	
}
