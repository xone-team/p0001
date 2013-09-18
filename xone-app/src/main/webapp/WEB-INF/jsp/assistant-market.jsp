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
			    <div class="ui-grid-a">
				    <div class="ui-block-a">
				    	<div class="ui-bar">
							<div class="desktop-icon" style="text-align:center;">
				    		<a href="${pageContext.request.contextPath}/product/index.html" class="ui-btn-up-no" data-theme="no" data-shadow="false" data-role="button" data-icon="sale-b-64" data-iconpos="top" data-inline="true">大家在卖</a>
							</div>
				    	</div>
				    </div>
				    <div class="ui-block-b">
				    	<div class="ui-bar">
							<div class="desktop-icon" style="text-align:center;">
							<a href="${pageContext.request.contextPath}/purchase/index.html" class="ui-btn-up-no" data-theme="no" data-shadow="false" data-role="button" data-icon="sale-d-64" data-iconpos="top" data-inline="true">大家想买</a>
							</div>
				    	</div>
				    </div>
				</div>
			</div>
			<jsp:include page="footer.jsp"><jsp:param value="1" name="offset"/></jsp:include>
		</div>
		<script type="text/javascript" language="javascript">  
	    $('div.market-page').bind('pageinit', function(e, ui) {
	    	$('a.login-logout${myid}').click(function(e) {
		    	try {
		    		$.rockRoll('');
		    	} catch (e) {
		    	}
		    	return true;
	    	});
	    });
		</script>
	</body>
</html>
