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
	<div data-role="page" class="product-page-group" data-dom-cache="false">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
<!-- 			<h1>产品列表</h1> -->
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a href="${pageContext.request.contextPath}/product/index.html?_=${identify}">所有产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html?_=${identify}">促销产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listGroups.html?_=${identify}" class="ui-btn-active">组团产品</a></li>
			    </ul>
			</div>
		</div>
		<div data-role="content">
			<div class="searchconditionsgroup" data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d" style="margin-bottom:15px;">
			    <h2>选择产品类型</h2>
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
			<div class="product-list-group" style="width:100%;padding-top:10px;" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
		        <ul class="listviewgroup" data-role="listview" data-filter="true" data-filter-placeholder="组团关键字搜索..." data-inset="true">
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
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="1" name="offset"/>
		</jsp:include>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js?_=${identify}"></script>
	<script type="text/javascript">
		$(document).delegate('div.product-page-group', "pageinit", function(event) {
			$('div.product-list-group').mypullupdown({
				url:'${pageContext.request.contextPath}/product/listMobileMore.html',
				down: function(html) {
					$('ul.listviewgroup').prepend(html).listview('refresh');
				},
				up: function(html) {
					$('ul.listviewgroup').append(html).listview('refresh');
				},
				downed: function() {
					$('div.searchconditionsgroup').hide();
				},
				uped: function() {
					$('div.searchconditionsgroup').show();
				}
			});
		});
	</script>
	</body>
</html>
