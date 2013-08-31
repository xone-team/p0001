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
					<li><a href="${pageContext.request.contextPath}/rolesresources/rolesResourcesList.html">rolesResources列表</a> <span class="divider">/</span></li>
					<li class="active">rolesResources编辑</li>
				</ul>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/rolesResourcesUpdate.html">
					<div class="control-group">
						<label class="control-label" for="id">编号</label>
						<div class="controls">
							<input type="text" id="id" name="rolesResources.id" value="${rolesResources.id}" maxlength="20" placeholder="编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="resourceId">资源编号</label>
						<div class="controls">
							<input type="text" id="resourceId" name="rolesResources.resourceId" value="${rolesResources.resourceId}" maxlength="20" placeholder="资源编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="roleId">角色编号</label>
						<div class="controls">
							<input type="text" id="roleId" name="rolesResources.roleId" value="${rolesResources.roleId}" maxlength="20" placeholder="角色编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="enable">可用标识</label>
						<div class="controls">
							<input type="text" id="enable" name="rolesResources.enable" value="${rolesResources.enable}" maxlength="1" placeholder="可用标识">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人</label>
						<div class="controls">
							<input type="text" id="userCreated" name="rolesResources.userCreated" value="${rolesResources.userCreated}" maxlength="20" placeholder="创建人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建时间</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="rolesResources.dateCreated" value="${rolesResources.dateCreated}" maxlength="19" placeholder="创建时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="rolesResources.userUpdated" value="${rolesResources.userUpdated}" maxlength="20" placeholder="更新人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新时间</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="rolesResources.lastUpdated" value="${rolesResources.lastUpdated}" maxlength="19" placeholder="更新时间">
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
