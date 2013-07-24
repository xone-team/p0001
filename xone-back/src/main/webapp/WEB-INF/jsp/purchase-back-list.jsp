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
						<ul class="breadcrumb" id="X_breadcrumbs_ul"><li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li><li class="active">Purchase列表</li></ul>
					</div>
					<div class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
							</div>
							<div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
								<div class="accordion-inner">
								<form id="myqueryform" action="${pageContext.request.contextPath}/purchase/purchaseList.html" method="get">
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="id">编号</label>
												<div class="controls">
													<input type="text" id="id" name="purchase.id"  value="${purchase.id}"  maxlength="20" placeholder="编号">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="purchaseName">产品名称</label>
												<div class="controls">
													<input type="text" id="purchaseName" name="purchase.purchaseName"  value="${purchase.purchaseName}"  maxlength="255" placeholder="产品名称">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="purchaseType">求购类型</label>
												<div class="controls">
													<input type="text" id="purchaseType" name="purchase.purchaseType"  value="${purchase.purchaseType}"  maxlength="2" placeholder="求购类型">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="purchaseNum">求购数量</label>
												<div class="controls">
													<input type="text" id="purchaseNum" name="purchase.purchaseNum"  value="${purchase.purchaseNum}"  maxlength="255" placeholder="求购数量">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="purchaseValid">有效期</label>
												<div class="controls">
													<input type="text" id="purchaseValid" name="purchase.purchaseValid"  value="${purchase.purchaseValid}"  maxlength="19" placeholder="有效期">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="purchaseAddress">产品产地</label>
												<div class="controls">
													<input type="text" id="purchaseAddress" name="purchase.purchaseAddress"  value="${purchase.purchaseAddress}"  maxlength="255" placeholder="产品产地">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="purchaseLocation">产品属地</label>
												<div class="controls">
													<input type="text" id="purchaseLocation" name="purchase.purchaseLocation"  value="${purchase.purchaseLocation}"  maxlength="255" placeholder="产品属地">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="purchaseDesc">求购描述</label>
												<div class="controls">
													<input type="text" id="purchaseDesc" name="purchase.purchaseDesc"  value="${purchase.purchaseDesc}"  maxlength="255" placeholder="求购描述">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="flagDeleted">删除标识</label>
												<div class="controls">
													<input type="text" id="flagDeleted" name="purchase.flagDeleted"  value="${purchase.flagDeleted}"  maxlength="1" placeholder="删除标识">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userApply">申请人</label>
												<div class="controls">
													<input type="text" id="userApply" name="purchase.userApply"  value="${purchase.userApply}"  maxlength="20" placeholder="申请人">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateApply">申请时间</label>
												<div class="controls">
													<input type="text" id="dateApply" name="purchase.dateApply"  value="${purchase.dateApply}"  maxlength="19" placeholder="申请时间">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCheck">审核人</label>
												<div class="controls">
													<input type="text" id="userCheck" name="purchase.userCheck"  value="${purchase.userCheck}"  maxlength="20" placeholder="审核人">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCheck">审核时间</label>
												<div class="controls">
													<input type="text" id="dateCheck" name="purchase.dateCheck"  value="${purchase.dateCheck}"  maxlength="19" placeholder="审核时间">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreated">创建人</label>
												<div class="controls">
													<input type="text" id="userCreated" name="purchase.userCreated"  value="${purchase.userCreated}"  maxlength="20" placeholder="创建人">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCreated">创建时间</label>
												<div class="controls">
													<input type="text" id="dateCreated" name="purchase.dateCreated"  value="${purchase.dateCreated}"  maxlength="19" placeholder="创建时间">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userUpdated">更新人</label>
												<div class="controls">
													<input type="text" id="userUpdated" name="purchase.userUpdated"  value="${purchase.userUpdated}"  maxlength="20" placeholder="更新人">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="lastUpdated">更新时间</label>
												<div class="controls">
													<input type="text" id="lastUpdated" name="purchase.lastUpdated"  value="${purchase.lastUpdated}"  maxlength="19" placeholder="更新时间">
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
							<a class="btn btn-small" href="${pageContext.request.contextPath}/purchase/purchaseCreate.html"> <iclass="icon-plus"></i>创建 </a>
							<button class="btn btn-small" onclick="$('#myqueryform').submit();">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>编号</th>
								<th>产品名称</th>
								<th>求购类型</th>
								<th>求购数量</th>
								<th>有效期</th>
								<th>产品产地</th>
								<th>产品属地</th>
								<th>求购描述</th>
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
								<td>${item.purchaseName}</td>
								<td>${item.purchaseType}</td>
								<td>${item.purchaseNum}</td>
								<td>${item.purchaseValid}</td>
								<td>${item.purchaseAddress}</td>
								<td>${item.purchaseLocation}</td>
								<td>${item.purchaseDesc}</td>
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
									<a href="${pageContext.request.contextPath}/purchase/purchaseEdit.html?purchase.id=${item.id}" class="btn btn-mini">编辑</a>
									<a href="${pageContext.request.contextPath}/purchase/purchaseItem.html?purchase.id=${item.id}" class="btn btn-mini">详细</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<x:page href="${pageContext.request.contextPath}/purchase/purchaseList.html" pagination="${pagination}"/>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
