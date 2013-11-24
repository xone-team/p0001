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
		<div data-id="myheader" data-role="header" data-tap-toggle="false" data-position="fixed">
 			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>消息提示</h1>
			<a href="#" class="ui-btn-right" onclick="$.makeCall('4008979727');" data-icon="tel-24">客服</a>
		</div>
		<div data-role="content">
			<div style="height:15px">&nbsp;</div>
<!-- 			<div class="info">用户编号用户编号用户编号用户编号用户编号用户编号用户编号用户编号用户编号用户编号用户编号用户编号用户编号用户编号用户编号用户编号</div> -->
			<c:forEach var="item" items="${msgList}">
				<div class="info">${item}</div>
			</c:forEach>
<!-- 			<div class="success"></div> -->
			<div style="text-align:center;">如果有问题，可点击标题栏上的“客服”按钮致电客服。</div>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="3" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
