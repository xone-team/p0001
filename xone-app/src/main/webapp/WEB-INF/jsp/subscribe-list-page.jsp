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
	<div data-role="page" class="subscribe-list-page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/login/index.html?_=${identify}" data-icon="check">返回</a>
			<h1>订阅列表</h1>
			<a href="${pageContext.request.contextPath}/subscribe/add.html?_=${identify}" class="ui-btn-right" data-icon="refresh">订阅</a>
		</div>
		<div data-role="content" class="subscribe-list-content" data-iscroll>
			<div class="iscroll-pulldown">
		        <span class="iscroll-pull-icon"></span>
		        <span class="iscroll-pull-label"></span>
			</div>
			<ul class="ul-subscribe-list" data-role="listview" data-inset="true">
	        	<li data-role="list-divider">数据加载中，请稍候...</li>
	        </ul>
			<div class="iscroll-pullup">
				<span class="iscroll-pull-icon"></span>
				<span class="iscroll-pull-label"></span>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js"></script>
		<script type="text/javascript">
			$('div.subscribe-list-page').bind("pageinit", function(event) {
				$('div.subscribe-list-content').mypullupdown({
					url:'${pageContext.request.contextPath}/subscribe/items.html',
					onDown: function() {
						var item = $('li.subscribedatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'down',
							'subscribe.dateCreated': item.first().attr('timestamp')
						}
					},
					onUp: function() {
						var item = $('li.subscribedatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'up',
							'subscribe.dateCreated': item.last().attr('timestamp')
						}
					},
					down: function(html) {
						$('ul.ul-subscribe-list').prepend(html).listview('refresh');
					},
					up: function(html) {
						$('ul.ul-subscribe-list').append(html).listview('refresh');
					}
				});
	        	doSubscribeRequest();
				$('a.subscribe-list-page-refresh').click(function(e) {
					$('ul.ul-subscribe-list').html('<li data-role="list-divider">数据加载中，请稍候...</li>').listview('refresh');
					doSubscribeRequest();
				});
				function doSubscribeRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/subscribe/items.html',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.ul-subscribe-list').html(html).listview('refresh');
						}
					});
				}
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
