package com.xone.action.back.category;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Category;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.CategoryService;
import com.xone.service.app.utils.MyBeanUtils;
import com.xone.service.app.utils.MyBeanUtils.AssignRules;
import com.xone.service.app.utils.MyBeanUtils.CopyRules;

public class CategoryBackAction extends Action {
	
    private static final long serialVersionUID = -983501735203902286L;
    @Autowired
	protected CategoryService categoryService;
	protected Category category = new Category();
	protected List<Category> list = new ArrayList<Category>();
	protected Pagination pagination = new Pagination();
	
	public String categoryList() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		MyBeanUtils.copyPropertiesToMap(getCategory(), params, new CopyRules() {
			@Override
			public boolean myCopyRules(Object value) {
				return null != value;
			}
			
		}, new AssignRules() {
			@Override
			public String myAssignRules(Object value) {
				return value.toString();
			}
		}, null);
		params.put("pageSize", String.valueOf(getPagination().getPageSize()));
		params.put("pageNo", String.valueOf(getPagination().getPageNo()));
		Pagination p = getCategoryService().findByParams(params);
//		List<Category> l = getCategoryService().findAllByMap(params);
//		if (null != l && !l.isEmpty()) {
//			getList().addAll(l);
//		}
		setPagination(p);
		return SUCCESS;
	}
	
	public String categoryItem() throws Exception {
		Category entity = getCategoryService().findById(getCategory().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setCategory(entity);
		return SUCCESS;
	}
	
	public String categoryCreate() throws Exception {
		return SUCCESS;
	}
	
	public String categoryEdit() throws Exception {
		Category entity = getCategoryService().findById(getCategory().getId());
		if (null == entity || null == entity.getId()) {
			return ERROR;
		}
		setCategory(entity);
		return SUCCESS;
	}
	
	public String categorySave() throws Exception {
        category.setUserCreated(getUserId());
        category.setUserUpdated(getUserId());
		setCategory(getCategoryService().save(getCategory()));
		return SUCCESS;
	}
	
	public String categoryUpdate() throws Exception {
		if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
			return ERROR;
		}
		String opt = null == getRequestMap().get("delete") ? getRequestMap().get("update") : getRequestMap().get("delete");
		if (!StringUtils.isBlank(opt) && "delete".equals(opt)) {
			Category entity = getCategoryService().findById(getCategory().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			getCategoryService().delete(entity);
			return "list";
		}
		if (!StringUtils.isBlank(opt) && "update".equals(opt)) {
			Category entity = getCategoryService().findById(getCategory().getId());
			if (null == entity || null == entity.getId()) {
				return ERROR;
			}
			MyBeanUtils.copyProperties(getCategory(), entity, Category.class, null, new CopyRules() {
				@Override
				public boolean myCopyRules(Object value) {
					return (null != value);
				}
			});
			category.setUserUpdated(getUserId());
			setCategory(getCategoryService().update(entity));
		}
		return SUCCESS;
	}
//	
//    public String categoryDelete() throws Exception {
//        Category entity = getCategoryService().findById(getCategory().getId());
//        categoryService.delete(entity);
//        return SUCCESS;
//    }

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public List<Category> getList() {
		return list;
	}

	public void setList(List<Category> list) {
		this.list = list;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
