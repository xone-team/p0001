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
	<div data-role="page" class="purchase-main-page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<h1>求购列表</h1>
			<a href="#" class="purchase-list-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content">
			<div style="height:10px">&nbsp;</div>
			<div class="purchase-list-main" style="width:100%;padding-top:10px;" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
				<ul class="ul-purchase-list" data-role="listview" data-filter="true" data-filter-placeholder="产品搜索..." data-inset="true">
		        	<li data-role="list-divider">数据加载中，请稍候...</li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js"></script>
		<script type="text/javascript">
			$('div.purchase-main-page').bind("pageinit", function(event) {
				$('div.purchase-list-main').mypullupdown({
					url:'${pageContext.request.contextPath}/purchase/listItems.html',
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
						$('ul.ul-purchase-list').prepend(html).listview('refresh');
	// 					fixedPurchaseImage();
					},
					up: function(html) {
						$('ul.ul-purchase-list').append(html).listview('refresh');
					}
				});
	        	doRequest();
				$('a.purchase-list-page-refresh').click(function(e) {
					$('ul.ul-purchase-list').html('<li data-role="list-divider">数据加载中，请稍候...</li>').listview('refresh');
					doRequest();
				});
				$('div.purchase-main-page').data('eventbinding', true);
				function doRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/purchase/listItems.html',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.ul-purchase-list').html(html).listview('refresh');
							fixedPurchaseImage();
						}
					});
				}
				function fixedPurchaseImage() {
					var lis = $('li.purchasedatecreateditem:eq(0)');
					if (lis.length > 0) {
						var height = lis.height() - 3;
						var css = ['<style type="text/css"> img.purchaseliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
						$('div.purchase-main-page').append(css.join(''));
					}
				}
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="2" name="offset"/></jsp:include>
	</div>
	</body>
</html>
