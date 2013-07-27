<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<jsp:include page="commons.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="adbanneruseritem" data-dom-cache="false">
		<style type="text/css">
		td.mylabel {
			width: 80px;
		}
		table.mytable {
			border-collapse: collapse;
			border-spacing: 0;
			border-left: 1px solid #888;
			border-top: 1px solid #888;
		}
		
		.mytable th,td {
			border-right: 1px solid #888;
			border-bottom: 1px solid #888;
			padding: 5px 15px;
		}
		
		table.mytable th {
			font-weight: bold;
		}
		</style>
		<div data-id="myheader" data-role="header" data-backbtn="false" data-tap-toggle="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/adbanner/list.html?_=${identify}" data-icon="check">返回</a>
			<h1>我的广告详情</h1>
			<a href="${pageContext.request.contextPath}/adbanner/item.html?adbanner.id=${adbanner.id}" class="ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content" data-dom-cache="false">
			<ul class="purchase-item-page-view" data-role="listview" data-inset="true" data-mini="true">
				<li data-role="list-divider">广告图片</li>
				<li data-icon="none"><img src="${pageContext.request.contextPath}/assistant/image.html?id=${adbanner.adRefId}" height="100%" width="100%" style="max-width:100%;max-height:100%;"/></li>
				<li data-role="list-divider">广告信息</li>
				<li data-icon="none">
					<table class="mytable" style="width:100%">
						<tr>
							<td class="mylabel">广告类型:</td>
							<td>${adbanner.adTypeName}</td>
						</tr>
						<tr>
							<td class="mylabel">产品编号:</td>
							<td>${adbanner.refId}</td>
						</tr>
						<tr>
							<td class="mylabel" rowspan="2">有&nbsp;&nbsp;效&nbsp;&nbsp;期:</td>
							<td><fmt:formatDate value="${adbanner.adStart}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						<tr>
							<td><fmt:formatDate value="${adbanner.adEnd}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						<tr>
							<td class="mylabel">创建日期:</td>
							<td><fmt:formatDate value="${adbanner.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</table>
				</li>
			</ul>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
