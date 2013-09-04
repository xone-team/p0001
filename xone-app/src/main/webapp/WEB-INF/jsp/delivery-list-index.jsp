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
	<div data-role="page" class="delivery-list-index-page" data-dom-cache="false">
		<div data-id="myheader" data-role="header" data-position="fixed">
<%-- 			<a href="${pageContext.request.contextPath}/login/index.html?_=${identify}" data-icon="check">返回</a> --%>
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>我的物流配送列表</h1>
			<a href="#" class="delivery-list-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div class="delivery-list-content" data-role="content" data-iscroll>
			<div class="iscroll-pulldown">
		        <span class="iscroll-pull-icon"></span>
		        <span class="iscroll-pull-label"></span>
			</div>
			<ul class="delivery-list-view" data-id="listview" data-role="listview" data-inset="true">
	            <li data-role="list-divider">数据加载中，请稍候...</li>
	        </ul>
			<div class="iscroll-pullup">
				<span class="iscroll-pull-icon"></span>
				<span class="iscroll-pull-label"></span>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js"></script>
		<script defer="defer" type="text/javascript">
			$('div.delivery-list-index-page').bind("pageinit", function(event) {
				$('div.delivery-list-content').mypullupdown({
					url:'${pageContext.request.contextPath}/delivery/listItems.html',
					onDown: function() {
						var item = $('li.deliverydatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'down',
							'delivery.dateCreated': item.first().attr('timestamp')
						}
					},
					onUp: function() {
						var item = $('li.deliverydatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'up',
							'delivery.dateCreated': item.last().attr('timestamp')
						}
					},
					down: function(html) {
						$('ul.delivery-list-view').prepend(html).listview('refresh');
					},
					up: function(html) {
						$('ul.delivery-list-view').append(html).listview('refresh');
					}
				});
	        	doDeliveryListRequest();
				$('a.delivery-list-page-refresh').click(function(e) {
					$('ul.delivery-list-view').html('<li data-role="list-divider">数据加载中，请稍候...</li>').listview('refresh');
					doDeliveryListRequest();
				});
				$('div.delivery-list-index-page').data('eventbinding', true);
				function doDeliveryListRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/delivery/listItems.html',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.delivery-list-view').html(html).listview('refresh');
						}
					});
				}
			});
		</script>
		<jsp:include page="footer.jsp">
			<jsp:param value="4" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
