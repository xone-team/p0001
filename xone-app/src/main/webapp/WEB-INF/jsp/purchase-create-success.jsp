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
	<div data-role="page" class="purchasesuccesspage">
		<div data-id="myheader" data-role="header" data-tap-toggle="false" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/assistant/index.html?_=${identify}" data-icon="check" class="btn-banner">返回</a>
			<h1>求购发布成功</h1>
		</div>
		<div data-role="content" data-dom-cache="false">
			<ul class="purchase-success-view" data-role="listview" data-inset="true" data-mini="true">
				<li data-role="list-divider"><h4>求购发布成功</h4></li>
				<li class="purchasesuccessloading"><a href="#">No.${purchase.id}详细信息加载中...</a></li>
			</ul>
			<c:forEach var="id" items="${purchase.ids}" >
			<div>
				<img alt="" src="${pageContext.request.contextPath}/assistant/image.html?id=${id}">
			</div>
			</c:forEach>
			<script type="text/javascript" language="javascript">
				$(document).delegate('div.purchasesuccesspage', "pageinit", function() {
// 					$.ajax({
// 						type: 'GET',
// 						url: '${pageContext.request.contextPath}/purchase/itemDetails.html',
// 						data: '_=' + new Date().getTime() + '&id=' + '${purchase.id}',
// 						success: function(html) {
// 							$('li.purchasesuccessloading').remove();
// 							$('ul.purchase-success-view').append(html).listview('refresh');
// 						}
// 					});
				});
			</script>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="3" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
