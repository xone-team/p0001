<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML><c:set var="myid" value="${identify}" />
<html>
	<head>
		<title>Assistant Guide</title>
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body><c:set var="myid" value="${identify}" />
		<div id="assistant-guide" data-role="page" data-id="myguidepage">
			<div data-id="myheader" data-role="header" data-position="fixed" data-tap-toggle="true">
				<a href="${pageContext.request.contextPath}/login/indexRegister.html" data-icon="check">注册</a>
				<h1>欢迎使用</h1>
				<a href="#" class="ui-btn-right" onclick="$.makeCall('4008979727');" data-icon="grid">客服</a>
			</div>
			<div data-role="content" class="guide-page">
			    <div class="ui-grid-a">
				    <div class="ui-block-a">
				    	<div class="ui-bar">
							<div class="desktop-icon" style="text-align:center;">
				    		<a href="${pageContext.request.contextPath}/product/listSales.html" class="ui-btn-up-no" data-theme="no" data-shadow="false" data-role="button" data-icon="sale-b-64" data-iconpos="top" data-inline="true">促销产品</a>
							</div>
				    	</div>
				    </div>
				    <div class="ui-block-b">
				    	<div class="ui-bar">
							<div class="desktop-icon" style="text-align:center;">
							<a href="${pageContext.request.contextPath}/purchase/index.html" class="ui-btn-up-no" data-theme="no" data-shadow="false" data-role="button" data-icon="sale-d-64" data-iconpos="top" data-inline="true">大家想买</a>
							</div>
				    	</div>
				    </div>
				</div>
			    <div class="ui-grid-a">
				    <div class="ui-block-a">
				    	<div class="ui-bar">
							<div class="desktop-icon" style="text-align:center;">
				    		<a href="${pageContext.request.contextPath}/product/listGroups.html" class="ui-btn-up-no" data-theme="no" data-shadow="false" data-role="button" data-icon="sale-c-64" data-iconpos="top" data-inline="true">组团产品</a>
							</div>
				    	</div>
				    </div>
				    <div class="ui-block-b">
				    	<div class="ui-bar">
							<div class="desktop-icon" style="text-align:center;">
				    		<a href="${pageContext.request.contextPath}/delivery/index.html" class="ui-btn-up-no" data-theme="no" data-shadow="false" data-role="button" data-icon="sale-a-64" data-iconpos="top" data-inline="true">物流配送</a>
							</div>
				    	</div>
				    </div>
				</div>
			    <div class="ui-grid-a">
				    <div class="ui-block-a">
				    	<div class="ui-bar">
							<div class="desktop-icon" style="text-align:center;">
				    		<a href="${pageContext.request.contextPath}/login/indexRegister.html" class="ui-btn-up-no" data-theme="no" data-shadow="false" data-role="button" data-icon="reg-64" data-iconpos="top" data-inline="true">我要注册</a>
							</div>
				    	</div>
				    </div>
				    <div class="ui-block-b">
				    	<div class="ui-bar">
				    		<div class="desktop-icon" style="text-align:center;">
				    		<c:choose>
								<c:when test="${login}">
									<a href="${pageContext.request.contextPath}/login/main.html" class="ui-btn-up-no" data-theme="no" data-shadow="false" data-role="button" data-icon="admin-64" data-iconpos="top" data-inline="true">用户中心</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/login/index.html" class="ui-btn-up-no" data-theme="no" data-shadow="false" data-role="button" data-icon="login-64" data-iconpos="top" data-inline="true">我要登录</a>
								</c:otherwise>
							</c:choose>
							
							</div>
				    	</div>
				    </div>
				</div>
<%-- 				<c:if test="${login}"> --%>
<!-- 				    <div class="ui-grid-solo"> -->
<!-- 				    	<div class="ui-block-a"> -->
<!-- 					    	<div class="ui-bar"> -->
<!-- 					    		<div style="text-align:center;"> -->
<%-- 						    	<a href="${pageContext.request.contextPath}/login/logout.html?_=${myid}" class="login-logout${myid}" data-inline="true" data-role="button">退出登录</a> --%>
<!-- 						    	</div> -->
<!-- 					    	</div> -->
<!-- 				    	</div> -->
<!-- 					</div> -->
<%-- 				</c:if> --%>
			</div>
			<jsp:include page="footer.jsp"><jsp:param value="2" name="offset"/></jsp:include>
		</div>
		<script type="text/javascript" language="javascript">  
	    $('div.guide-page').bind('pageinit', function(e, ui) {
	    	$('a.login-logout${myid}').click(function(e) {
		    	try {
		    		$.rockRoll('');
		    	} catch (e) {
		    	}
		    	return true;
	    	});
	    });
		</script>
	</body>
</html>