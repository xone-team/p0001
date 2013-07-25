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
								<form id="myqueryform" action="${pageContext.request.contextPath}/delivery/deliveryList.html" method="get">
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="idMin">编号</label>
												<div class="controls">
													<input type="text" id="idMin" class="span5" name="delivery.idMin"  value="${delivery.idMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="idMax" class="span5" name="delivery.idMax"  value="${delivery.idMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="productIdMin">产品编号</label>
												<div class="controls">
													<input type="text" id="productIdMin" class="span5" name="delivery.productIdMin"  value="${delivery.productIdMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="productIdMax" class="span5" name="delivery.productIdMax"  value="${delivery.productIdMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="marketarea">市场区域</label>
												<div class="controls">
													<input type="text" id="marketarea" name="delivery.marketarea"  value="${delivery.marketarea}"  maxlength="255" placeholder="市场区域">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="determini">目的地点</label>
												<div class="controls">
													<input type="text" id="determini" name="delivery.determini"  value="${delivery.determini}"  maxlength="255" placeholder="目的地点">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="loadtime">上货时间</label>
												<div class="controls">
													<input type="text" id="loadtime" name="delivery.loadtime"  value="${delivery.loadtime}"  maxlength="255" placeholder="上货时间">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="loadaddress">上货地点</label>
												<div class="controls">
													<input type="text" id="loadaddress" name="delivery.loadaddress"  value="${delivery.loadaddress}"  maxlength="255" placeholder="上货地点">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="boxNum">箱数</label>
												<div class="controls">
													<input type="text" id="boxNum" name="delivery.boxNum"  value="${delivery.boxNum}"  maxlength="20" placeholder="箱数">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="unitNum">单位重量</label>
												<div class="controls">
													<input type="text" id="unitNum" name="delivery.unitNum"  value="${delivery.unitNum}"  maxlength="20" placeholder="单位重量">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="boxTotal">总箱数</label>
												<div class="controls">
													<input type="text" id="boxTotal" name="delivery.boxTotal"  value="${delivery.boxTotal}"  maxlength="20" placeholder="总箱数">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="totalWeight">总重</label>
												<div class="controls">
													<input type="text" id="totalWeight" name="delivery.totalWeight"  value="${delivery.totalWeight}"  maxlength="20" placeholder="总重">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="flagPass">通过标识</label>
												<div class="controls">
													<input type="text" id="flagPass" name="delivery.flagPass"  value="${delivery.flagPass}"  maxlength="1" placeholder="通过标识">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="remark">备注</label>
												<div class="controls">
													<input type="text" id="remark" name="delivery.remark"  value="${delivery.remark}"  maxlength="1023" placeholder="备注">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userApplyMin">申请人</label>
												<div class="controls">
													<input type="text" id="userApplyMin" class="span5" name="delivery.userApplyMin"  value="${delivery.userApplyMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userApplyMax" class="span5" name="delivery.userApplyMax"  value="${delivery.userApplyMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateApplyMin">申请时间</label>
												<div class="controls">
													<input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="delivery.dateApplyMin"  value="${delivery.dateApplyMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="delivery.dateApplyMax"  value="${delivery.dateApplyMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCheckMin">审核人</label>
												<div class="controls">
													<input type="text" id="userCheckMin" class="span5" name="delivery.userCheckMin"  value="${delivery.userCheckMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userCheckMax" class="span5" name="delivery.userCheckMax"  value="${delivery.userCheckMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCheckMin">审核时间</label>
												<div class="controls">
													<input type="text" id="dateCheckMin" class="span5 Wdate" onclick="WdatePicker()" name="delivery.dateCheckMin"  value="${delivery.dateCheckMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateCheckMax" class="span5 Wdate" onclick="WdatePicker()" name="delivery.dateCheckMax"  value="${delivery.dateCheckMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="flagDeleted">删除标识</label>
												<div class="controls">
													<input type="text" id="flagDeleted" name="delivery.flagDeleted"  value="${delivery.flagDeleted}"  maxlength="1" placeholder="删除标识">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreatedMin">创建人</label>
												<div class="controls">
													<input type="text" id="userCreatedMin" class="span5" name="delivery.userCreatedMin"  value="${delivery.userCreatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userCreatedMax" class="span5" name="delivery.userCreatedMax"  value="${delivery.userCreatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCreatedMin">创建时间</label>
												<div class="controls">
													<input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="delivery.dateCreatedMin"  value="${delivery.dateCreatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="delivery.dateCreatedMax"  value="${delivery.dateCreatedMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userUpdatedMin">更新人</label>
												<div class="controls">
													<input type="text" id="userUpdatedMin" class="span5" name="delivery.userUpdatedMin"  value="${delivery.userUpdatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userUpdatedMax" class="span5" name="delivery.userUpdatedMax"  value="${delivery.userUpdatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="lastUpdatedMin">更新时间</label>
												<div class="controls">
													<input type="text" id="lastUpdatedMin" class="span5 Wdate" onclick="WdatePicker()" name="delivery.lastUpdatedMin"  value="${delivery.lastUpdatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="lastUpdatedMax" class="span5 Wdate" onclick="WdatePicker()" name="delivery.lastUpdatedMax"  value="${delivery.lastUpdatedMax}"  maxlength="19" placeholder="最大日期">
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
							<a class="btn btn-small" href="${pageContext.request.contextPath}/delivery/deliveryCreate.html"> <iclass="icon-plus"></i>创建 </a>
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
								<th>操作</th>
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
								<td><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd"/></td>
								<td>${item.userCheck}</td>
								<td><fmt:formatDate value="${item.dateCheck}" pattern="yyyy-MM-dd"/></td>
								<td>${item.flagDeleted}</td>
								<td>${item.userCreated}</td>
								<td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd"/></td>
								<td>${item.userUpdated}</td>
								<td><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd"/></td>
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
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_delivery").addClass("active");
	 });
	</script>
</html>
