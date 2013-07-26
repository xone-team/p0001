<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>后台</title>
		<jsp:include page="common-header.jsp"></jsp:include>
		<link href="${STATIC_ROOT}/bootstrap-datepicker/css/datepicker.css" rel="stylesheet">
		<link href="${STATIC_ROOT}/bootstrap-select/bootstrap-select.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="common-nav.jsp"></jsp:include>
		<div class="container-fluid">
    		<div class="row-fluid" id="X_bodyContainer">
				<div class="span2">
					<jsp:include page="common-menu.jsp"></jsp:include>
				</div>
				<div class="span10" id="X_contentContainer">
					<div class="row-fluid">
						<ul class="breadcrumb" id="X_breadcrumbs_ul"><li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li><li class="active">广告列表</li></ul>
					</div>
					<div class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
							</div>
							<div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
								<form id="myqueryform" action="${pageContext.request.contextPath}/adbanner/adbannerList.html" method="get">
									<div class="accordion-inner">
										<div class="row-fluid">
											<div class="span5 form-horizontal">
												<div class="control-group">
													<label class="control-label" for="userId">用户编号</label>
													<div class="controls">
														<input type="text" id="userId" name="adbanner.userId" maxlength="20" value="${adbanner.userId}" placeholder="用户编号">
													</div>
												</div>
											</div>
											<div class="span5 form-horizontal">
												<div class="control-group">
													<label class="control-label" for="adType">广告类型</label>
													<div class="controls">
														<select class="selectpicker" id="adType" name="adbanner.adType" maxlength="2" placeholder="广告类型">
															<option value="">全部类型</option>
															<option value="0">售卖产品</option>
															<option value="1">购买产品</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span5 form-horizontal">
												<div class="control-group">
													<label class="control-label" for="adStart">开始时间</label>
													<div class="controls">
														<input type="text" id="adStartMin" name="adbanner.gtAdStart" value="${adbanner.gtAdStart}" class="span5" maxlength="19" placeholder="开始时间">
														<span class="add-on">～</span>
														<input type="text" id="adStartMax" name="adbanner.ltAdStart" value="${adbanner.ltAdStart}" class="span5" maxlength="19" placeholder="结束时间">
													</div>
												</div>
											</div>
											<div class="span5 form-horizontal">
												<div class="control-group">
													<label class="control-label" for="adEnd">结束时间</label>
													<div class="controls">
														<input type="text" id="adEndMin" name="adbanner.gtAdEnd" value="<fmt:formatDate value="${adbanner.gtAdEnd}" pattern="yyyy-MM-dd"/>" class="span5" maxlength="19" placeholder="开始时间">
														<span class="add-on">～</span>
														<input type="text" id="adEndMax" name="adbanner.ltAdEnd" value="<fmt:formatDate value="${adbanner.ltAdEnd}" pattern="yyyy-MM-dd"/>" class="span5" maxlength="19" placeholder="结束时间">
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<p class="text-right">
							<a class="btn btn-small" href="${pageContext.request.contextPath}/adbanner/adbannerCreate.html"> <iclass="icon-plus"></i>发布广告 </a>
							<button class="btn btn-small" onclick="$('#myqueryform').submit();">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>编号</th>
								<th>产品编号</th>
								<th>广告类型</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>创建时间</th>
								<th>修改时间</th>
								<th>用户编号</th>
								<th>操作</th>
							</thead>
							<tbody>
							<c:forEach var="item" items="${pagination.list}">
							<tr>
								<td>${item.id}</td>
								<td>
									<c:choose>
										<c:when test="${item.adType == '0'}"><a href="${pageContext.request.contextPath}/product/productItem.html?product.id=${item.refId}" target="_blank">${item.refId}</a></c:when>
										<c:when test="${item.adType == '1'}"><a href="${pageContext.request.contextPath}/purchase/purchaseItem.html?purchase.id=${item.refId}" target="_blank">${item.refId}</a></c:when>
										<c:otherwise>${item.refId}</c:otherwise>
									</c:choose>
								</td>
								<td>${item.adTypeName}</td>
								<td><fmt:formatDate value="${item.adStart}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td><fmt:formatDate value="${item.adEnd}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td>${item.userId}</td>
								<td>
									<a href="${pageContext.request.contextPath}/adbanner/adbannerEdit.html?adbanner.id=${item.id}" class="btn btn-mini">编辑</a>
									<a href="${pageContext.request.contextPath}/adbanner/adbannerItem.html?adbanner.id=${item.id}" class="btn btn-mini"  target="_blank">详细</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<x:page href="${pageContext.request.contextPath}/adbanner/adbannerList.html" pagination="${pagination}"/>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
		<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
		<jsp:include page="common-modal.jsp">
			<jsp:param name="myidentify" value="userinfo"/>
			<jsp:param name="title" value="请选择一个用户"/>
			<jsp:param name="url" value="${pageContext.request.contextPath }/user/userListAjax.html"/>
		</jsp:include>
		<script type="text/javascript" language="javascript">
			$(document).ready(function() {
				$("#X_menu_li_adbanner").addClass("active");
				$('#adType').val('${adbanner.adType}');
				$('#adStartMin, #adStartMax, #adEndMin, #adEndMax').datepicker({
					language: 'zh-CN',
					format: 'yyyy-MM-dd'
				});
				$('.selectpicker').selectpicker({style: 'btn-info'});
				$('#userId').click(function() {
					$('#windowTitleDialoguserinfo').modal('show');
				});
				$('#windowTitleDialoguserinfo').delegate('a.userinfoselect', 'click', function(e) {
					e.preventDefault();
					var $this = $(this);
					$('#userId').val($this.attr('attr-id'));
					$this.closest('div.modal').modal('hide');
					return false;
				})
			});
		</script>
	</body>
</html>
