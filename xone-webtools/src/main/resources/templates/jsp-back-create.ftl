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
		<jsp:include page="common-nav.jsp"></jsp:include>
		<div class="container-fluid">
    		<div class="row-fluid" id="X_bodyContainer">
				<div class="span2">
					<jsp:include page="common-menu.jsp"></jsp:include>
				</div>
				<div class="span10" id="X_contentContainer">
					<div class="row-fluid">
						<ul class="breadcrumb" id="X_breadcrumbs_ul">
							<li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li>
							<li class="active">创建${tableName}</li>
						</ul>
					</div>
					<form class="form-horizontal" method="post" action="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}Save.html">
					<#list tableProperties as p>
						<#if p.autoIncrement == '1'>
						<#else>
							<#if p.columnClassName == "java.util.Date">
						<div class="control-group">
							<label class="control-label" for="${p.javaVarName}">${p.columnComments}</label>
							<div class="controls">
								<input type="text" id="${p.javaVarName}" name="${tableVarName}.${p.javaVarName}" class="Wdate" onclick="WdatePicker()" maxlength="${p.columnDisplaySize}" placeholder="${p.columnComments}">
							</div>
						</div>
							<#else>
						<div class="control-group">
							<label class="control-label" for="${p.javaVarName}">${p.columnComments}</label>
							<div class="controls">
								<input type="text" id="${p.javaVarName}" name="${tableVarName}.${p.javaVarName}" maxlength="${p.columnDisplaySize}" placeholder="${p.columnComments}">
							</div>
						</div>
							</#if>
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
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_${packageName}").addClass("active");
	 });
	</script>
</html>
