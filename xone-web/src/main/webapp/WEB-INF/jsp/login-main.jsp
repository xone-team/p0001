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
<!-- 		<meta name="author" content=""> -->
<!-- 		<meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
		<jsp:include page="common-header.jsp"></jsp:include>
		<style type="text/css">
		.clearmarginbottom {
			margin-bottom:2px;
		}
		</style>
	</head>
	<body>
	<jsp:include page="common-nav.jsp"><jsp:param value="5" name="offset"/></jsp:include>
	<div class="container">
		<div class="row">
			<div class="span3">
				<jsp:include page="user-center-menu.jsp"><jsp:param value="1" name="menuindex"/></jsp:include>
			</div>
			<div class="span9">
				<table class="table table-bordered" style="width:100%">
					<tr>
						<td style="width:60px;">用户名</td>
						<td>${userMap.username}</td>
					</tr>
					<tr>
						<td>昵　称</td>
						<td>${userMap.nickName}</td>
					</tr>
					<tr>
						<td>手　机</td>
						<td>${userMap.cellphone}</td>
					</tr>
					<tr>
						<td>联系人</td>
						<td>${userMap.contactor}</td>
					</tr>
					<tr>
						<td>信　誉</td>
						<td><c:choose><c:when test="${userMap.credit == '1'}">已认证</c:when><c:otherwise>未认证</c:otherwise></c:choose></td>
					</tr>
					<tr>
						<td>级　别</td>
						<td>${userMap.userLevel}</td>
					</tr>
					<tr>
						<td>QQ</td>
						<td>${userMap.qq}</td>
					</tr>
					<tr>
						<td>邮　箱</td>
						<td>${userMap.email}</td>
					</tr>
					<tr>
						<td>地　址</td>
						<td>${userMap.address}</td>
					</tr>
				</table>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
