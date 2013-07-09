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
			<div style="width:100%;border:1px white solid;height:25px;" id="banner">此处是广告位</div>
			<h2>功能助手</h2>
		</div>
		<div data-id="assistant${identify}" data-role="content">
		    <div data-role="collapsible" data-collapsed="false" data-theme="b" data-content-theme="d">
		        <h3>售卖发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="#">产品发布</a></li>
				    <li><a href="#">促销发布</a></li>
				    <li><a href="#">组团发布</a></li>
				</ul>
		    </div>
		    <div data-role="collapsible" data-theme="b" data-content-theme="d">
		        <h3>购买发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="#">求购发布</a></li>
<!-- 				    <li><a href="#">合购发布</a></li> -->
				</ul>
		    </div>
		    <div data-role="collapsible" data-theme="b" data-content-theme="d">
		        <h3>其它服务</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="${pageContext.request.contextPath}/delivery/index.html">物流配送</a></li>
				    <li><a href="#">筛选订阅</a></li>
<!-- 				    <li><a href="#">资金担保</a></li> -->
				</ul>
		    </div>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="3" name="offset"/>
		</jsp:include>
	</div>
	<script type="text/javascript">
		$(document).bind('pageinit', function() {
			$('div[data-id="assistant${identify}"]').css({
				paddingTop: '0px'
			});
		});
	</script>
	</body>
</html>
