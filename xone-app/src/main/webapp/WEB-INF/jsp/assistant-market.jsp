<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML><c:set var="myid" value="${identify}" />
<html>
	<head>
		<title>Assistant Market</title>
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body><c:set var="myid" value="${identify}" />
		<div id="assistant-market" data-role="page" data-id="mymarketpage">
			<div data-id="myheader" data-role="header" data-position="fixed" data-tap-toggle="true">
			<a href="#" data-rel="back" data-icon="back">返回</a>
				<h1>逛逛市场</h1>
				<a href="#" class="ui-btn-right" onclick="$.makeCall('4008979727');" data-icon="grid">客服</a>
			</div>
			<div data-role="content" class="market-page">
				<div data-role="collapsible" data-collapsed="false" data-content-theme="d">
			        <h3>看看大家在卖什么</h3>
					<ul data-role="listview" data-inset="true" data-divider-theme="d">
					    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/product_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/product/index.html">大家在卖什么</a></li>
					    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/sale_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/product/listSales.html">逛一逛促销</a></li>
					    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/groups_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/product/listGroups.html">看一看组团</a></li>
					</ul>
			    </div>
			    <div data-role="collapsible" data-collapsed="false" data-content-theme="d">
			        <h3>瞧瞧大家想买什么</h3>
					<ul data-role="listview" data-inset="true" data-divider-theme="d">
					    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/purchase_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/purchase/index.html">大家想买什么</a></li>
					</ul>
			    </div>
			</div>
			<jsp:include page="footer.jsp"><jsp:param value="1" name="offset"/></jsp:include>
		</div>
		<script type="text/javascript" language="javascript">  
	    $('div.market-page').bind('pageinit', function(e, ui) {
	    });
		</script>
	</body>
</html>
