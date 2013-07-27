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
						<ul class="breadcrumb" id="X_breadcrumbs_ul"><li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li><li class="active">物流配送列表</li></ul>
					</div>
					<div class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
							</div>
							<div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
								<div class="accordion-inner">
								<form id="myqueryform" action="${pageContext.request.contextPath}/delivery/deliveryList.html" method="get">
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="id">配送编号</label>
												<div class="controls">
													<input type="text" id="id" name="delivery.id"  value="${delivery.id}"  maxlength="20" placeholder="物流配送编号">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="marketarea">市场区域</label>
												<div class="controls">
													<input type="text" id="marketarea" name="delivery.marketarea"  value="${delivery.marketarea}"  maxlength="255" placeholder="市场区域">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="determini">目的地点</label>
												<div class="controls">
													<input type="text" id="determini" name="delivery.determini"  value="${delivery.determini}"  maxlength="255" placeholder="目的地点">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="loadtime">上货时间</label>
												<div class="controls">
													<input type="text" class="span5 loadtime" name="delivery.gtLoadtime"  value="<fmt:formatDate value="${delivery.gtLoadtime}" pattern="yyyy-MM-dd"/>"  maxlength="19" placeholder="上货开始时间">
													<span class="add-on">～</span>
													<input type="text" class="span5 loadtime" name="delivery.ltLoadtime"  value="<fmt:formatDate value="${delivery.ltLoadtime}" pattern="yyyy-MM-dd"/>"  maxlength="19" placeholder="上货结束时间">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="loadaddress">上货地点</label>
												<div class="controls">
													<input type="text" id="loadaddress" name="delivery.loadaddress"  value="${delivery.loadaddress}"  maxlength="255" placeholder="上货地点">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreatedMin">创&nbsp;&nbsp;建&nbsp;&nbsp;人</label>
												<div class="controls">
													<input type="text" id="userCreated" name="delivery.userCreated"  value="${delivery.userCreated}" readonly="readonly"  maxlength="20" placeholder="创建人">
												</div>
											</div>
										</div>
									</div>
								</form>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<p class="text-right">
							<a class="btn btn-small" href="${pageContext.request.contextPath}/delivery/deliveryCreate.html"> <iclass="icon-plus"></i>发布物流配送 </a>
							<button class="btn btn-small" onclick="$('#myqueryform').submit();">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>编号</th>
								<th>市场区域</th>
								<th>目的地点</th>
								<th>上货时间</th>
								<th>上货地点</th>
								<th>箱数</th>
								<th>单位重量</th>
								<th>总箱数</th>
								<th>总重</th>
								<th>通过标识</th>
								<th>申请人</th>
								<th>创建时间</th>
								<th>更新时间</th>
								<th>操作</th>
							</thead>
							<tbody>
							<c:forEach var="item" items="${pagination.list}">
							<tr>
								<td>${item.id}</td>
								<td>${item.marketarea}</td>
								<td>${item.determini}</td>
								<td><fmt:formatDate value="${item.loadtime}" pattern="yyyy-MM-dd hh:mm"/></td>
								<td>${item.loadaddress}</td>
								<td>${item.boxNum}</td>
								<td>${item.unitNum}</td>
								<td>${item.boxTotal}</td>
								<td>${item.totalWeight}</td>
								<td>${item.flagPassName}</td>
								<td>${item.userApply}</td>
								<td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td>
									<a href="${pageContext.request.contextPath}/delivery/deliveryEdit.html?delivery.id=${item.id}" class="btn btn-mini">编辑</a>
									<a href="${pageContext.request.contextPath}/delivery/deliveryItem.html?delivery.id=${item.id}" class="btn btn-mini">详细</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<x:page href="${pageContext.request.contextPath}/delivery/deliveryList.html" pagination="${pagination}"/>
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
			    $("#X_menu_li_delivery").addClass("active");
				$('.loadtime').datepicker({
					language: 'zh-CN',
					format: 'yyyy-MM-dd'
				});
				$('#userCreated').click(function() {
					$('#windowTitleDialoguserinfo').modal('show');
				});
				$('#windowTitleDialoguserinfo').delegate('a.userinfoselect', 'click', function(e) {
					e.preventDefault();
					var $this = $(this);
					$('#userCreated').val($this.attr('attr-id'));
					$this.closest('div.modal').modal('hide');
					return false;
				})
			});
		</script>
	</body>
</html>
