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
		<style type="text/css">
		a.navbartabs {
			height:26px;
		}
		</style>
	</head>
	<body>
	<div data-role="page" class="product-sales-page" data-dom-cache="true">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a href="${pageContext.request.contextPath}/product/index.html?_=${identify}">所有产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html?_=${identify}" class="ui-btn-active">促销产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listGroups.html?_=${identify}">组团产品</a></li>
			    </ul>
			</div>
		</div>
		<div data-role="content" style="padding-top:2px;">
			<div class="searchconditionssales" data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
			    <h4>选择附加搜索条件</h4>
				<div data-role="navbar" data-mini="true" data-theme="e">
				    <ul>
				        <li><a href="#searchtype" class="navbartabs ui-btn-active">类型</a></li>
				        <li><a href="#searcharea" class="navbartabs">地区</a></li>
				        <li><a href="#searchcredit" class="navbartabs">信誉</a></li>
				    </ul>
				</div>
				<div data-id="#searchtype" data-role="controlgroup" data-mini="true" class="salesearchclass">
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
				<div data-id="#searcharea" data-role="controlgroup" data-mini="true" class="salesearchclass" style="display:none;">
				    <input type="checkbox" name="checkbox-1a" id="checkbox-1b" checked="">
				    <label for="checkbox-1b">上海</label>
				    <input type="checkbox" name="checkbox-2a" id="checkbox-2b">
				    <label for="checkbox-2b">天津</label>
				</div>
				<div data-id="#searchcredit" data-role="controlgroup" data-mini="true" class="salesearchclass" style="display:none;">
				    <input type="checkbox" name="checkbox-1a" id="checkbox-1c" checked="">
				    <label for="checkbox-1c">信誉好</label>
				    <input type="checkbox" name="checkbox-2a" id="checkbox-2c">
				    <label for="checkbox-2c">信誉一般</label>
				</div>
			</div>
			<div style="width:100%;padding-top:10px;" class="product-sales-list" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
		        <ul class="product-sales-listview" data-role="listview" data-filter="true" data-filter-placeholder="促销关键字搜索..." data-inset="true">
<!-- 			        <li data-role="list-divider">数据加载中，请稍候...</li> -->
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js?_=${identify}"></script>
		<script type="text/javascript">
			$('div.product-sales-page').bind('pageinit', function(event) {
				$('a.navbartabs').click(function(e) {
					e.preventDefault();
					$('div.salesearchclass').hide();
					$('a.navbartabs').removeClass('ui-btn-active');
					var t = $(this);
					$('div[data-id="' + t.attr('href') + '"]').show();
					t.addClass('ui-btn-active');
				});
				$('div.product-sales-list').mypullupdown({
					url:'${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
					onDown: function() {
						var item = $('ul.product-sales-listview').find('li.productdatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'down',
							'product.dateCreated': item.first().attr('timestamp')
						}
					},
					onUp: function() {
						var item = $('ul.product-sales-listview').find('li.productdatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'up',
							'product.dateCreated': item.last().attr('timestamp')
						}
					},
					down: function(html) {
						$('ul.product-sales-listview').prepend(html).listview('refresh');
					},
					up: function(html) {
						$('ul.product-sales-listview').append(html).listview('refresh');
					}
				});
	        	doRequest();
				function doRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.product-sales-listview').html(html).listview('refresh');
							fixedProductSaleImage();
						}
					});
				}
				function fixedProductSaleImage() {
					var lis = $('ul.product-sales-listview').find('li.productdatecreateditem:eq(0)');
					if (lis.length > 0) {
						var height = lis.height() - 3;
						var css = ['<style type="text/css" class="product"> img.productliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
						$('div.product-sales-page').append(css.join(''));
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
