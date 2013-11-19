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
		<div data-role="page" data-id="mylinkkeyspage" class="mylinkkeyspage" data-nobanner="true">
			<link rel="stylesheet" href="${STATIC_ROOT}/css/mytablelayout.css" />
			<div data-id="myheader" data-role="header" data-position="fixed" data-tap-toggle="true">
				<a href="${pageContext.request.contextPath}/assistant/guide.html" data-icon="home">首页</a>
				<h1>定制快捷方式</h1>
				<a href="#" class="ui-btn-right" onclick="$.makeCall('4008979727');" data-icon="tel-24">客服</a>
			</div>
			<div data-role="content" class="guide-page">
				<style type="text/css">
					.mycorrect {
						width:21px;
						height:21px;
						position:absolute;
						top:0px;
						left:0px;
						z-index:1;
						background:url('${STATIC_ROOT}/css/images/right_n.png') transparent no-repeat center;
					}
					.myadd {
						width:21px;
						height:21px;
						position:absolute;
						top:0px;
						left:0px;
						z-index:1;
						background:url('${STATIC_ROOT}/css/images/plus_n.png') transparent no-repeat center;
					}
					.myouter {
						position:relative;
					}
				</style>
				<div class="ui-grid-solo" style="padding-top:0px;">
					<table class="guide-page-table">
						<tbody>
							<c:forEach var="item" items="${links}" varStatus="status">
								<c:set var="select" value="myadd"/>
								<c:if test="${item.selected}"><c:set var="select" value="mycorrect"/></c:if>
								<c:if test="${status.index % 3 == 0}"><tr></c:if>
								<td>
									<div class="myouter">
										<a href="#" linkno="${item.linkNo}"><img src="${STATIC_ROOT}${item.img}"></a>
										<div class="${select}"></div>
									</div>
								</td>
								<c:if test="${status.index % 3 == 2 || status.last}"></tr></c:if>
							</c:forEach>
						</tbody>
					</table>
					<script type="text/javascript">
						$('div.mylinkkeyspage').bind('pageinit', function() {
							$('.guide-page-table img').height(($(document).width() - 24) / 3);
							$('div.mylinkkeyspage').delegate('div.myouter a', 'click', function(e) {
								e.preventDefault();
								var $this = $(this);
								$.ajax({
									type: 'POST',
									url: '${pageContext.request.contextPath}/assistant/dolink.html',
									data: 'linkno=' + $this.attr('linkno') + '&_=' + new Date().getTime(),
									divicon: $this.parent().find('div'),
									dataType: 'json',
									success: function(o) {
										if (o.UR == 'create') {
											this.divicon.removeClass('myadd').addClass('mycorrect');
										} else if (o.UR == 'remove') {
											this.divicon.removeClass('mycorrect').addClass('myadd');
										}
									}
								});
							});
						});
					</script>
				</div>
			</div>
			<jsp:include page="footer.jsp"><jsp:param value="2" name="offset"/></jsp:include>
		</div>
	</body>
</html>
