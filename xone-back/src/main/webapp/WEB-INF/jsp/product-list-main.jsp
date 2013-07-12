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
	</head>
	<body>
	<div data-role="page" role-id="product-page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<div style="width:100%;height:25px;" id="banner">此处是广告位</div>
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a data-id="allproducts" href="${pageContext.request.contextPath}/product/index.html" class="ui-btn-active">所有产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html">促销产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listGroups.html">组团产品</a></li>
			    </ul>
			</div>
		</div>
		<div role-id="product-list" data-role="content" data-iscroll>
			<div class="iscroll-pulldown">
		        <span class="iscroll-pull-icon"></span>
		        <span class="iscroll-pull-label"></span>
			</div>
			<ul data-id="listview" data-role="listview" data-filter="true" data-filter-placeholder="产品搜索..." data-inset="true">
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
			<div class="iscroll-pullup">
				<span class="iscroll-pull-icon"></span>
				<span class="iscroll-pull-label"></span>
			</div>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="1" name="offset"/>
		</jsp:include>
	</div>
	<script type="text/javascript">
		$(document).delegate('div[role-id="product-page"]', "pageinit", function(event) {
	        $('div[role-id="product-list"]', this).bind({
		        "iscroll_onpulldown" : pullDown,
		        "iscroll_onpullup"   : pullUp
	        });
		});
		$(document).bind('pageinit', function() {
			$('a[data-id="allproducts"]').addClass('ui-btn-active');
		});
		function pullDown() {
			loadData('prepend');
		}
		function pullUp() {
			loadData('appand');
		}
		function loadData(insertType) {
			$.ajax({
				type: 'GET',
				url: '${pageContext.request.contextPath}/product/listMobileMore.html',
				data: '_=' + new Date().getTime(),
				insertType: insertType,
				success: function(html) {
					if (this.insertType == 'prepend') {
						$('ul[data-id="listview"]').prepend(html).listview('refresh');
					} else {
						$('ul[data-id="listview"]').append(html).listview('refresh');
					}
				}
			});
		}
	</script>
	</body>
</html>
