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
					<li><a href="${r"${pageContext.request.contextPath}"}/admin/welcome.html">用户中心</a> <span class="divider">/</span></li>
					<li class="active">${tableVarName}列表</li>
					<li class="pull-right"><a href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}Create.html" class="btn btn-mini">创建${tableVarName}</a></li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<thead>
					<#list tableProperties as p>
						<th>${p.columnComments}</th>
					</#list>
					</thead>
					<tbody>
					<c:forEach var="item" items="${r"${pagination.list}"}">
					<tr>
					<#list tableProperties as p>
						<td>${r"${"}item.${p.javaVarName}}</td>
					</#list>
						<td>
							<a href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}Edit.html?roles.id=${r"${item.id}"}" class="btn btn-mini">编辑</a>
							<a href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}Item.html?roles.id=${r"${item.id}"}" class="btn btn-mini">详细</a>
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<x:page href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}List.html" pagination="${r"${pagination}"}"/>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
