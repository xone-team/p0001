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
					<li class="active">companyInfo列表</li>
					<li class="pull-right"><a href="${pageContext.request.contextPath}/companyinfo/companyInfoCreate.html" class="btn btn-mini">创建companyInfo</a></li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<thead>
						<th>主键</th>
						<th>公司名称</th>
						<th>公司地址</th>
						<th>公司电话</th>
						<th>移动电话</th>
						<th>联系人</th>
						<th>公司传真</th>
						<th>公司简介</th>
						<th>关联用户</th>
						<th>创建人</th>
						<th>创建日期</th>
						<th>更新人</th>
						<th>更新日期</th>
					</thead>
					<tbody>
					<c:forEach var="item" items="${pagination.list}">
					<tr>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>${item.address}</td>
						<td>${item.tel}</td>
						<td>${item.mobile}</td>
						<td>${item.contact}</td>
						<td>${item.fax}</td>
						<td>${item.intro}</td>
						<td>${item.userId}</td>
						<td>${item.userCreated}</td>
						<td>${item.dateCreated}</td>
						<td>${item.userUpdated}</td>
						<td>${item.lastUpdated}</td>
						<td>
							<a href="${pageContext.request.contextPath}/companyinfo/companyInfoEdit.html?companyInfo.id=${item.id}" class="btn btn-mini">编辑</a>
							<a href="${pageContext.request.contextPath}/companyinfo/companyInfoItem.html?companyInfo.id=${item.id}" class="btn btn-mini">详细</a>
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<x:page href="${pageContext.request.contextPath}/companyinfo/companyInfoList.html" pagination="${pagination}"/>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
