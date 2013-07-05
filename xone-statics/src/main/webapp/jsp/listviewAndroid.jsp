<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<title>Hello World</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.3.1.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mobile-1.3.1.min.js"></script>
</head>
<body>
	<div data-role="page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="#" data-icon="back">back</a>
			<h1>我的页面</h1>
			<a href="#" data-icon="check">Save</a>
		</div>
		<div data-role="content">
	        <ul data-role="listview" data-inset="true">
	        	<li><a href="#">
	            	<img src="${pageContext.request.contextPath}/image/apple.png">
	            	<h2>iOS 6.1</h2>
	                <p>Apple released iOS 6.1</p>
	                <p class="ui-li-aside">iOS</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${pageContext.request.contextPath}/image/blackberry_10.png">
	            	<h2>BlackBerry 10</h2>
	                <p>BlackBerry launched the Z10 and Q10 with the new BB10 OS</p>
	                <p class="ui-li-aside">BlackBerry</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${pageContext.request.contextPath}/image/lumia_800.png">
	            	<h2>WP 7.8</h2>
	                <p>Nokia rolls out WP 7.8 to Lumia 800</p>
	                <p class="ui-li-aside">Windows Phone</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${pageContext.request.contextPath}/image/galaxy_express.png">
	            	<h2>Galaxy</h2>
	                <p>New Samsung Galaxy Express</p>
	                <p class="ui-li-aside">Samsung</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${pageContext.request.contextPath}/image/nexus_7.png">
	            	<h2>Nexus 7</h2>
	                <p>Rumours about new full HD Nexus 7</p>
	                <p class="ui-li-aside">Android</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${pageContext.request.contextPath}/image/firefox_os.png">
	            	<h2>Firefox OS</h2>
	                <p>ZTE to launch Firefox OS smartphone at MWC</p>
	                <p class="ui-li-aside">Firefox</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${pageContext.request.contextPath}/image/tizen.png">
	            	<h2>Tizen</h2>
	                <p>First Samsung phones with Tizen can be expected in 2013</p>
	                <p class="ui-li-aside">Tizen</p>
	            </a></li>
	        	<li><a href="#">
	            	<h2>Symbian</h2>
	                <p>Nokia confirms the end of Symbian</p>
	                <p class="ui-li-aside">Symbian</p>
	            </a></li>
	        </ul>
		</div>
		<div data-id="myfooter" data-role="footer" data-position="fixed">
			<div data-role="navbar" data-iconpos="left">
				<ul>  
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp?footer=0" data-transition="slide" data-ajax="false" data-icon="gear">One</a></li>  
					<li><a href="${pageContext.request.contextPath}/jsp/listviewAndroid.jsp" data-transition="slide" class="ui-btn-active ui-state-persist" data-icon="refresh">List</a></li>
					<li><a href="/hunny-statics/mobilehtml/demos/widgets/index.html" data-transition="slide" data-icon="grid">Three</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp?footer=3" data-transition="slide" data-icon="home">Four</a></li>
				</ul>  
			</div
		</div>
	</div>
</body>
</html>
