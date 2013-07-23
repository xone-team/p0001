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
				<jsp:include page="user-center-menu.jsp"><jsp:param value="5" name="menuindex"/></jsp:include>
			</div>
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a> <span class="divider">/</span></li>
					<li class="active">product列表</li>
					<li class="pull-right"><a href="${pageContext.request.contextPath}/product/productCreate.html" class="btn btn-mini">创建product</a></li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<thead>
						<th>编号</th>
						<th>产品名称</th>
						<th>产品类型</th>
						<th>销售类型</th>
						<th>产品价格</th>
						<th>产品数量</th>
						<th>有效期</th>
						<th>产品产地</th>
						<th>产品属地</th>
						<th>产品描述</th>
						<th>删除标识</th>
						<th>申请人</th>
						<th>申请时间</th>
						<th>审核人</th>
						<th>审核时间</th>
						<th>创建人</th>
						<th>创建时间</th>
						<th>更新人</th>
						<th>更新时间</th>
					</thead>
					<tbody>
					<c:forEach var="item" items="${pagination.list}">
					<tr>
						<td>${item.id}</td>
						<td>${item.productName}</td>
						<td>${item.productType}</td>
						<td>${item.saleType}</td>
						<td>${item.productPrice}</td>
						<td>${item.productNum}</td>
						<td>${item.productValid}</td>
						<td>${item.productAddress}</td>
						<td>${item.productLocation}</td>
						<td>${item.productDesc}</td>
						<td>${item.flagDeleted}</td>
						<td>${item.userApply}</td>
						<td>${item.dateApply}</td>
						<td>${item.userCheck}</td>
						<td>${item.dateCheck}</td>
						<td>${item.userCreated}</td>
						<td>${item.dateCreated}</td>
						<td>${item.userUpdated}</td>
						<td>${item.lastUpdated}</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productEdit.html?roles.id=${item.id}" class="btn btn-mini">编辑</a>
							<a href="${pageContext.request.contextPath}/product/productItem.html?roles.id=${item.id}" class="btn btn-mini">详细</a>
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<x:page href="${pageContext.request.contextPath}/product/productList.html" pagination="${pagination}"/>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
