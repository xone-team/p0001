<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML><c:set var="myid" value="${identify}" />
<html>
	<head>
		<title>Hello World</title>
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="assistant-main-page" data-dom-cache="true">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<h2>功能助手</h2>
		</div>
		<div class="assistantcontent" data-role="content">
		    <div data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
		        <h3>售卖发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="${pageContext.request.contextPath}/product/add.html?_=${myid}">产品发布</a></li>
				    <li><a href="${pageContext.request.contextPath}/product/addSales.html?_=${myid}">促销发布</a></li>
				    <li><a href="${pageContext.request.contextPath}/product/addGroups.html?_=${myid}">组团发布</a></li>
				</ul>
		    </div>
		    <div data-role="collapsible" data-collapsed="false" data-theme="b" data-content-theme="d">
		        <h3>购买发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="${pageContext.request.contextPath}/purchase/indexAdd.html?_=${myid}">求购发布</a></li>
<!-- 				    <li><a href="#">合购发布</a></li> -->
				</ul>
		    </div>
		    <div data-role="collapsible" data-theme="b" data-content-theme="d">
		        <h3>其它服务</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="${pageContext.request.contextPath}/delivery/index.html?_=${myid}">物流配送</a></li>
				    <li><a href="${pageContext.request.contextPath}/subscribe/add.html?_=${myid}">筛选订阅</a></li>
				    <li><a href="#" onclick="window.main.makeCall('13761560145');return false;">联系客服</a></li>
				</ul>
		    </div>
		</div>
		<script type="text/javascript">
			$('div.assistant-main-page').bind('pageinit', function() {
				$('div.assistantcontent').css({
					paddingTop: '0px'
				});
	// 			$('a.btn-banner').css({
	// 				marginTop: '28px'
	// 			});
				$('a.assistantpopuplink').click(function(e) {
					e.preventDefault();
					$('div.assistantpopuplogin').open();
					return false;
				});
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="3" name="offset"/></jsp:include>
	</div>
	</script>
	</body>
</html>
