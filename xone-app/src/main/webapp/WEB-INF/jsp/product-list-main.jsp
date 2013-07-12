<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="product-page" data-dom-cache="false">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a class="allproducts" href="${pageContext.request.contextPath}/product/index.html?_=${identify}" class="ui-btn-active">所有产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html?_=${identify}">促销产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listGroups.html?_=${identify}">组团产品</a></li>
			    </ul>
			</div>
			<div class="ui-mybanner">此处是广告位</div>
		</div>
		<div class="product-list" data-role="content" data-iscroll>
			<div class="iscroll-pulldown">
		        <span class="iscroll-pull-icon"></span>
		        <span class="iscroll-pull-label"></span>
			</div>
			<div style="height:15px">&nbsp;</div>
			<ul data-id="listview" data-role="listview" data-filter="true" data-filter-placeholder="产品搜索..." data-inset="true">
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
	        </ul>
			<div class="iscroll-pullup">
				<span class="iscroll-pull-icon"></span>
				<span class="iscroll-pull-label"></span>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js?_=${identify}"></script>
		<script defer="defer" type="text/javascript">
			$(document).delegate('div.product-page', "pageinit", function(event) {
				$('a.allproducts').addClass('ui-btn-active');
		        $('div.ui-mybanner').html('product-main' + new Date().getTime());
			});
			$('div.product-page').bind("pageinit", function(event) {
				$('div.product-list').mypullupdown({
					url:'${pageContext.request.contextPath}/product/listMobileMore.html',
					down: function(html) {
						$('div.ui-mybanner').html('down at' + new Date().getTime());
						$('ul[data-id="listview"]').prepend(html).listview('refresh');
					},
					up: function(html) {
						$('div.ui-mybanner').html('up at' + new Date().getTime());
						$('ul[data-id="listview"]').append(html).listview('refresh');
					}
				});
			});
		</script>
		<jsp:include page="footer.jsp">
			<jsp:param value="1" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
