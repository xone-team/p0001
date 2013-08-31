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
	<div data-role="page" class="adbanner-main-page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/login/index.html?_=${identify}" data-icon="check">返回</a>
			<h1>我的广告列表</h1>
			<a href="#" class="adbanner-list-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content" class="adbanner-list-main" data-iscroll>
			<div class="iscroll-pulldown">
		        <span class="iscroll-pull-icon"></span>
		        <span class="iscroll-pull-label"></span>
			</div>
			<ul class="ul-adbanner-list" data-role="listview" data-inset="true">
	        	<li data-role="list-divider">数据加载中，请稍候...</li>
	        </ul>
			<div class="iscroll-pullup">
				<span class="iscroll-pull-icon"></span>
				<span class="iscroll-pull-label"></span>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js"></script>
		<script type="text/javascript">
			$('div.adbanner-main-page').bind("pageinit", function(event) {
				$('div.adbanner-list-main').mypullupdown({
					url:'${pageContext.request.contextPath}/adbanner/items.html',
					onDown: function() {
						var item = $('li.adbannerdatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'down',
							'adbanner.dateCreated': item.first().attr('timestamp')
						}
					},
					onUp: function() {
						var item = $('li.adbannerdatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'up',
							'adbanner.dateCreated': item.last().attr('timestamp')
						}
					},
					down: function(html) {
						$('ul.ul-adbanner-list').prepend(html).listview('refresh');
					},
					up: function(html) {
						$('ul.ul-adbanner-list').append(html).listview('refresh');
					}
				});
	        	doRequest();
				$('a.adbanner-list-page-refresh').click(function(e) {
					$('ul.ul-adbanner-list').html('<li data-role="list-divider">数据加载中，请稍候...</li>').listview('refresh');
					doRequest();
				});
				function doRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/adbanner/items.html',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.ul-adbanner-list').html(html).listview('refresh');
							fixedAdbannerImage();
						}
					});
				}
				function fixedAdbannerImage() {
					var li = $('li.adbannerdatecreateditem:eq(0)');
					if (li.length > 0) {
						var height = li.height() - 5;
						var width = li.width() - 3;
						var css = ['<style type="text/css"> img.adbannerliimage {height:', height, 'px;width:', width, 'px;}</style>'];
						$('div.adbanner-main-page').append(css.join(''));
					}
				}
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
