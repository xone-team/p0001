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
						<li><a href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}List.html">${tableVarName}列表</a> <span class="divider">/</span></li>
						<li class="active">${tableVarName}详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
					<#list tableProperties as p>
						<tr>
							<td style="width:60px;">${p.columnComments}</td>
						<#if p.columnClassName == "java.util.Date">
							<td><fmt:formatDate value="${r"${"}${tableVarName}.${p.javaVarName}}" pattern="yyyy-MM-dd"/></td>
						<#else>
							<td>${r"${"}${tableVarName}.${p.javaVarName}}</td>
						</#if>
						</tr>
					</#list>
					</tbody>
				</table>
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
