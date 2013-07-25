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
								<form id="myqueryform" action="${pageContext.request.contextPath}/category/categoryList.html" method="get">
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="idMin">ID</label>
												<div class="controls">
													<input type="text" id="idMin" class="span5" name="category.idMin"  value="${category.idMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="idMax" class="span5" name="category.idMax"  value="${category.idMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="name">名称</label>
												<div class="controls">
													<input type="text" id="name" name="category.name"  value="${category.name}"  maxlength="1023" placeholder="名称">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="detail">描述</label>
												<div class="controls">
													<input type="text" id="detail" name="category.detail"  value="${category.detail}"  maxlength="1023" placeholder="描述">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="sortMin">顺序</label>
												<div class="controls">
													<input type="text" id="sortMin" class="span5" name="category.sortMin"  value="${category.sortMin}"  maxlength="11" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="sortMax" class="span5" name="category.sortMax"  value="${category.sortMax}"  maxlength="11" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="parentIdMin">父级ID</label>
												<div class="controls">
													<input type="text" id="parentIdMin" class="span5" name="category.parentIdMin"  value="${category.parentIdMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="parentIdMax" class="span5" name="category.parentIdMax"  value="${category.parentIdMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="flagDeleted">删除标识</label>
												<div class="controls">
													<input type="text" id="flagDeleted" name="category.flagDeleted"  value="${category.flagDeleted}"  maxlength="1" placeholder="删除标识">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreatedMin">创建人</label>
												<div class="controls">
													<input type="text" id="userCreatedMin" class="span5" name="category.userCreatedMin"  value="${category.userCreatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userCreatedMax" class="span5" name="category.userCreatedMax"  value="${category.userCreatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCreatedMin">创建日期</label>
												<div class="controls">
													<input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="category.dateCreatedMin"  value="${category.dateCreatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="category.dateCreatedMax"  value="${category.dateCreatedMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userUpdatedMin">更新人</label>
												<div class="controls">
													<input type="text" id="userUpdatedMin" class="span5" name="category.userUpdatedMin"  value="${category.userUpdatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userUpdatedMax" class="span5" name="category.userUpdatedMax"  value="${category.userUpdatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="lastUpdatedMin">更新日期</label>
												<div class="controls">
													<input type="text" id="lastUpdatedMin" class="span5 Wdate" onclick="WdatePicker()" name="category.lastUpdatedMin"  value="${category.lastUpdatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="lastUpdatedMax" class="span5 Wdate" onclick="WdatePicker()" name="category.lastUpdatedMax"  value="${category.lastUpdatedMax}"  maxlength="19" placeholder="最大日期">
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
							<a class="btn btn-small" href="${pageContext.request.contextPath}/category/categoryCreate.html"> <iclass="icon-plus"></i>创建 </a>
							<button class="btn btn-small" onclick="$('#myqueryform').submit();">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>ID</th>
								<th>名称</th>
								<th>描述</th>
								<th>顺序</th>
								<th>父级ID</th>
								<th>删除标识</th>
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
								<td>${item.name}</td>
								<td>${item.detail}</td>
								<td>${item.sort}</td>
								<td>${item.parentId}</td>
								<td>${item.flagDeleted}</td>
								<td>${item.userCreated}</td>
								<td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd"/></td>
								<td>${item.userUpdated}</td>
								<td><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd"/></td>
								<td>
									<a href="${pageContext.request.contextPath}/category/categoryEdit.html?category.id=${item.id}" class="btn btn-mini">编辑</a>
									<a href="${pageContext.request.contextPath}/category/categoryItem.html?category.id=${item.id}" class="btn btn-mini">详细</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<x:page href="${pageContext.request.contextPath}/category/categoryList.html" pagination="${pagination}"/>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_category").addClass("active");
	 });
	</script>
</html>
