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
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="subscribe-product-list-page${myid}">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/login/index.html?_=${myid}" data-icon="check">返回</a>
			<h1>产品订阅列表</h1>
			<a href="#" class="subscribe-product-list-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content" class="subscribe-product-list-content" data-iscroll>
			<div class="iscroll-pulldown">
		        <span class="iscroll-pull-icon"></span>
		        <span class="iscroll-pull-label"></span>
			</div>
			<ul class="ul-subscribe-product-list" data-role="listview" data-inset="true">
	        	<li data-role="list-divider">数据加载中，请稍候...</li>
	        </ul>
			<div class="iscroll-pullup">
				<span class="iscroll-pull-icon"></span>
				<span class="iscroll-pull-label"></span>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js"></script>
		<script type="text/javascript">
			$('div.subscribe-product-list-page${myid}').bind("pageinit", function(event) {
				var data = {
				<c:if test="${!(empty mapValue)}">
					<c:forEach items="${mapValue}" var="entry">  
						'product.${entry.key}':'${entry.value}',
					</c:forEach>
				</c:if>
				'_': new Date().getTime()
				}
				$('div.subscribe-product-list-content').mypullupdown({
					url:'${pageContext.request.contextPath}/product/listItems.html',
					onDown: function() {
						var item = $('ul.ul-subscribe-product-list').find('li.productdatecreateditem');
						return $.extend({}, data, {
							'itemcount': item.length,
							'itemaction': 'down',
							'product.dateCreated': item.first().attr('timestamp')
						});
					},
					onUp: function() {
						var item = $('ul.ul-subscribe-product-list').find('li.productdatecreateditem');
						return $.extend({}, data, {
							'itemcount': item.length,
							'itemaction': 'up',
							'product.dateCreated': item.last().attr('timestamp')
						});
					},
					down: function(html) {
						$('ul.ul-subscribe-product-list').prepend(html).listview('refresh');
					},
					up: function(html) {
						$('ul.ul-subscribe-product-list').append(html).listview('refresh');
					}
				});
	        	doSubscribeProductRequest();
				$('a.subscribe-product-list-page-refresh').click(function(e) {
					e.preventDefault();
					$('ul.ul-subscribe-product-list').html('<li data-role="list-divider">数据加载中，请稍候...</li>').listview('refresh');
					doSubscribeProductRequest();
				});
				function doSubscribeProductRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listItems.html',
						data: data,
						success: function(html) {
							$('ul.ul-subscribe-product-list').html(html).listview('refresh');
							fixedSubscribeProductImage();
						}
					});
				}
				function fixedSubscribeProductImage() {
					var lis = $('li.productdatecreateditem:eq(0)');
					if (lis.length > 0) {
						var height = lis.height() - 3;
						var css = ['<style type="text/css" class="product"> img.productliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
						$('div.subscribe-product-list-page${myid}').append(css.join(''));
					}
				}
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
