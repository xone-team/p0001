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
					<li id="X_menu_li_person" class="active"><a href="index.html">用户</a></li>
					<li id="X_menu_li_role"><a href="${pageContext.request.contextPath}/roles/rolesList.html">角色</a></li>
					<li id="X_menu_li_resource"><a href="${pageContext.request.contextPath}/resources/resourcesList.html">资源</a></li>
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
					<li id="X_menu_li_product"><a href="product-list.html">产品</a></li>
					<li id="X_menu_li_want"><a href="want-list.html">求购</a></li>
					<li id="X_menu_li_category"><a href="category-list.html">分类</a></li>
					<li id="X_menu_li_top"><a href="top-list.html">置顶</a></li>
					<li id="X_menu_li_bill"><a href="${pageContext.request.contextPath}/adbanner/adbannerList.html">广告</a></li>
					<li id="X_menu_li_delivery"><a href="delivery-list.html">物流</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div>
		<ul class="nav nav-list">
			<li id="X_menu_li_config"><a href="config-list.html">系统设置</a></li>
		</ul>
	</div>
</div>