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
					<li><a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a> <span class="divider">/</span></li>
					<li><a href="${pageContext.request.contextPath}/resources/resourcesList.html">resources列表</a> <span class="divider">/</span></li>
					<li class="active">创建resources</li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">编号</td>
							<td>${resources.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">资源名称</td>
							<td>${resources.name}</td>
						</tr>
						<tr>
							<td style="width:60px;">资源类型</td>
							<td>${resources.resourceType}</td>
						</tr>
						<tr>
							<td style="width:60px;">优先级</td>
							<td>${resources.priority}</td>
						</tr>
						<tr>
							<td style="width:60px;">资源地址</td>
							<td>${resources.resourceUrl}</td>
						</tr>
						<tr>
							<td style="width:60px;">备注</td>
							<td>${resources.remark}</td>
						</tr>
						<tr>
							<td style="width:60px;">可用标识</td>
							<td>${resources.enable}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${resources.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建时间</td>
							<td>${resources.dateCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${resources.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td>${resources.lastUpdated}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
