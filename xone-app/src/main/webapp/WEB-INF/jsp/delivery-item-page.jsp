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
	<div data-role="page" class="deliveryitempage" data-dom-cache="false">
		<style type="text/css">
			td.mylabel {
				width:80px;
			}
		</style>
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-tap-toggle="false" data-position="fixed">
<%-- 			<a href="${pageContext.request.contextPath}/delivery/listIndex.html?_=${identify}" data-icon="check" class="btn-banner">返回</a> --%>
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>物流配送详情</h1>
			<a href="#" class="delivery-item-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content" data-dom-cache="false">
			<ul class="delivery-item-page-view" data-role="listview" data-inset="true" data-mini="true"></ul>
			<script type="text/javascript" language="javascript">
				$('div.deliveryitempage').bind("pageinit", function() {
					doRequest();
					$('a.delivery-item-page-refresh').click(function(e) {
						doRequest();
					});
					function doRequest() {
						$('ul.delivery-item-page-view').html('<li data-icon="none" class="deliverypageitemloading"><a href="#">详细信息加载中...</a></li>').listview('refresh');
						$.ajax({
							type: 'GET',
							url: '${pageContext.request.contextPath}/delivery/itemDetails.html',
							data: '_=' + new Date().getTime() + '&id=' + '${delivery.id}',
							success: function(html) {
								$('ul.delivery-item-page-view').html(html).listview('refresh');
							},
							error: function() {
							}
						});
					}
				});
			</script>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="4" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
