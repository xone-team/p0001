<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.3.1.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mobile-1.3.1.min.js"></script>
	</head>
	<body>
	<div data-role="page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<h1>用户信息页面</h1>
			<a href="${pageContext.request.contextPath}/login/logout.html" data-icon="check" class="ui-btn-right">注销</a>
		</div>
		<div data-role="content">
			<ul data-role="listview" data-inset="true">
				<li data-role="list-divider"><h2>当前用户信息</h2></li>
			    <li data-icon="false"><a href="#">用户名:${userMap.user.username}</a></li>
			    <li data-icon="false"><a href="#">邮　箱:</a></li>
			    <li data-icon="false"><a href="#">手　机:</a></li>
			    <li data-icon="false"><a href="#">地　址:</a></li>
			    <li data-icon="false"><a href="#">联系人:</a></li>
			</ul>
		</div>
		<div data-id="myfooter" data-role="footer" data-position="fixed">
			<div data-role="navbar" data-iconpos="left">
				<ul>  
					<li><a href="${pageContext.request.contextPath}/product/index.html" data-icon="gear">卖</a></li>  
					<li><a href="${pageContext.request.contextPath}/jsp/listviewAndroid.jsp" data-ajax="false" data-icon="refresh">List</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp" data-icon="grid">Widgets</a></li>
					<li><a href="${pageContext.request.contextPath}/login/index.html" data-icon="home" class="ui-btn-active ui-state-persist">用户</a></li>
				</ul>
			</div
		</div>
	</div>
	</body>
</html>
