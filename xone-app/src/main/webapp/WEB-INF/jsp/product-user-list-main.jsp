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
	<div data-role="page" class="product-list-for-user-page">
		<div data-id="myheader" data-role="header" data-position="fixed">
<%-- 			<a href="${pageContext.request.contextPath}/login/index.html?_=${identify}" data-icon="check">返回</a> --%>
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>用户<c:choose><c:when test="${product.saleType == '1'}">促销</c:when><c:when test="${product.saleType == '2'}">团购</c:when><c:otherwise>产品</c:otherwise></c:choose>列表</h1>
			<a href="#" class="product-list-for-user-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content">
			<div class="product-list-for-user-main" style="width:100%;" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
				<ul class="ul-product-list-for-user" data-role="listview" data-inset="true">
		        	<li data-role="list-divider">数据加载中，请稍候...</li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$('div.product-list-for-user-page').bind("pageinit", function(event) {
				$('div.product-list-for-user-main').mypullupdown({
					url:'${pageContext.request.contextPath}/product/listItemsForUser.html?product.saleType=${product.saleType}',
					onDown: function() {
						var item = $('li.productdatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'down',
							'product.dateCreated': item.first().attr('timestamp')
						}
					},
					onUp: function() {
						var item = $('li.productdatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'up',
							'product.dateCreated': item.last().attr('timestamp')
						}
					},
					down: function(html) {
						$('ul.ul-product-list-for-user').prepend(html).listview('refresh');
					},
					up: function(html) {
						$('ul.ul-product-list-for-user').append(html).listview('refresh');
					}
				});
	        	doProductUserRequest();
				$('a.product-list-for-user-page-refresh').click(function(e) {
					$('ul.ul-product-list-for-user').html('<li data-role="list-divider">数据加载中，请稍候...</li>').listview('refresh');
					doProductUserRequest();
				});
				function doProductUserRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listItemsForUser.html?product.saleType=${product.saleType}',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.ul-product-list-for-user').html(html).listview('refresh');
							fixedProductImage();
						}
					});
				}
				function fixedProductImage() {
					if (!$('div.product-list-for-user-page').data('cssbinding')) {
						var lis = $('ul.ul-product-list-for-user').find('li.productdatecreateditem:eq(0)');
						if (lis.length > 0) {
							var height = lis.height() - 3;
							var css = ['<style type="text/css"> img.productliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
							$('div.product-list-for-user-page').append(css.join(''));
						}
						$('div.product-list-for-user-page').data('cssbinding', true);
					}
				}
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
