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
					<li><a href="${r"${pageContext.request.contextPath}"}/admin/welcome.html">用户中心</a> <span class="divider">/</span></li>
					<li><a href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}List.html">${tableVarName}列表</a> <span class="divider">/</span></li>
					<li class="active">创建${tableVarName}</li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<tbody>
					<#list tableProperties as p>
						<tr>
							<td style="width:60px;">${p.columnComments}</td>
							<td>${r"${"}${tableVarName}.${p.javaVarName}}</td>
						</tr>
					</#list>
					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
