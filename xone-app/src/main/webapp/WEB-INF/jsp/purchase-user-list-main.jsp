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
	<div data-role="page" class="purchase-list-for-user-page">
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-position="fixed">
<%-- 			<a href="${pageContext.request.contextPath}/login/index.html?_=${identify}" data-icon="check" class="btn-banner">返回</a> --%>
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>用户求购列表</h1>
			<a href="#" class="purchase-list-for-user-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content">
<!-- 			<div style="height:10px">&nbsp;</div> -->
<!-- 			padding-top:10px; -->
			<div class="purchase-list-for-user-main" style="width:100%;" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
				<ul class="ul-purchase-list-for-user" data-role="listview" data-inset="true">
		        	<li data-role="list-divider">数据加载中，请稍候...</li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$('div.purchase-list-for-user-page').bind("pageinit", function(event) {
				$('div.purchase-list-for-user-main').mypullupdown({
					url:'${pageContext.request.contextPath}/purchase/listItemsForUser.html',
					onDown: function() {
						var item = $('li.purchasedatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'down',
							'purchase.dateCreated': item.first().attr('timestamp')
						}
					},
					onUp: function() {
						var item = $('li.purchasedatecreateditem');
						return {
							'itemcount': item.length,
							'itemaction': 'up',
							'purchase.dateCreated': item.last().attr('timestamp')
						}
					},
					down: function(html) {
						$('ul.ul-purchase-list-for-user').prepend(html).listview('refresh');
					},
					up: function(html) {
						$('ul.ul-purchase-list-for-user').append(html).listview('refresh');
					}
				});
	        	doRequest();
				$('a.purchase-list-for-user-page-refresh').click(function(e) {
					$('ul.ul-purchase-list-for-user').html('<li data-role="list-divider">数据加载中，请稍候...</li>').listview('refresh');
					doRequest();
				});
				$('div.purchase-list-for-user-page').data('eventbinding', true);
				function doRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/purchase/listItemsForUser.html',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.ul-purchase-list-for-user').html(html).listview('refresh');
							fixedPurchaseImage();
						}
					});
				}
				function fixedPurchaseImage() {
					if (!$('div.purchase-list-for-user-page').data('cssbinding')) {
// 						var height = $('li.purchasedatecreateditem:eq(0)').height();
// 						var css = ['<style type="text/css"> img.purchaseliimage {width:', height, 'px;', 'width:', height, 'px;}</style>'];
// 						$('div.purchase-list-for-user-page').append(css.join(''));
						var lis = $('li.purchasedatecreateditem:eq(0)');
						if (lis.length > 0) {
							var height = lis.height() - 3;
							var css = ['<style type="text/css"> img.purchaseliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
							$('div.purchase-list-for-user-page').append(css.join(''));
						}
						$('div.purchase-list-for-user-page').data('cssbinding', true);
					}
				}
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
