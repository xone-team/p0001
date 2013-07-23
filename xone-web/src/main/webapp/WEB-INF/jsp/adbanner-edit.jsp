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
					<li><a href="${pageContext.request.contextPath}/adbanner/adbannerList.html">adbanner列表</a> <span class="divider">/</span></li>
					<li class="active">adbanner编辑</li>
				</ul>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/adbannerUpdate.html">
					<div class="control-group">
						<label class="control-label" for="id">编号</label>
						<div class="controls">
							<input type="text" id="id" name="adbanner.id" value="${adbanner.id}" maxlength="20" placeholder="编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="refId">相关编号</label>
						<div class="controls">
							<input type="text" id="refId" name="adbanner.refId" value="${adbanner.refId}" maxlength="20" placeholder="相关编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="adType">广告类型</label>
						<div class="controls">
							<input type="text" id="adType" name="adbanner.adType" value="${adbanner.adType}" maxlength="2" placeholder="广告类型">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="adRefId">相关编号</label>
						<div class="controls">
							<input type="text" id="adRefId" name="adbanner.adRefId" value="${adbanner.adRefId}" maxlength="20" placeholder="相关编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="adStart">开始时间</label>
						<div class="controls">
							<input type="text" id="adStart" name="adbanner.adStart" value="${adbanner.adStart}" maxlength="19" placeholder="开始时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="adEnd">结束时间</label>
						<div class="controls">
							<input type="text" id="adEnd" name="adbanner.adEnd" value="${adbanner.adEnd}" maxlength="19" placeholder="结束时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userId">用户编号</label>
						<div class="controls">
							<input type="text" id="userId" name="adbanner.userId" value="${adbanner.userId}" maxlength="20" placeholder="用户编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="flagDeleted">删除标识</label>
						<div class="controls">
							<input type="text" id="flagDeleted" name="adbanner.flagDeleted" value="${adbanner.flagDeleted}" maxlength="1" placeholder="删除标识">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userApply">申请人</label>
						<div class="controls">
							<input type="text" id="userApply" name="adbanner.userApply" value="${adbanner.userApply}" maxlength="20" placeholder="申请人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateApply">申请时间</label>
						<div class="controls">
							<input type="text" id="dateApply" name="adbanner.dateApply" value="${adbanner.dateApply}" maxlength="19" placeholder="申请时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCheck">审核人</label>
						<div class="controls">
							<input type="text" id="userCheck" name="adbanner.userCheck" value="${adbanner.userCheck}" maxlength="20" placeholder="审核人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCheck">审核时间</label>
						<div class="controls">
							<input type="text" id="dateCheck" name="adbanner.dateCheck" value="${adbanner.dateCheck}" maxlength="19" placeholder="审核时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人</label>
						<div class="controls">
							<input type="text" id="userCreated" name="adbanner.userCreated" value="${adbanner.userCreated}" maxlength="20" placeholder="创建人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建时间</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="adbanner.dateCreated" value="${adbanner.dateCreated}" maxlength="19" placeholder="创建时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="adbanner.userUpdated" value="${adbanner.userUpdated}" maxlength="20" placeholder="更新人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新时间</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="adbanner.lastUpdated" value="${adbanner.lastUpdated}" maxlength="19" placeholder="更新时间">
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
