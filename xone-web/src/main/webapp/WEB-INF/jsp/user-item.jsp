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
				<jsp:include page="user-center-menu.jsp"><jsp:param value="1" name="menuindex"/></jsp:include>
			</div>
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a> <span class="divider">/</span></li>
					<li class="active">我的资料</li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">用户名</td>
							<td>${user.username}</td>
						</tr>
						<tr>
							<td style="width:60px;">注册时间</td>
							<td>${user.dateApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">昵称</td>
							<td>${user.nickName}</td>
						</tr>
						<tr>
							<td style="width:60px;">手机号码</td>
							<td>${user.cellphone}</td>
						</tr>
						<tr>
							<td style="width:60px;">联系人</td>
							<td>${user.contactor}</td>
						</tr>
						<tr>
							<td style="width:60px;">腾讯号码</td>
							<td>${user.qq}</td>
						</tr>
						<tr>
							<td style="width:60px;">电子邮箱</td>
							<td>${user.email}</td>
						</tr>
						<tr>
							<td style="width:60px;">联系地址</td>
							<td>${user.address}</td>
						</tr>
						<tr>
							<td style="width:60px;">认证标识</td>
							<td>${user.creditName}</td>
						</tr>
						<tr>
							<td style="width:60px;">用户级别</td>
							<td>${user.userLevelName}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
    <script type="text/javascript">
    	$(function(){
    	    jQuery("#X_menu_li_product").addClass("active");
    	});
    </script>
</html>
