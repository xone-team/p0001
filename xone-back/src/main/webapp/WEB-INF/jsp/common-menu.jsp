<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="accordion" id="X_menu_container">
	<div class="accordion-group">
		<div class="accordion-heading">
			<div class="accordion-toggle nav-header" data-toggle="collapse"
				data-target="#X_menu_collapse_personManagement">用户管理</div>
		</div>
		<div id="X_menu_collapse_personManagement"
			class="accordion-body in collapse" style="height: auto;">
			<div class="accordion-inner">
				<ul class="nav nav-list" id="X_menu_ul_personManagement">
					<li id="X_menu_li_person"><a href="${pageContext.request.contextPath}/person/personList.html">用户</a></li>
					<li id="X_menu_li_roles"><a href="${pageContext.request.contextPath}/roles/rolesList.html">角色</a></li>
					<li id="X_menu_li_resources"><a href="${pageContext.request.contextPath}/resources/resourcesList.html">资源</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
			<div class="accordion-toggle nav-header" data-toggle="collapse"
				data-target="#X_menu_collapse_productManagement">产品管理</div>
		</div>
		<div id="X_menu_collapse_productManagement"
			class="accordion-body in collapse" style="height: auto;">
			<div class="accordion-inner">
				<ul class="nav nav-list" id="X_menu_ul_productManagement">
					<li id="X_menu_li_product"><a href="${pageContext.request.contextPath}/product/productList.html">产品</a></li>
					<li id="X_menu_li_purchase"><a href="${pageContext.request.contextPath}/purchase/purchaseList.html">求购</a></li>
					<li id="X_menu_li_category"><a href="${pageContext.request.contextPath}/category/categoryList.html">分类</a></li>
					<li id="X_menu_li_topad"><a href="${pageContext.request.contextPath}/topad/topadList.html">置顶</a></li>
					<li id="X_menu_li_adbanner"><a href="${pageContext.request.contextPath}/adbanner/adbannerList.html">广告</a></li>
					<li id="X_menu_li_delivery"><a href="${pageContext.request.contextPath}/delivery/deliveryList.html">物流</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div>
		<ul class="nav nav-list">
			<li id="X_menu_li_config"><a href="${pageContext.request.contextPath}/config/configList.html">系统设置</a></li>
		</ul>
	</div>
</div>
