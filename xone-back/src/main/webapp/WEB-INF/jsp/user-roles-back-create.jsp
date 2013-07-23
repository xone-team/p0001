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
							<li class="active">创建UserRoles</li>
						</ul>
					</div>
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/userroles/userRolesSave.html">
						<div class="control-group">
							<label class="control-label" for="id">编号</label>
							<div class="controls">
								<input type="text" id="id" name="userRoles.id" maxlength="20" placeholder="编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userId">用户编号</label>
							<div class="controls">
								<input type="text" id="userId" name="userRoles.userId" maxlength="20" placeholder="用户编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="roleId">角色编号</label>
							<div class="controls">
								<input type="text" id="roleId" name="userRoles.roleId" maxlength="20" placeholder="角色编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="enable">可用标识</label>
							<div class="controls">
								<input type="text" id="enable" name="userRoles.enable" maxlength="1" placeholder="可用标识">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userCreated">创建人</label>
							<div class="controls">
								<input type="text" id="userCreated" name="userRoles.userCreated" maxlength="20" placeholder="创建人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="dateCreated">创建时间</label>
							<div class="controls">
								<input type="text" id="dateCreated" name="userRoles.dateCreated" maxlength="19" placeholder="创建时间">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userUpdated">更新人</label>
							<div class="controls">
								<input type="text" id="userUpdated" name="userRoles.userUpdated" maxlength="20" placeholder="更新人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="lastUpdated">更新时间</label>
							<div class="controls">
								<input type="text" id="lastUpdated" name="userRoles.lastUpdated" maxlength="19" placeholder="更新时间">
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">提交创建</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
