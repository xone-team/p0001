<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML><c:set var="myid" value="${identify}" />
<html>
	<head>
		<title>Assistant Guide</title>
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body><c:set var="myid" value="${identify}" />
		<div id="assistant-guide${myid}" data-role="page" data-id="myguidepage" data-nobanner="true">
			<link rel="stylesheet" href="${STATIC_ROOT}/css/mycarousel.css" />
			<link rel="stylesheet" href="${STATIC_ROOT}/css/mytablelayout.css" />
			<script type="text/javascript" src="${STATIC_ROOT}/js/mycarousel.js"></script>
			<div data-id="myheader" data-role="header" data-position="fixed" data-tap-toggle="true">
				<a href="${pageContext.request.contextPath}/login/indexRegister.html" data-icon="edit">注册</a>
				<h1><img src="${STATIC_ROOT}/image/header_logo.png" width="25px" height="16px">欢迎使用</h1>
				<a href="#" class="ui-btn-right" onclick="$.makeCall('4008979727');" data-icon="tel-24">客服</a>
			</div>
			<div data-role="content" class="guide-page">
				<c:if test="${!(empty adList)}">
				<div class="ui-grid-solo" style="padding:0px;clear:both;">
					<div class="guide-advertisement" style="overflow:hidden;clear:both;">
						<c:forEach var="item" items="${adList}">
							<c:set var="href" value="#" />
							<c:choose>
								<c:when test="${item.adType == '0'}">
									<c:set var="href" value="${pageContext.request.contextPath}/product/item.html?product.id=${item.refId}" />
								</c:when>
								<c:when test="${item.adType == '1'}">
									<c:set var="href" value="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.refId}" />
								</c:when>
								<c:when test="${item.adType == '2'}">
									<c:set var="href" value="${pageContext.request.contextPath}/assistant/companyInfo.html?companyInfo.id=${item.refId}" />
								</c:when>
							</c:choose>
							<a class="car-img" href="${href}"><img src="${pageContext.request.contextPath}/assistant/image.html?id=${item.adRefId}"></a>
						</c:forEach>
					</div>
				</div>
				</c:if>
				<div class="ui-grid-solo" style="padding-top:0px;">
					<table class="guide-page-table">
						<tbody>
							<c:forEach var="item" items="${links}" varStatus="status">
								<c:if test="${status.index % 3 == 0}"><tr></c:if>
									<c:choose>
										<c:when test="${item.linkType == 'http'}">
											<td>
												<div>
													<a href="${pageContext.request.contextPath}${item.link}" data-role="none"><img src="${STATIC_ROOT}${item.img}"></a>
												</div>
											</td>
										</c:when>
										<c:when test="${item.linkType == 'js' }">
											<td>
												<div>
													<a href="javascript:void(0)" onclick="${item.link}" data-role="none"><img src="${STATIC_ROOT}${item.img}"></a>
												</div>
											</td>
										</c:when>
										<c:when test="${item.linkType == 'add' }">
											<td>
												<div>
													<a href="${pageContext.request.contextPath}${item.link}" data-role="none"><img src="${STATIC_ROOT}/image/MORE.png"></a>
												<div>
											</td>
										</c:when>
										<c:otherwise><td></td></c:otherwise>
									</c:choose>
								<c:if test="${status.index % 3 == 2 || status.last}"></tr></c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<script type="text/javascript" language="javascript">  
		    $('#assistant-guide${myid}').bind('pageinit', function() {
		    	$('a.login-logout${myid}').click(function(e) {
			    	try {
			    		$.rockRoll('');
			    	} catch (e) {
			    	}
			    	return true;
		    	});
		    	var width = ($(document).width() - 24) / 3;
				$('.guide-page-table img').height(width);
				$('.guide-page-table .add').width(width)
		    });
		    $('#assistant-guide${myid}').bind('pageshow', function() {
// 		    	var guide = $('.guide-advertisement');
// 		    	var width = guide.closest('div.ui-grid-solo').first().width();
		    	$('div.guide-advertisement').mycarousel({
					width: $('div.guide-advertisement').width(),
					height: 140,
					auto: true
				});
		    });
			</script>
			<jsp:include page="footer.jsp"><jsp:param value="2" name="offset"/></jsp:include>
		</div>
	</body>
</html>
