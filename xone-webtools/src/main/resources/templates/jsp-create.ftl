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
					<li class="active">创建${tableName}</li>
				</ul>
				<form class="form-horizontal" method="post" action="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}Save.html">
				<#list tableProperties as p>
					<#if p.autoIncrement == '1'>
					<#else>
					<div class="control-group">
						<label class="control-label" for="${p.javaVarName}">${p.columnComments}</label>
						<div class="controls">
							<input type="text" id="${p.javaVarName}" name="${tableVarName}.${p.javaVarName}" maxlength="${p.columnDisplaySize}" placeholder="${p.columnComments}">
						</div>
					</div>
					</#if>
				</#list>
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
