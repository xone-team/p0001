<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="assistant-main-page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<h2>功能助手</h2>
<%-- 			<a href="#popupLogin${identify}" data-rel="popup" data-position-to="window" data-role="button" data-inline="true" data-icon="check" data-transition="pop" data-theme="a" class="btn-banner assistantpopuplink ui-btn-right">登录</a> --%>
<%-- 			<div data-role="popup" class="popupMenu${identify}" data-theme="a"> --%>
<!-- 			    <div data-role="popup" class="assistantpopuplogin" data-theme="a" class="ui-corner-all"> -->
<!-- 					<a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a> -->
<!-- 			        <form> -->
<!-- 			            <div style="padding:0px 5px 5px 5px;"> -->
<!-- 			              <h3 style="text-align:center;">输入登录信息</h3> -->
<%-- 			              <input type="text" name="username" id="un${identify}" value="" placeholder="输入用户名" data-theme="a"> --%>
<%-- 			              <input type="password" name="password" id="pw${identify}" value="" placeholder="输入密码" data-theme="a"> --%>
<!-- 			              <button type="submit" data-theme="b" data-icon="check">确认登录</button> -->
<!-- 			            </div> -->
<!-- 			        </form> -->
<!-- 			    </div> -->
<!-- 			</div> -->
		</div>
		<div class="assistantcontent" data-role="content">
		    <div data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
		        <h3>售卖发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="${pageContext.request.contextPath}/product/add.html?type=0&_=${identify}">产品发布</a></li>
				    <li><a href="${pageContext.request.contextPath}/product/add.html?type=1&_=${identify}">促销发布</a></li>
				    <li><a href="${pageContext.request.contextPath}/product/add.html?type=2&_=${identify}">组团发布</a></li>
				</ul>
		    </div>
		    <div data-role="collapsible" data-collapsed="false" data-theme="b" data-content-theme="d">
		        <h3>购买发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="${pageContext.request.contextPath}/purchase/indexAdd.html?_=${identify}">求购发布</a></li>
<!-- 				    <li><a href="#">合购发布</a></li> -->
				</ul>
		    </div>
		    <div data-role="collapsible" data-theme="b" data-content-theme="d">
		        <h3>其它服务</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="${pageContext.request.contextPath}/delivery/index.html?_=${identify}">物流配送</a></li>
				    <li><a href="${pageContext.request.contextPath}/subscribe/add.html?_=${identify}">筛选订阅</a></li>
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
