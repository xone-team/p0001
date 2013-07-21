<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
.clearmarginbottom {
	margin-bottom:2px;
}
</style>
<div class="accordion">
	<div class="accordion-group">
		<div class="accordion-heading">
			<div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#${identify}_1">用户中心</div>
		</div>
		<div id="${identify}_1" class="accordion-body in collapse" style="height: auto;">
			<div class="accordion-inner">
				<ul class="nav nav-list">
					<li id="menu_user" <c:if test="${param.menuindex == '1'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/admin/welcome.html" class="well well-small clearmarginbottom">用户信息</a></li>
					<li id="menu_user_update" <c:if test="${param.menuindex == '2'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">用户更新</a></li>
					<li id="menu_user_list" <c:if test="${param.menuindex == '3'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/admin/userList.html" class="well well-small clearmarginbottom">用户列表</a></li>
					<li id="menu_resources_list" <c:if test="${param.menuindex == '4'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/admin/resourcesList.html" class="well well-small clearmarginbottom">资源列表</a></li>
					<li id="menu_roles_list" <c:if test="${param.menuindex == '5'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/admin/rolesList.html" class="well well-small clearmarginbottom">角色列表</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
			<div class="accordion-toggle nav-header collapsed" data-toggle="collapse" data-target="#${identify}_2">我的售卖发布</div>
		</div>
		<div id="${identify}_2" class="accordion-body collapse" style="height: 0px;">
			<div class="accordion-inner">
				<ul class="nav nav-list">
					<li <c:if test="${param.menuindex == '6'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">产品发布</a></li>
					<li <c:if test="${param.menuindex == '7'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">促销发布</a></li>
					<li <c:if test="${param.menuindex == '8'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">组团发布</a></li>
					<li <c:if test="${param.menuindex == '9'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">产品发布列表</a></li>
					<li <c:if test="${param.menuindex == '10'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">促销发布列表</a></li>
					<li <c:if test="${param.menuindex == '11'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">组团发布列表</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
			<div class="accordion-toggle nav-header collapsed" data-toggle="collapse" data-target="#${identify}_3">我的购买发布</div>
		</div>
		<div id="${identify}_3" class="accordion-body collapse" style="height: 0px;">
			<div class="accordion-inner">
				<ul class="nav nav-list">
					<li <c:if test="${param.menuindex == '12'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">求购发布</a></li>
					<li <c:if test="${param.menuindex == '13'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">求购发布列表</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
			<div class="accordion-toggle nav-header collapsed" data-toggle="collapse" data-target="#${identify}_4">我的其它服务</div>
		</div>
		<div id="${identify}_4" class="accordion-body collapse" style="height: 0px;">
			<div class="accordion-inner">
				<ul class="nav nav-list">
					<li <c:if test="${param.menuindex == '14'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">物流配送</a></li>
					<li <c:if test="${param.menuindex == '15'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">筛选订阅</a></li>
					<li <c:if test="${param.menuindex == '16'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">物流配送列表</a></li>
					<li <c:if test="${param.menuindex == '17'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">我的广告列表</a></li>
					<li <c:if test="${param.menuindex == '18'}">class="active"</c:if>><a href="#" class="well well-small clearmarginbottom">我的订阅列表</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>