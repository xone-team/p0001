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
			<h1>用户登录页面</h1>
		</div>
		<div data-role="content">
			<form method="post" action="${pageContext.request.contextPath}/login/login.html">
				<ul data-role="listview" data-inset="true" data-mini="true">
					<li data-role="list-divider"><h2>用户登录信息</h2></li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td style="width:60px;">用户名:</td>
				    			<td><input type="text" name="username" data-mini="true" id="text-username" value="admin" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td style="width:60px;">密　码:</td>
				    			<td><input type="password" name="password" data-mini="true" id="text-password" value="hunny@admin" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td><input type="button" value="注册用户" data-theme="e"/></td>
				    			<td><input type="submit" value="确认登录" data-theme="e"/></td>
				    		</tr>
				    	</table>
				    </li>
				</ul>
			</form>
		</div>
		<div data-id="myfooter" data-role="footer" data-position="fixed">
			<div data-role="navbar" data-iconpos="left">
				<ul>  
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp?footer=0" data-transition="slide" data-icon="gear">Widgets</a></li>  
					<li><a href="${pageContext.request.contextPath}/jsp/listviewAndroid.jsp" data-transition="slide" data-ajax="false" data-icon="refresh">List</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp?footer=0" data-transition="slide" data-icon="grid">Widgets</a></li>
					<li><a href="${pageContext.request.contextPath}/login/index.html" data-transition="slide" data-icon="home" class="ui-btn-active ui-state-persist">Login</a></li>
				</ul>
			</div
		</div>
	</div>
	</body>
</html>
