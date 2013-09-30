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
				<a href="${pageContext.request.contextPath}/login/indexRegister.html" data-icon="check">注册</a>
				<h1>欢迎使用</h1>
				<a href="#" class="ui-btn-right" onclick="$.makeCall('4008979727');" data-icon="grid">客服</a>
			</div>
			<div data-role="content" class="guide-page">
				<div class="ui-grid-solo" style="padding:0px;clear:both;">
					<div class="guide-advertisement" style="overflow:hidden;clear:both;">
						<a class="car-img" href="${pageContext.request.contextPath}/product/listSales.html"><img src="${STATIC_ROOT}/image/picture1.jpg"></a>
						<a class="car-img" href="${pageContext.request.contextPath}/purchase/index.html"><img src="${STATIC_ROOT}/image/picture2.jpg"></a>
						<a class="car-img" href="${pageContext.request.contextPath}/product/listGroups.html"><img src="${STATIC_ROOT}/image/picture3.jpg"></a>
						<a class="car-img" href="${pageContext.request.contextPath}/delivery/index.html"><img src="${STATIC_ROOT}/image/picture4.jpg"></a>
						<a class="car-img" href="${pageContext.request.contextPath}/login/indexRegister.html"><img src="${STATIC_ROOT}/image/picture5.jpg"></a>
						<a class="car-img" href="#"><img src="${STATIC_ROOT}/image/picture6.jpg"></a>
						<a class="car-img" href="#"><img src="${STATIC_ROOT}/image/picture7.jpg"></a>
						<a class="car-img" href="#"><img src="${STATIC_ROOT}/image/picture8.jpg"></a>
						<a class="car-img" href="#"><img src="${STATIC_ROOT}/image/picture9.jpg"></a>
						<a class="car-img" href="#"><img src="${STATIC_ROOT}/image/pic12.jpg"></a>
					</div>
				</div>
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
											<td class="${item.linkType}">
												<a href="${pageContext.request.contextPath}${item.link}" data-role="none" style="display:block;width:100%;height:100%;">&nbsp;</a>
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
