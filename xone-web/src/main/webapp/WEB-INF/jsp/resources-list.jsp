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
				<jsp:include page="user-center-menu.jsp"><jsp:param value="4" name="menuindex"/></jsp:include>
			</div>
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="#">用户中心</a> <span class="divider">/</span></li>
					<li class="active">用户列表</li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<thead>
						<th>编号</th>
						<th>名称</th>
						<th>类型</th>
						<th>优先级</th>
						<th>URL</th>
						<th>备注</th>
						<th>创建日期</th>
					</thead>
					<tbody>
					<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>${item.resourceType}</td>
						<td>${item.priority}</td>
						<td>${item.resourceUrl}</td>
						<td><p>${item.remark}</p></td>
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
