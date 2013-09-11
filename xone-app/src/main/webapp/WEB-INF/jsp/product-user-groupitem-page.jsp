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
	<div data-role="page" class="productusergroupitempage">
		<style type="text/css">
			td.mylabel {
				width:80px;
			}
		</style>
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-tap-toggle="false" data-position="fixed">
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>组团产品详情</h1>
			<a href="#" class="product-user-groupitem-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content" data-dom-cache="false">
			<c:if test="${!empty mapValue}">
				<div class="error">${mapValue['msg']}</div>
			</c:if>
			<ul class="product-user-groupitem-page-view" data-role="listview" data-inset="true" data-mini="true"></ul>
			<script type="text/javascript" language="javascript">
				$('div.productusergroupitempage').bind("pageinit", function() {
					var width = $('div.productusergroupitempage').width() - 11;
					var css = ['<style type="text/css">div.productimage {text-align:center;height:', width, 'px;width:', width, 'px;}',
					           'div.productimage img {width:', width,'px;height:', width, 'px;}',
					'<\/style>'];
					$('div.productusergroupitempage').append(css.join(''));
					doGroupItemRequest();
					$('a.product-user-groupitem-page-refresh').click(function(e) {
						doGroupItemRequest();
					});
					function doGroupItemRequest() {
						$('ul.product-user-groupitem-page-view').html('<li data-icon="none"><a href="#">详细信息加载中...</a></li>').listview('refresh');
						$.ajax({
							type: 'GET',
							url: '${pageContext.request.contextPath}/product/groupitemDetailsForUser.html',
							data: '_=' + new Date().getTime() + '&productGroup.id=' + '${productGroup.id}',
							success: function(html) {
								$('ul.product-user-groupitem-page-view').html(html).listview('refresh');
							},
							error: function() {
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
