<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
	</head>
	<body>
		<c:if test="${not empty requestScope.SPRING_SECURITY_LAST_EXCEPTION}">
		<div>${requestScope.SPRING_SECURITY_LAST_EXCEPTION}</div>
		</c:if>
		<form method="post" action="${pageContext.request.contextPath}/j_spring_security_check">
	    	<table style="width:100%">
	    		<tr>
	    			<td style="width:60px;">用户名:</td>
	    			<td><input type="text" name="username" id="text-username" value="15800000000" autocomplete="off"/></td>
	    		</tr>
	    		<tr>
	    			<td style="width:60px;">密　码:</td>
	    			<td><input type="password" name="password" id="text-password" value="hunny@admin" autocomplete="off"/></td>
	    		</tr> 
<!-- 				<tr>   -->
<!-- 				  <td>&nbsp;</td> -->
<!-- 				  <td><input type="checkbox" name="_spring_security_remember_me" />两周之内自动登陆</td>   -->
<!-- 				</tr> -->
	    		<tr>
	    			<td><input type="button" value="注册用户" data-theme="e"/></td>
	    			<td><input type="submit" value="确认登录" data-theme="e"/></td>
	    		</tr>
	    	</table>
		</form>
	</body>
</html>
