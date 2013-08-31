<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户中心</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="common-header.jsp"></jsp:include>
	</head>
	<body>
		<jsp:include page="common-nav.jsp"></jsp:include>
		<div class="container-fluid">
    		<div class="row-fluid" id="X_bodyContainer">
				<div class="span2">
					<jsp:include page="common-menu.jsp"></jsp:include>
				</div>
				<div class="span10" id="X_contentContainer">
				<div class="row-fluid">
					<ul class="breadcrumb" id="X_breadcrumbs_ul">
						<li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li>
						<li><a href="${pageContext.request.contextPath}/roles/rolesList.html">角色列表</a> <span class="divider">/</span></li>
						<li class="active">角色详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">编号</td>
							<td>${roles.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">角色名称</td>
							<td>${roles.name}</td>
						</tr>
						<tr>
							<td style="width:60px;">角色备注</td>
							<td>${roles.remark}</td>
						</tr>
						<tr>
							<td style="width:60px;">可用标识</td>
							<td><c:forEach items="${enable}" var="it">
                                    <c:if test="${it.value == roles.enable}">${it.name}</c:if>
                                </c:forEach></td>
						</tr>
						<tr>
							<td style="width:60px;">创建时间</td>
							<td><fmt:formatDate value="${roles.dateCreated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td><fmt:formatDate value="${roles.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_roles").addClass("active");
	 });
	</script>
</html>
