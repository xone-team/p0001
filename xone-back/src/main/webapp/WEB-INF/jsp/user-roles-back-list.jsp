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
								<form id="myqueryform" action="${pageContext.request.contextPath}/userroles/userRolesList.html" method="get">
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="idMin">编号</label>
												<div class="controls">
													<input type="text" id="idMin" class="span5" name="userRoles.idMin"  value="${userRoles.idMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="idMax" class="span5" name="userRoles.idMax"  value="${userRoles.idMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userIdMin">用户编号</label>
												<div class="controls">
													<input type="text" id="userIdMin" class="span5" name="userRoles.userIdMin"  value="${userRoles.userIdMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userIdMax" class="span5" name="userRoles.userIdMax"  value="${userRoles.userIdMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="roleIdMin">角色编号</label>
												<div class="controls">
													<input type="text" id="roleIdMin" class="span5" name="userRoles.roleIdMin"  value="${userRoles.roleIdMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="roleIdMax" class="span5" name="userRoles.roleIdMax"  value="${userRoles.roleIdMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="enable">可用标识</label>
												<div class="controls">
													<input type="text" id="enable" name="userRoles.enable"  value="${userRoles.enable}"  maxlength="1" placeholder="可用标识">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreatedMin">创建人</label>
												<div class="controls">
													<input type="text" id="userCreatedMin" class="span5" name="userRoles.userCreatedMin"  value="${userRoles.userCreatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userCreatedMax" class="span5" name="userRoles.userCreatedMax"  value="${userRoles.userCreatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCreatedMin">创建时间</label>
												<div class="controls">
													<input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="userRoles.dateCreatedMin"  value="${userRoles.dateCreatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="userRoles.dateCreatedMax"  value="${userRoles.dateCreatedMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userUpdatedMin">更新人</label>
												<div class="controls">
													<input type="text" id="userUpdatedMin" class="span5" name="userRoles.userUpdatedMin"  value="${userRoles.userUpdatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userUpdatedMax" class="span5" name="userRoles.userUpdatedMax"  value="${userRoles.userUpdatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="lastUpdatedMin">更新时间</label>
												<div class="controls">
													<input type="text" id="lastUpdatedMin" class="span5 Wdate" onclick="WdatePicker()" name="userRoles.lastUpdatedMin"  value="${userRoles.lastUpdatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="lastUpdatedMax" class="span5 Wdate" onclick="WdatePicker()" name="userRoles.lastUpdatedMax"  value="${userRoles.lastUpdatedMax}"  maxlength="19" placeholder="最大日期">
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
							<a class="btn btn-small" href="${pageContext.request.contextPath}/userroles/userRolesCreate.html"> <iclass="icon-plus"></i>创建 </a>
							<button class="btn btn-small" onclick="$('#myqueryform').submit();">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>编号</th>
								<th>用户编号</th>
								<th>角色编号</th>
								<th>可用标识</th>
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
								<td>${item.userId}</td>
								<td>${item.roleId}</td>
								<td>${item.enable}</td>
								<td>${item.userCreated}</td>
								<td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd"/></td>
								<td>${item.userUpdated}</td>
								<td><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd"/></td>
								<td>
									<a href="${pageContext.request.contextPath}/userroles/userRolesEdit.html?userRoles.id=${item.id}" class="btn btn-mini">编辑</a>
									<a href="${pageContext.request.contextPath}/userroles/userRolesItem.html?userRoles.id=${item.id}" class="btn btn-mini">详细</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<x:page href="${pageContext.request.contextPath}/userroles/userRolesList.html" pagination="${pagination}"/>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_userroles").addClass("active");
	 });
	</script>
</html>
