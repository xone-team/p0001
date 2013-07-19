<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
	</head>
	<body>
		<h1>登录成功</h1>
		<div>
			<h3>Message : ${message}</h3>
			<h3>Username : ${name}</h3>
		</div>
		<div>
			<a href="<c:url value="/j_spring_security_logout" />"> Logout</a>
		</div>
	</body>
</html>
