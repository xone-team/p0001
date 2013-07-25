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
								<form id="myqueryform" action="${pageContext.request.contextPath}/topad/topadList.html" method="get">
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="idMin">主键</label>
												<div class="controls">
													<input type="text" id="idMin" class="span5" name="topad.idMin"  value="${topad.idMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="idMax" class="span5" name="topad.idMax"  value="${topad.idMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="productIdMin">产品</label>
												<div class="controls">
													<input type="text" id="productIdMin" class="span5" name="topad.productIdMin"  value="${topad.productIdMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="productIdMax" class="span5" name="topad.productIdMax"  value="${topad.productIdMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="checkStatus">审核状态</label>
												<div class="controls">
													<input type="text" id="checkStatus" name="topad.checkStatus"  value="${topad.checkStatus}"  maxlength="1" placeholder="审核状态">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="remark">备注</label>
												<div class="controls">
													<input type="text" id="remark" name="topad.remark"  value="${topad.remark}"  maxlength="1023" placeholder="备注">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userApplyMin">申请人</label>
												<div class="controls">
													<input type="text" id="userApplyMin" class="span5" name="topad.userApplyMin"  value="${topad.userApplyMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userApplyMax" class="span5" name="topad.userApplyMax"  value="${topad.userApplyMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateApplyMin">申请日期</label>
												<div class="controls">
													<input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="topad.dateApplyMin"  value="${topad.dateApplyMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="topad.dateApplyMax"  value="${topad.dateApplyMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCheckMin">审核人</label>
												<div class="controls">
													<input type="text" id="userCheckMin" class="span5" name="topad.userCheckMin"  value="${topad.userCheckMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userCheckMax" class="span5" name="topad.userCheckMax"  value="${topad.userCheckMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCheckMin">审核日期</label>
												<div class="controls">
													<input type="text" id="dateCheckMin" class="span5 Wdate" onclick="WdatePicker()" name="topad.dateCheckMin"  value="${topad.dateCheckMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateCheckMax" class="span5 Wdate" onclick="WdatePicker()" name="topad.dateCheckMax"  value="${topad.dateCheckMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="flagDeleted">是否被删除了</label>
												<div class="controls">
													<input type="text" id="flagDeleted" name="topad.flagDeleted"  value="${topad.flagDeleted}"  maxlength="1" placeholder="是否被删除了">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreatedMin">创建人</label>
												<div class="controls">
													<input type="text" id="userCreatedMin" class="span5" name="topad.userCreatedMin"  value="${topad.userCreatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userCreatedMax" class="span5" name="topad.userCreatedMax"  value="${topad.userCreatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCreatedMin">创建日期</label>
												<div class="controls">
													<input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="topad.dateCreatedMin"  value="${topad.dateCreatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="topad.dateCreatedMax"  value="${topad.dateCreatedMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userUpdatedMin">更新人</label>
												<div class="controls">
													<input type="text" id="userUpdatedMin" class="span5" name="topad.userUpdatedMin"  value="${topad.userUpdatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userUpdatedMax" class="span5" name="topad.userUpdatedMax"  value="${topad.userUpdatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="lastUpdatedMin">更新日期</label>
												<div class="controls">
													<input type="text" id="lastUpdatedMin" class="span5 Wdate" onclick="WdatePicker()" name="topad.lastUpdatedMin"  value="${topad.lastUpdatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="lastUpdatedMax" class="span5 Wdate" onclick="WdatePicker()" name="topad.lastUpdatedMax"  value="${topad.lastUpdatedMax}"  maxlength="19" placeholder="最大日期">
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
							<a class="btn btn-small" href="${pageContext.request.contextPath}/topad/topadCreate.html"> <iclass="icon-plus"></i>创建 </a>
							<button class="btn btn-small" onclick="$('#myqueryform').submit();">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>主键</th>
								<th>产品</th>
								<th>审核状态</th>
								<th>备注</th>
								<th>申请人</th>
								<th>申请日期</th>
								<th>审核人</th>
								<th>审核日期</th>
								<th>是否被删除了</th>
								<th>创建人</th>
								<th>创建日期</th>
								<th>更新人</th>
								<th>更新日期</th>
								<th>操作</th>
							</thead>
							<tbody>
							<c:forEach var="item" items="${pagination.list}">
							<tr>
								<td>${item.id}</td>
								<td>${item.productId}</td>
								<td>${item.checkStatus}</td>
								<td>${item.remark}</td>
								<td>${item.userApply}</td>
								<td><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd"/></td>
								<td>${item.userCheck}</td>
								<td><fmt:formatDate value="${item.dateCheck}" pattern="yyyy-MM-dd"/></td>
								<td>${item.flagDeleted}</td>
								<td>${item.userCreated}</td>
								<td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd"/></td>
								<td>${item.userUpdated}</td>
								<td><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd"/></td>
								<td>
									<a href="${pageContext.request.contextPath}/topad/topadEdit.html?topad.id=${item.id}" class="btn btn-mini">编辑</a>
									<a href="${pageContext.request.contextPath}/topad/topadItem.html?topad.id=${item.id}" class="btn btn-mini">详细</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<x:page href="${pageContext.request.contextPath}/topad/topadList.html" pagination="${pagination}"/>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_topad").addClass("active");
	 });
	</script>
</html>
