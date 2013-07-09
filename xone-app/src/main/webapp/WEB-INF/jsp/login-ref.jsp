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
	<div data-role="page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<h1>用户登录页面</h1>
		</div>
		<div data-role="content">
			<form method="post" action="${pageContext.request.contextPath}/login/login.html">
				<input type="hidden" name="redirect" value="" autocomplete="off"/>
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
		<jsp:include page="footer.jsp">
			<jsp:param value="4" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
