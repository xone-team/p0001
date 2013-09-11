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
	<div data-role="page" class="purchaseuseritempage" data-dom-cache="false">
		<style type="text/css">
			td.mylabel {
				width:80px;
			}
		</style>
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-tap-toggle="false" data-position="fixed">
<%-- 			<a href="${pageContext.request.contextPath}/purchase/listAllForUser.html?_=${identify}" data-icon="check" class="btn-banner">返回</a> --%>
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>求购详情</h1>
			<a href="#" class="purchase-user-item-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content" data-dom-cache="false">
			<c:if test="${!empty mapValue}">
				<div class="error">${mapValue['msg']}</div>
			</c:if>
			<ul class="purchase-user-item-page-view" data-role="listview" data-inset="true" data-mini="true"></ul>
			<script type="text/javascript" language="javascript">
				$('div.purchaseuseritempage').bind("pageinit", function() {
					var width = $('div.purchaseuseritempage').width() - 11;
					var css = ['<style type="text/css">div.purchaseimage {text-align:center;height:', width, 'px;width:', width, 'px;}',
					           'div.purchaseimage img {width:', width,'px;height:', width, 'px;}',
					'<\/style>'];
					$('div.purchaseuseritempage').append(css.join(''));
// 					$(document).on('load', 'img.purchaseliimage', function() {
// 						var t = $(this);
// 						t.css({
// 							height: width + 'px',
// 							width: width + 'px'
// 						});
// 						t.attr('height', width + 'px').attr('width', width + 'px');
// 						console('<div>src=' + t.attr('src') + ', width=' + t.width() + ', height=' + t.height() +  + '</div>');
// 					});
					doRequest();
					$('a.purchase-user-item-page-refresh').click(function(e) {
						doRequest();
					});
					function doRequest() {
						$.mobile.loading('show');
						$('ul.purchase-user-item-page-view').html('<li data-icon="none"><a href="#">详细信息加载中...</a></li>').listview('refresh');
						$.ajax({
							type: 'GET',
							url: '${pageContext.request.contextPath}/purchase/itemDetailsForUser.html',
							data: '_=' + new Date().getTime() + '&purchase.id=' + '${purchase.id}',
							success: function(html) {
								$('ul.purchase-user-item-page-view').html(html).listview('refresh');
								$.mobile.loading('hide');
							},
							error: function() {
								$.mobile.loading('hide');
							}
						});
					}
				});
			</script>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
