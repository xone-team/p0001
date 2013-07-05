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
<!-- 			<h1>产品列表</h1> -->
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a href="${pageContext.request.contextPath}/product/index.html">所有产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html" class="ui-btn-active">促销产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listGroups.html">组团产品</a></li>
			    </ul>
			</div>
		</div>
		<div data-role="content">
			<div data-role="collapsible-set" data-theme="c" data-content-theme="d" style="margin-bottom:15px;">
				<div data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
				    <h3>选择产品类型</h3>
					<div data-role="controlgroup" data-mini="true" style="margin-bottom:15px;">
					    <input type="checkbox" name="checkbox-1a" id="checkbox-1a" checked="">
					    <label for="checkbox-1a">冻品</label>
					    <input type="checkbox" name="checkbox-2a" id="checkbox-2a">
					    <label for="checkbox-2a">干货</label>
					    <input type="checkbox" name="checkbox-3a" id="checkbox-3a">
					    <label for="checkbox-3a">活鲜</label>
					    <input type="checkbox" name="checkbox-4a" id="checkbox-4a">
					    <label for="checkbox-4a">水果</label>
					    <input type="checkbox" name="checkbox-5a" id="checkbox-5a">
					    <label for="checkbox-5a">调料</label>
					</div>
				</div>
				<div data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
				    <h3>市场地区</h3>
					<div data-role="controlgroup" data-mini="true">
					    <input type="checkbox" name="checkbox-1a" id="checkbox-1b" checked="">
					    <label for="checkbox-1b">上海</label>
					    <input type="checkbox" name="checkbox-2a" id="checkbox-2b">
					    <label for="checkbox-2b">天津</label>
					</div>
				</div>
				<div data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
				    <h3>信誉</h3>
					<div data-role="controlgroup" data-mini="true">
					    <input type="checkbox" name="checkbox-1a" id="checkbox-1c" checked="">
					    <label for="checkbox-1c">信誉好</label>
					    <input type="checkbox" name="checkbox-2a" id="checkbox-2c">
					    <label for="checkbox-2c">信誉一般</label>
					</div>
				</div>
			</div>
	        <ul id="listview" data-role="listview" data-filter="true" data-filter-placeholder="促销搜索..." data-inset="true">
	        	<li><a href="#">
	            	<img src="${STATIC_ROOT}/image/apple.png">
	            	<h2>iOS 6.1</h2>
	                <p>Apple released iOS 6.1</p>
	                <p class="ui-li-aside">iOS</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${STATIC_ROOT}/image/blackberry_10.png">
	            	<h2>BlackBerry 10</h2>
	                <p>BlackBerry launched the Z10 and Q10 with the new BB10 OS</p>
	                <p class="ui-li-aside">BlackBerry</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${STATIC_ROOT}/image/lumia_800.png">
	            	<h2>WP 7.8</h2>
	                <p>Nokia rolls out WP 7.8 to Lumia 800</p>
	                <p class="ui-li-aside">Windows Phone</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${STATIC_ROOT}/image/galaxy_express.png">
	            	<h2>Galaxy</h2>
	                <p>New Samsung Galaxy Express</p>
	                <p class="ui-li-aside">Samsung</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${STATIC_ROOT}/image/nexus_7.png">
	            	<h2>Nexus 7</h2>
	                <p>Rumours about new full HD Nexus 7</p>
	                <p class="ui-li-aside">Android</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${STATIC_ROOT}/image/firefox_os.png">
	            	<h2>Firefox OS</h2>
	                <p>ZTE to launch Firefox OS smartphone at MWC</p>
	                <p class="ui-li-aside">Firefox</p>
	            </a></li>
	        	<li><a href="#">
	            	<img src="${STATIC_ROOT}/image/tizen.png">
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
		<jsp:include page="footer.jsp">
			<jsp:param value="1" name="offset"/>
		</jsp:include>
	</div>
	<script type="text/javascript">
		$(document).bind('pagebeforeload', function() {
			
		});
	</script>
	</body>
</html>
