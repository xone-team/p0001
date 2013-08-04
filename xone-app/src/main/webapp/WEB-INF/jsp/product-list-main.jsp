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
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="product-main-page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a class="allproducts" data-prefetch="true" href="${pageContext.request.contextPath}/product/index.html?_=${myid}" class="ui-btn-active">所有产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html?_=${myid}">促销产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listGroups.html?_=${myid}">组团产品</a></li>
			    </ul>
			</div>
		</div>
		<div class="product-list-main" data-role="content" data-iscroll>
			<div class="iscroll-pulldown">
		        <span class="iscroll-pull-icon"></span>
		        <span class="iscroll-pull-label"></span>
			</div>
			<div style="height:15px">&nbsp;</div>
				<ul class="ul-product-list" data-id="listview" data-role="listview" data-filter="true" data-filter-placeholder="产品搜索..." data-inset="true">
			        <li data-role="list-divider">数据加载中，请稍候...</li>
		        </ul>
			<div class="iscroll-pullup">
				<span class="iscroll-pull-icon"></span>
				<span class="iscroll-pull-label"></span>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js?_=${myid}"></script>
		<script defer="defer" type="text/javascript">
			$(document).delegate('div.product-main-page', "pageinit", function(event) {
				$('a.allproducts').addClass('ui-btn-active');
			});
			$('div.product-main-page').bind("pageinit", function(event) {
				$('div.product-list-main').mypullupdown({
					url:'${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
					onDown: function() {
						var item = $('ul.ul-product-list').find('li.productdatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'down',
							'product.dateCreated': item.first().attr('timestamp')
						}
					},
					onUp: function() {
						var item = $('ul.ul-product-list').find('li.productdatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'up',
							'product.dateCreated': item.last().attr('timestamp')
						}
					},
					down: function(html) {
						$('ul.ul-product-list').prepend(html).listview('refresh');
					},
					up: function(html) {
						$('ul.ul-product-list').append(html).listview('refresh');
					}
				});
	        	doRequest();
				function doRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.ul-product-list').html(html).listview('refresh');
							fixedPurchaseImage();
						}
					});
				}
				function fixedPurchaseImage() {
					var lis = $('li.productdatecreateditem:eq(0)');
					if (lis.length > 0) {
						var height = lis.height() - 3;
						var css = ['<style type="text/css" class="product"> img.productliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
						$('div.product-main-page').append(css.join(''));
					}
				}
			});
		</script>
		<jsp:include page="footer.jsp">
			<jsp:param value="1" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
