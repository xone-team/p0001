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
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="login-register-info-page">
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-tap-toggle="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/login/main.html?_=${myid}" data-icon="check">返回</a>
<!-- 			<a href="#" data-rel="back" data-icon="back">返回</a> -->
			<h1>用户更新</h1>
			<a href="${pageContext.request.contextPath}/login/index.html?_=${myid}" data-icon="check" class="btn-banner">登录</a>
		</div>
		<div data-role="content">
			<div style="height:15px">&nbsp;</div>
			<div class="info">用户编号:${mapValue['user'].id}</div>
			<div class="success">${mapValue['msg']}</div>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="4" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
