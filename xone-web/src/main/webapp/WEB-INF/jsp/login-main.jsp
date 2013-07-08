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
			<h1>用户信息页面</h1>
			<a href="${pageContext.request.contextPath}/login/logout.html" data-icon="check" class="ui-btn-right">注销</a>
		</div>
		<div data-role="content">
		    <div data-role="collapsible" data-collapsed="false" data-collapsed="false" data-theme="b" data-content-theme="d">
		        <h3>用户中心</h3>
				<ul data-role="listview" data-inset="true">
<!-- 					<li data-role="list-divider">当前用户信息</li> -->
				    <li data-icon="false">
					    <a href="#">
					    	<img src="${STATIC_ROOT}/image/angry.jpg"/>
					    	<h2>${userMap.user.username}</h2>
					    	<p>上次登录2013-07-05 13:23</p>
					    	<p>用户信息简介</p>
					    	<p class="ui-li-aside">用户简讯</p>
					    </a>
				    </li>
				    <li data-icon="false"><a href="#">邮　箱:</a></li>
				    <li data-icon="false"><a href="#">手　机:</a></li>
				    <li data-icon="false"><a href="#">地　址:</a></li>
				    <li data-icon="false"><a href="#">联系人:</a></li>
				    <li data-icon="refresh"><a href="#" onclick="window.main.loadPage('${pageContext.request.contextPath}/login/index.html');">刷新页面</a></li>
				    <li><a href="#" onclick="window.main.loadIndex();" rel="external" data-icon="home">软件首页</a></li>
				    <li><a href=”#” onclick=”javascript:navigator.app.exitApp();” data-icon="exit">退出软件</a></li>
				</ul>
		    </div>
		    <div data-role="collapsible" data-theme="b" data-content-theme="d">
		        <h3>我的售卖发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="#">查看产品发布列表</a></li>
				    <li><a href="#">查看促销发布列表</a></li>
				    <li><a href="#">查看组团发布列表</a></li>
				</ul>
		    </div>
		    <div data-role="collapsible" data-theme="b" data-content-theme="d">
		        <h3>我的购买发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="#">查看求购发布列表</a></li>
				    <li><a href="#">查看合购发布列表</a></li>
				</ul>
		    </div>
		    <div data-role="collapsible" data-theme="b" data-content-theme="d">
		        <h3>我的其它服务</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li><a href="#">查看物流配送列表</a></li>
				    <li><a href="#">查看广告发布列表</a></li>
				    <li><a href="#">查看资金担保列表</a></li>
				</ul>
		    </div>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="4" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
