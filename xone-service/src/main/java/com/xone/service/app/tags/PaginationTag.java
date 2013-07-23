package com.xone.service.app.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;

import com.xone.model.hibernate.support.Pagination;

public class PaginationTag extends TagSupport {

	private static final long serialVersionUID = 2037407896755085349L;
	
	protected Object pagination;
	protected String href;
	protected String name;

	public Object getPagination() {
		return pagination;
	}

	public void setPagination(Object pagination) {
		this.pagination = pagination;
	}

	public String getHref() {
		if (null == href) {
			return "";
		}
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getName() {
		if (StringUtils.isBlank(name)) {
			return "pagination";
		}
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	protected String page(Pagination p, int offset) {
		String tag = "?";
		if (getHref().indexOf("?") > -1) {
			tag = "&";
		}
//		String href = getHref();
//		if (href.startsWith("/")) {
//			href = this.pageContext.getRequest()
//		}
		return getHref() + tag + getName() + ".pageNo=" + offset + "&" + getName() + ".pageSize=" + p.getPageSize();
	}

	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = this.pageContext.getOut();
			if (getPagination() == null || (getPagination() instanceof String) || !(getPagination() instanceof Pagination)) {
				return SKIP_BODY;
			}
			Pagination p = (Pagination)getPagination();
			StringBuffer buffer = new StringBuffer();
			buffer.append("<div class=\"pagination pagination-centered\">");
			buffer.append("<ul>");
			buffer.append("<li><a href=\"");
			buffer.append(page(p, p.getPrePage()));
			buffer.append("\">上一页</a></li>");
			int totalPage = p.getTotalPage();
			int pageNo = p.getPageNo();
			for (int i = pageNo; i <= totalPage; i ++) {
				buffer.append("<li><a href=\"");
				buffer.append(page(p, i));
				buffer.append("\">");
				buffer.append(i);
				buffer.append("</a></li>");
				if (i > pageNo + 5) {
					buffer.append("<li><a href=\"#");
					buffer.append("\">...</a></li>");
					break;
				}
			}
			buffer.append("<li><a href=\"");
			buffer.append(page(p, p.getNextPage()));
			buffer.append("\">下一页</a></li>");
			buffer.append("</ul>");
			buffer.append("</div>");
			out.println(buffer.toString());
		} catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		super.release();
		this.setPagination(null);
		this.setHref(null);
	}

}
