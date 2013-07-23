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
				<jsp:include page="user-center-menu.jsp"><jsp:param value="3" name="menuindex"/></jsp:include>
			</div>
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="#">用户中心</a> <span class="divider">/</span></li>
					<li class="active">用户列表</li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<thead>
						<th>用户名</th>
						<th>昵　称</th>
						<th>手　机</th>
						<th>联系人</th>
						<th>信　誉</th>
						<th>级　别</th>
						<th>QQ</th>
						<th>邮　箱</th>
						<th>地　址</th>
						<th>创建日期</th>
					</thead>
					<tbody>
					<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.username}</td>
						<td>${item.nickName}</td>
						<td>${item.cellphone}</td>
						<td>${item.contactor}</td>
						<td><c:choose><c:when test="${item.credit == '1'}">已认证</c:when><c:otherwise>未认证</c:otherwise></c:choose></td>
						<td>${item.userLevel}</td>
						<td>${item.qq}</td>
						<td>${item.email}</td>
						<td>${item.address}</td>
						<td>${item.dateCreated}</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="pagination pagination-centered">
				  <ul>
				    <li><a href="#" class="disabled">上一页</a></li>
				    <li><a href="#" class="active">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#">下一页</a></li>
				  </ul>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
