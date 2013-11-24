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
	<div data-role="page" class="deliverysuccesspage">
		<style type="text/css">
			td.mylabel {
				width:80px;
			}
		</style><c:set var="myid" value="${identify}" />
		<div data-id="myheader" data-role="header" data-position="fixed">
<%-- 			<a href="${pageContext.request.contextPath}/assistant/index.html?_=${myid}" data-icon="check" class="btn-banner">返回</a> --%>
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>物流配送</h1>
			<a href="#" class="delivery-success-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content" data-dom-cache="false">
			<ul class="delivery-success-view" data-role="listview" data-inset="true" data-mini="true">
				<li data-role="list-divider" data-theme="e"><h4>物流信息发送成功</h4></li>
				<li class="deliverysuccessloading"><a href="#">详细信息加载中...</a></li>
			</ul>
			<script type="text/javascript" language="javascript">
				$('div.deliverysuccesspage').bind("pageinit", function() {
					dodeliveryrefresh();
					$('a.delivery-success-page-refresh').click(function() {
						dodeliveryrefresh();
					});
				});
				function dodeliveryrefresh() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/delivery/itemDetails.html',
						data: '_=' + new Date().getTime() + '&id=' + '${delivery.id}',
						success: function(html) {
							$('ul.delivery-success-view').find('li[data-role!="list-divider"]').remove();
							$('ul.delivery-success-view').append(html).listview('refresh');
						}
					});
				}
			</script>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="3" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
