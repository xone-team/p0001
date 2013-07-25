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
						<ul class="breadcrumb" id="X_breadcrumbs_ul"><li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li><li class="active">列表</li></ul>
					</div>
					<div class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
							</div>
							<div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
								<div class="accordion-inner">
								<form id="myqueryform" action="${pageContext.request.contextPath}/adbanner/adbannerList.html" method="get">
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="id">编号</label>
												<div class="controls">
													<input type="text" id="id" name="adbanner.id"  value="${adbanner.id}"  maxlength="20" placeholder="编号">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="refId">相关编号</label>
												<div class="controls">
													<input type="text" id="refId" name="adbanner.refId"  value="${adbanner.refId}"  maxlength="20" placeholder="相关编号">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="adType">广告类型</label>
												<div class="controls">
													<input type="text" id="adType" name="adbanner.adType"  value="${adbanner.adType}"  maxlength="2" placeholder="广告类型">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="adRefId">相关编号</label>
												<div class="controls">
													<input type="text" id="adRefId" name="adbanner.adRefId"  value="${adbanner.adRefId}"  maxlength="20" placeholder="相关编号">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="adStartMin">开始时间</label>
												<div class="controls">
													<input type="text" id="adStartMin" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.adStartMin"  value="${adbanner.adStartMin}"  maxlength="19" placeholder="开始时间">
													<span class="add-on">~</span>
													<input type="text" id="adStartMax" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.adStartMax"  value="${adbanner.adStartMax}"  maxlength="19" placeholder="开始时间">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="adEndMin">结束时间</label>
												<div class="controls">
													<input type="text" id="adEndMin" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.adEndMin"  value="${adbanner.adEndMin}"  maxlength="19" placeholder="结束时间">
													<span class="add-on">~</span>
													<input type="text" id="adEndMax" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.adEndMax"  value="${adbanner.adEndMax}"  maxlength="19" placeholder="结束时间">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userId">用户编号</label>
												<div class="controls">
													<input type="text" id="userId" name="adbanner.userId"  value="${adbanner.userId}"  maxlength="20" placeholder="用户编号">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="flagDeleted">删除标识</label>
												<div class="controls">
													<input type="text" id="flagDeleted" name="adbanner.flagDeleted"  value="${adbanner.flagDeleted}"  maxlength="1" placeholder="删除标识">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userApply">申请人</label>
												<div class="controls">
													<input type="text" id="userApply" name="adbanner.userApply"  value="${adbanner.userApply}"  maxlength="20" placeholder="申请人">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateApplyMin">申请时间</label>
												<div class="controls">
													<input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.dateApplyMin"  value="${adbanner.dateApplyMin}"  maxlength="19" placeholder="申请时间">
													<span class="add-on">~</span>
													<input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.dateApplyMax"  value="${adbanner.dateApplyMax}"  maxlength="19" placeholder="申请时间">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCheck">审核人</label>
												<div class="controls">
													<input type="text" id="userCheck" name="adbanner.userCheck"  value="${adbanner.userCheck}"  maxlength="20" placeholder="审核人">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCheckMin">审核时间</label>
												<div class="controls">
													<input type="text" id="dateCheckMin" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.dateCheckMin"  value="${adbanner.dateCheckMin}"  maxlength="19" placeholder="审核时间">
													<span class="add-on">~</span>
													<input type="text" id="dateCheckMax" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.dateCheckMax"  value="${adbanner.dateCheckMax}"  maxlength="19" placeholder="审核时间">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreated">创建人</label>
												<div class="controls">
													<input type="text" id="userCreated" name="adbanner.userCreated"  value="${adbanner.userCreated}"  maxlength="20" placeholder="创建人">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCreatedMin">创建时间</label>
												<div class="controls">
													<input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.dateCreatedMin"  value="${adbanner.dateCreatedMin}"  maxlength="19" placeholder="创建时间">
													<span class="add-on">~</span>
													<input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.dateCreatedMax"  value="${adbanner.dateCreatedMax}"  maxlength="19" placeholder="创建时间">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userUpdated">更新人</label>
												<div class="controls">
													<input type="text" id="userUpdated" name="adbanner.userUpdated"  value="${adbanner.userUpdated}"  maxlength="20" placeholder="更新人">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="lastUpdatedMin">更新时间</label>
												<div class="controls">
													<input type="text" id="lastUpdatedMin" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.lastUpdatedMin"  value="${adbanner.lastUpdatedMin}"  maxlength="19" placeholder="更新时间">
													<span class="add-on">~</span>
													<input type="text" id="lastUpdatedMax" class="span5 Wdate" onclick="WdatePicker()" name="adbanner.lastUpdatedMax"  value="${adbanner.lastUpdatedMax}"  maxlength="19" placeholder="更新时间">
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
							<a class="btn btn-small" href="${pageContext.request.contextPath}/adbanner/adbannerCreate.html"> <iclass="icon-plus"></i>创建 </a>
							<button class="btn btn-small" onclick="$('#myqueryform').submit();">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>编号</th>
								<th>相关编号</th>
								<th>广告类型</th>
								<th>相关编号</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>用户编号</th>
								<th>删除标识</th>
								<th>申请人</th>
								<th>申请时间</th>
								<th>审核人</th>
								<th>审核时间</th>
								<th>创建人</th>
								<th>创建时间</th>
								<th>更新人</th>
								<th>更新时间</th>
							</thead>
							<tbody>
							<c:forEach var="item" items="${pagination.list}">
							<tr>
								<td>${item.id}</td>
								<td>${item.refId}</td>
								<td>${item.adType}</td>
								<td>${item.adRefId}</td>
								<td>${item.adStart}</td>
								<td>${item.adEnd}</td>
								<td>${item.userId}</td>
								<td>${item.flagDeleted}</td>
								<td>${item.userApply}</td>
								<td>${item.dateApply}</td>
								<td>${item.userCheck}</td>
								<td>${item.dateCheck}</td>
								<td>${item.userCreated}</td>
								<td>${item.dateCreated}</td>
								<td>${item.userUpdated}</td>
								<td>${item.lastUpdated}</td>
								<td>
									<a href="${pageContext.request.contextPath}/adbanner/adbannerEdit.html?adbanner.id=${item.id}" class="btn btn-mini">编辑</a>
									<a href="${pageContext.request.contextPath}/adbanner/adbannerItem.html?adbanner.id=${item.id}" class="btn btn-mini">详细</a>
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
	</body>
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_adbanner").addClass("active");
	 });
	</script>
</html>
