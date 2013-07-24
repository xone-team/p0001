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
						<ul class="breadcrumb" id="X_breadcrumbs_ul"><li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li><li class="active">Adbanner列表</li></ul>
					</div>
					<div class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
							</div>
							<div class="accordion-body in collapse" style="height: auto;">
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
													<label class="control-label" for="refId">相关编号</label>
													<div class="controls">
														<input type="text" id="refId" name="adbanner.refId" maxlength="20" value="${adbanner.refId}" placeholder="相关编号">
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span5 form-horizontal">
												<div class="control-group">
													<label class="control-label" for="adType">广告类型</label>
													<div class="controls">
														<input type="text" id="adType" name="adbanner.adType" maxlength="2" value="${adbanner.adType}" placeholder="广告类型">
													</div>
												</div>
											</div>
											<div class="span5 form-horizontal">
												<div class="control-group">
													<label class="control-label" for="adRefId">相关编号</label>
													<div class="controls">
														<input type="text" id="adRefId" name="adbanner.adRefId" maxlength="20" value="${adbanner.adRefId}" placeholder="相关编号">
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span5 form-horizontal">
												<div class="control-group">
													<label class="control-label" for="adStart">开始时间</label>
													<div class="controls">
														<input type="text" id="adStart" name="adbanner.adStart" maxlength="19" placeholder="开始时间">
													</div>
												</div>
											</div>
											<div class="span5 form-horizontal">
												<div class="control-group">
													<label class="control-label" for="adEnd">结束时间</label>
													<div class="controls">
														<input type="text" id="adEnd" name="adbanner.adEnd" maxlength="19" placeholder="结束时间">
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
								<th>申请人</th>
								<th>申请时间</th>
								<th>创建人</th>
								<th>创建时间</th>
								<th>更新人</th>
								<th>更新时间</th>
								<th>操作</th>
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
								<td>${item.userApply}</td>
								<td>${item.dateApply}</td>
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
</html>
