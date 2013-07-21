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
	<jsp:include page="common-nav.jsp"><jsp:param value="5" name="offset"/></jsp:include>
	<div class="container">
		<div class="row">
			<div class="span3">
				<jsp:include page="user-center-menu.jsp"><jsp:param value="5" name="menuindex"/></jsp:include>
			</div>
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a> <span class="divider">/</span></li>
					<li><a href="${pageContext.request.contextPath}/admin/rolesList.html">角色列表</a> <span class="divider">/</span></li>
					<li class="active">创建角色</li>
				</ul>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/rolesUpdate.html">
					<input type="hidden" name="roles.id" value="${roles.id}" />
					<div class="control-group">
						<label class="control-label" for="rolesName">角色名称</label>
						<div class="controls">
							<input type="text" id="rolesName" name="roles.name" value="${roles.name}" placeholder="角色名称">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="rolesRemark">角色名称</label>
						<div class="controls">
							<input type="text" id="rolesRemark" name="roles.remark" value="${roles.remark}" placeholder="角色备注">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" name="update" value="update" class="btn">提交更新</button>
							<button type="submit" name="delete" value="delete" class="btn">删除角色</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
