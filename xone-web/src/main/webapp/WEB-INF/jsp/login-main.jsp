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
				<div class="accordion">
					<div class="accordion-group">
						<div class="accordion-heading">
							<div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#${identify}_1">用户中心</div>
						</div>
						<div id="${identify}_1" class="accordion-body in collapse" style="height: auto;">
							<div class="accordion-inner">
								<ul class="nav nav-list">
									<li id="menu_user" class="active"><a href="#" class="well well-small clearmarginbottom">用户信息</a></li>
									<li id="menu_user_update"><a href="#" class="well well-small clearmarginbottom">用户更新</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">产品发布</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">促销发布</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">组团发布</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">求购发布</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">物流配送</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">筛选订阅</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<div class="accordion-toggle nav-header collapsed" data-toggle="collapse" data-target="#${identify}_2">我的售卖发布</div>
						</div>
						<div id="${identify}_2" class="accordion-body collapse" style="height: 0px;">
							<div class="accordion-inner">
								<ul class="nav nav-list">
									<li><a href="#" class="well well-small clearmarginbottom">产品发布列表</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">促销发布列表</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">组团发布列表</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<div class="accordion-toggle nav-header collapsed" data-toggle="collapse" data-target="#${identify}_3">我的购买发布</div>
						</div>
						<div id="${identify}_3" class="accordion-body collapse" style="height: 0px;">
							<div class="accordion-inner">
								<ul class="nav nav-list">
									<li><a href="#" class="well well-small clearmarginbottom">求购发布列表</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<div class="accordion-toggle nav-header collapsed" data-toggle="collapse" data-target="#${identify}_4">我的其它服务</div>
						</div>
						<div id="${identify}_4" class="accordion-body collapse" style="height: 0px;">
							<div class="accordion-inner">
								<ul class="nav nav-list">
									<li><a href="#" class="well well-small clearmarginbottom">物流配送列表</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">我的广告列表</a></li>
									<li><a href="#" class="well well-small clearmarginbottom">我的订阅列表</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
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
