package com.xone.action.back.companyinfo;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.CompanyInfo;
import com.xone.model.hibernate.support.Pagination;
import com.xone.model.utils.MyDateUtils;
import com.xone.service.app.CompanyInfoService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class CompanyInfoBackAction extends Action {
	
	@Autowired
	protected CompanyInfoService companyInfoService;
	protected CompanyInfo companyInfo = new CompanyInfo();
	protected List<CompanyInfo> list = new ArrayList<CompanyInfo>();
	protected Pagination pagination = new Pagination();
	
	public String companyInfoList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		MyBeanUtils.copyPropertiesToMap(getCompanyInfo(), params, new CopyRules() {
			@Override
			public boolean myCopyRules(Object value) {
				return null != value;
			}
			
		}, new AssignRules() {
			@Override
			public String myAssignRules(Object value) {
				if (null != value && value instanceof Date) {
					return MyDateUtils.format((Date)value, "yyyy-MM-dd");
				}
				return value.toString();
			}
		}, null);
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getCompanyInfoService().findByParams(params);
		setPagination(p);
		return SUCCESS;
	}
	
	public String companyInfoItem() throws Exception {
		CompanyInfo entity = getCompanyInfoService().findById(getCompanyInfo().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setCompanyInfo(entity);
		return SUCCESS;
	}
	
	public String companyInfoCreate() throws Exception {
		return SUCCESS;
	}
	
	public String companyInfoEdit() throws Exception {
		CompanyInfo entity = getCompanyInfoService().findById(getCompanyInfo().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setCompanyInfo(entity);
		return SUCCESS;
	}
	
	public String companyInfoSave() throws Exception {
		setCompanyInfo(getCompanyInfoService().save(getCompanyInfo()));
		return SUCCESS;
	}
	
	public String companyInfoUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			CompanyInfo entity = getCompanyInfoService().findById(getCompanyInfo().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getCompanyInfoService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			CompanyInfo entity = getCompanyInfoService().findById(getCompanyInfo().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getCompanyInfo(), entity, CompanyInfo.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			setCompanyInfo(getCompanyInfoService().update(entity));
		}
		return SUCCESS;
	}

	public CompanyInfoService getCompanyInfoService() {
		return companyInfoService;
	}

	public void setCompanyInfoService(CompanyInfoService companyInfoService) {
		this.companyInfoService = companyInfoService;
	}

	public List<CompanyInfo> getList() {
		return list;
	}

	public void setList(List<CompanyInfo> list) {
		this.list = list;
	}

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
