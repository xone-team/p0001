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
	<div data-role="page" class="productuseroverheaditempage">
		<style type="text/css">
			td.mylabel {
				width:80px;
			}
		</style>
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-tap-toggle="false" data-position="fixed">
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>用户顶置申请详情</h1>
			<a href="${pageContext.request.contextPath}/product/overheaditemForUser.html?overhead.id=${overhead.id}" class="ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content" data-dom-cache="false">
			<c:if test="${!empty mapValue}">
				<div class="error">${mapValue['msg']}</div>
			</c:if>
			<ul class="product-user-overheaditem-page-view" data-role="listview" data-inset="true" data-mini="true">
				<li data-role="list-divider">顶置申请信息</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">编　　号:</td>
							<td>${overhead.id}</td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">产品类型:</td>
							<td>${overhead.overheadTypeName}</td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">产品编号:</td>
							<td>${overhead.refId}</td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">申请日期:</td>
							<td><fmt:formatDate value="${overhead.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">状　　态:</td>
							<td>${overhead.checkStatusName}</td>
						</tr>
					</table>
				</li>
				<c:if test="${not empty overhead.dateCheck}">
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">审核日期:</td>
							<td><fmt:formatDate value="${overhead.dateCheck}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">审核备注:</td>
							<td>${overhead.remark}</td>
						</tr>
					</table>
				</li>
				</c:if>
				<c:if test="${overhead.checkStatus != '1'}">
				<li>
					<div>
						<form class="overheaditemform" action="${pageContext.request.contextPath}/product/doCancelOverhead.html" method="post">
							<input type="hidden" name="overhead.id" value="${overhead.id}">
							<a href="#" class="overheaditemformbutton" data-role="button" data-icon="delete" data-theme="b" data-iconpos="right">取消顶置申请</a>
						</form>
						<script type="text/javascript">
							$('a.overheaditemformbutton').click(function(e) {
								e.preventDefault();
								$.myConfirm('确认取消顶置', function() {
									var $form = $('form.overheaditemform').first();
									$.ajax({
										type: $form.attr('method'),
										url: $form.attr('action'),
										data: $form.serialize(),
										success: function(html) {
											$('form.overheaditemform').closest('li').html(html);
										}
									});
								});
								return false;
							});
						</script>
					</div>
				</li>
				</c:if>
			</ul>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
