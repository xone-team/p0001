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
					<li><a href="${pageContext.request.contextPath}/imageuploaded/imageUploadedList.html">imageUploaded列表</a> <span class="divider">/</span></li>
					<li class="active">imageUploaded编辑</li>
				</ul>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/imageUploadedUpdate.html">
					<div class="control-group">
						<label class="control-label" for="id">编号</label>
						<div class="controls">
							<input type="text" id="id" name="imageUploaded.id" value="${imageUploaded.id}" maxlength="20" placeholder="编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="refId">相关编号</label>
						<div class="controls">
							<input type="text" id="refId" name="imageUploaded.refId" value="${imageUploaded.refId}" maxlength="20" placeholder="相关编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="refType">相关类型</label>
						<div class="controls">
							<input type="text" id="refType" name="imageUploaded.refType" value="${imageUploaded.refType}" maxlength="2" placeholder="相关类型">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="imageType">图片类型</label>
						<div class="controls">
							<input type="text" id="imageType" name="imageUploaded.imageType" value="${imageUploaded.imageType}" maxlength="20" placeholder="图片类型">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人</label>
						<div class="controls">
							<input type="text" id="userCreated" name="imageUploaded.userCreated" value="${imageUploaded.userCreated}" maxlength="20" placeholder="创建人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建时间</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="imageUploaded.dateCreated" value="${imageUploaded.dateCreated}" maxlength="19" placeholder="创建时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="imageUploaded.userUpdated" value="${imageUploaded.userUpdated}" maxlength="20" placeholder="更新人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新时间</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="imageUploaded.lastUpdated" value="${imageUploaded.lastUpdated}" maxlength="19" placeholder="更新时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="image">名称</label>
						<div class="controls">
							<input type="text" id="image" name="imageUploaded.image" value="${imageUploaded.image}" maxlength="64" placeholder="名称">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="flagDeleted">删除标识</label>
						<div class="controls">
							<input type="text" id="flagDeleted" name="imageUploaded.flagDeleted" value="${imageUploaded.flagDeleted}" maxlength="1" placeholder="删除标识">
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
