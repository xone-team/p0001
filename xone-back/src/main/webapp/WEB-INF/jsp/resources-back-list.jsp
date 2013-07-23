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
						<ul class="breadcrumb" id="X_breadcrumbs_ul"><li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li><li class="active">Resources列表</li></ul>
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
													<input type="text" id="id" name="resources.id" maxlength="20" placeholder="编号">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="name">资源名称</label>
												<div class="controls">
													<input type="text" id="name" name="resources.name" maxlength="255" placeholder="资源名称">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="resourceType">资源类型</label>
												<div class="controls">
													<input type="text" id="resourceType" name="resources.resourceType" maxlength="11" placeholder="资源类型">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="priority">优先级</label>
												<div class="controls">
													<input type="text" id="priority" name="resources.priority" maxlength="11" placeholder="优先级">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="resourceUrl">资源地址</label>
												<div class="controls">
													<input type="text" id="resourceUrl" name="resources.resourceUrl" maxlength="255" placeholder="资源地址">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="remark">备注</label>
												<div class="controls">
													<input type="text" id="remark" name="resources.remark" maxlength="1024" placeholder="备注">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="enable">可用标识</label>
												<div class="controls">
													<input type="text" id="enable" name="resources.enable" maxlength="1" placeholder="可用标识">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreated">创建人</label>
												<div class="controls">
													<input type="text" id="userCreated" name="resources.userCreated" maxlength="20" placeholder="创建人">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCreated">创建时间</label>
												<div class="controls">
													<input type="text" id="dateCreated" name="resources.dateCreated" maxlength="19" placeholder="创建时间">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userUpdated">更新人</label>
												<div class="controls">
													<input type="text" id="userUpdated" name="resources.userUpdated" maxlength="20" placeholder="更新人">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="lastUpdated">更新时间</label>
												<div class="controls">
													<input type="text" id="lastUpdated" name="resources.lastUpdated" maxlength="19" placeholder="更新时间">
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
							<a class="btn btn-small" href="${pageContext.request.contextPath}/resources/resourcesCreate.html"> <iclass="icon-plus"></i>创建 </a>
							<button class="btn btn-small">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>编号</th>
								<th>资源名称</th>
								<th>资源类型</th>
								<th>优先级</th>
								<th>资源地址</th>
								<th>备注</th>
								<th>可用标识</th>
								<th>创建人</th>
								<th>创建时间</th>
								<th>更新人</th>
								<th>更新时间</th>
							</thead>
							<tbody>
							<c:forEach var="item" items="${pagination.list}">
							<tr>
								<td>${item.id}</td>
								<td>${item.name}</td>
								<td>${item.resourceType}</td>
								<td>${item.priority}</td>
								<td>${item.resourceUrl}</td>
								<td>${item.remark}</td>
								<td>${item.enable}</td>
								<td>${item.userCreated}</td>
								<td>${item.dateCreated}</td>
								<td>${item.userUpdated}</td>
								<td>${item.lastUpdated}</td>
								<td>
									<a href="${pageContext.request.contextPath}/resources/resourcesEdit.html?resources.id=${item.id}" class="btn btn-mini">编辑</a>
									<a href="${pageContext.request.contextPath}/resources/resourcesItem.html?resources.id=${item.id}" class="btn btn-mini">详细</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<x:page href="${pageContext.request.contextPath}/resources/resourcesList.html" pagination="${pagination}"/>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
