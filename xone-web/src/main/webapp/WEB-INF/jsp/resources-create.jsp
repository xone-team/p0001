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
					<li class="active">创建Resources</li>
				</ul>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/resources/resourcesSave.html">
					<div class="control-group">
						<label class="control-label" for="id">编号</label>
						<div class="controls">
							<input type="text" id="id" name="resources.id" maxlength="20" placeholder="编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="name">资源名称</label>
						<div class="controls">
							<input type="text" id="name" name="resources.name" maxlength="255" placeholder="资源名称">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="resourceType">资源类型</label>
						<div class="controls">
							<input type="text" id="resourceType" name="resources.resourceType" maxlength="11" placeholder="资源类型">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="priority">优先级</label>
						<div class="controls">
							<input type="text" id="priority" name="resources.priority" maxlength="11" placeholder="优先级">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="resourceUrl">资源地址</label>
						<div class="controls">
							<input type="text" id="resourceUrl" name="resources.resourceUrl" maxlength="255" placeholder="资源地址">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="remark">备注</label>
						<div class="controls">
							<input type="text" id="remark" name="resources.remark" maxlength="1024" placeholder="备注">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="enable">可用标识</label>
						<div class="controls">
							<input type="text" id="enable" name="resources.enable" maxlength="1" placeholder="可用标识">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人</label>
						<div class="controls">
							<input type="text" id="userCreated" name="resources.userCreated" maxlength="20" placeholder="创建人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建时间</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="resources.dateCreated" maxlength="19" placeholder="创建时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="resources.userUpdated" maxlength="20" placeholder="更新人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新时间</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="resources.lastUpdated" maxlength="19" placeholder="更新时间">
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
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
