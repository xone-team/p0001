<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib" %>
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
				<jsp:include page="user-center-menu.jsp"><jsp:param value="3" name="menuindex"/></jsp:include>
			</div>
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a> <span class="divider">/</span></li>
					<li class="active">用户列表</li>
					<li class="pull-right"><a href="${pageContext.request.contextPath}/user/userCreate.html" class="btn btn-mini">创建用户</a></li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<thead>
						<th>用户编号</th>
						<th>用户名</th>
						<th>密码</th>
						<th>申请人</th>
						<th>申请时间</th>
						<th>审核人</th>
						<th>审核时间</th>
						<th>删除标识</th>
						<th>创建人</th>
						<th>创建时间</th>
						<th>更新人</th>
						<th>更新时间</th>
						<th>昵称</th>
						<th>手机号码</th>
						<th>联系人</th>
						<th>腾讯号码</th>
						<th>电子邮箱</th>
						<th>联系地址</th>
						<th>认证标识</th>
						<th>用户级别</th>
					</thead>
					<tbody>
					<c:forEach var="item" items="${pagination.list}">
					<tr>
						<td>${item.id}</td>
						<td>${item.username}</td>
						<td>${item.password}</td>
						<td>${item.userApply}</td>
						<td>${item.dateApply}</td>
						<td>${item.userCheck}</td>
						<td>${item.dateCheck}</td>
						<td>${item.flagDeleted}</td>
						<td>${item.userCreated}</td>
						<td>${item.dateCreated}</td>
						<td>${item.userUpdated}</td>
						<td>${item.lastUpdated}</td>
						<td>${item.nickName}</td>
						<td>${item.cellphone}</td>
						<td>${item.contactor}</td>
						<td>${item.qq}</td>
						<td>${item.email}</td>
						<td>${item.address}</td>
						<td>${item.credit}</td>
						<td>${item.userLevel}</td>
						<td>
							<a href="${pageContext.request.contextPath}/user/userEdit.html?roles.id=${item.id}" class="btn btn-mini">编辑</a>
							<a href="${pageContext.request.contextPath}/user/userItem.html?roles.id=${item.id}" class="btn btn-mini">详细</a>
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<x:page href="${pageContext.request.contextPath}/user/userList.html" pagination="${pagination}"/>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
