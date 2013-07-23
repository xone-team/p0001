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
						<ul class="breadcrumb" id="X_breadcrumbs_ul"><li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li><li class="active">Delivery列表</li></ul>
					</div>
					<div class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
							</div>
							<div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
								<div class="accordion-inner">
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="id">编号</label>
												<div class="controls">
													<input type="text" id="id" name="delivery.id" maxlength="20" placeholder="编号">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="productId">产品编号</label>
												<div class="controls">
													<input type="text" id="productId" name="delivery.productId" maxlength="20" placeholder="产品编号">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="marketarea">市场区域</label>
												<div class="controls">
													<input type="text" id="marketarea" name="delivery.marketarea" maxlength="255" placeholder="市场区域">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="determini">目的地点</label>
												<div class="controls">
													<input type="text" id="determini" name="delivery.determini" maxlength="255" placeholder="目的地点">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="loadtime">上货时间</label>
												<div class="controls">
													<input type="text" id="loadtime" name="delivery.loadtime" maxlength="255" placeholder="上货时间">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="loadaddress">上货地点</label>
												<div class="controls">
													<input type="text" id="loadaddress" name="delivery.loadaddress" maxlength="255" placeholder="上货地点">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="boxNum">箱数</label>
												<div class="controls">
													<input type="text" id="boxNum" name="delivery.boxNum" maxlength="20" placeholder="箱数">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="unitNum">单位重量</label>
												<div class="controls">
													<input type="text" id="unitNum" name="delivery.unitNum" maxlength="20" placeholder="单位重量">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="boxTotal">总箱数</label>
												<div class="controls">
													<input type="text" id="boxTotal" name="delivery.boxTotal" maxlength="20" placeholder="总箱数">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="totalWeight">总重</label>
												<div class="controls">
													<input type="text" id="totalWeight" name="delivery.totalWeight" maxlength="20" placeholder="总重">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="flagPass">通过标识</label>
												<div class="controls">
													<input type="text" id="flagPass" name="delivery.flagPass" maxlength="1" placeholder="通过标识">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="remark">备注</label>
												<div class="controls">
													<input type="text" id="remark" name="delivery.remark" maxlength="1023" placeholder="备注">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userApply">申请人</label>
												<div class="controls">
													<input type="text" id="userApply" name="delivery.userApply" maxlength="20" placeholder="申请人">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateApply">申请时间</label>
												<div class="controls">
													<input type="text" id="dateApply" name="delivery.dateApply" maxlength="19" placeholder="申请时间">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCheck">审核人</label>
												<div class="controls">
													<input type="text" id="userCheck" name="delivery.userCheck" maxlength="20" placeholder="审核人">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCheck">审核时间</label>
												<div class="controls">
													<input type="text" id="dateCheck" name="delivery.dateCheck" maxlength="19" placeholder="审核时间">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="flagDeleted">删除标识</label>
												<div class="controls">
													<input type="text" id="flagDeleted" name="delivery.flagDeleted" maxlength="1" placeholder="删除标识">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreated">创建人</label>
												<div class="controls">
													<input type="text" id="userCreated" name="delivery.userCreated" maxlength="20" placeholder="创建人">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCreated">创建时间</label>
												<div class="controls">
													<input type="text" id="dateCreated" name="delivery.dateCreated" maxlength="19" placeholder="创建时间">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userUpdated">更新人</label>
												<div class="controls">
													<input type="text" id="userUpdated" name="delivery.userUpdated" maxlength="20" placeholder="更新人">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="lastUpdated">更新时间</label>
												<div class="controls">
													<input type="text" id="lastUpdated" name="delivery.lastUpdated" maxlength="19" placeholder="更新时间">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<p class="text-right">
							<a class="btn btn-small" href="${pageContext.request.contextPath}/delivery/deliveryCreate.html"> <iclass="icon-plus"></i>创建 </a>
							<button class="btn btn-small">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>编号</th>
								<th>产品编号</th>
								<th>市场区域</th>
								<th>目的地点</th>
								<th>上货时间</th>
								<th>上货地点</th>
								<th>箱数</th>
								<th>单位重量</th>
								<th>总箱数</th>
								<th>总重</th>
								<th>通过标识</th>
								<th>备注</th>
								<th>申请人</th>
								<th>申请时间</th>
								<th>审核人</th>
								<th>审核时间</th>
								<th>删除标识</th>
								<th>创建人</th>
								<th>创建时间</th>
								<th>更新人</th>
								<th>更新时间</th>
							</thead>
							<tbody>
							<c:forEach var="item" items="${pagination.list}">
							<tr>
								<td>${item.id}</td>
								<td>${item.productId}</td>
								<td>${item.marketarea}</td>
								<td>${item.determini}</td>
								<td>${item.loadtime}</td>
								<td>${item.loadaddress}</td>
								<td>${item.boxNum}</td>
								<td>${item.unitNum}</td>
								<td>${item.boxTotal}</td>
								<td>${item.totalWeight}</td>
								<td>${item.flagPass}</td>
								<td>${item.remark}</td>
								<td>${item.userApply}</td>
								<td>${item.dateApply}</td>
								<td>${item.userCheck}</td>
								<td>${item.dateCheck}</td>
								<td>${item.flagDeleted}</td>
								<td>${item.userCreated}</td>
								<td>${item.dateCreated}</td>
								<td>${item.userUpdated}</td>
								<td>${item.lastUpdated}</td>
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
	</body>
</html>
