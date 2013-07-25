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
								<form id="myqueryform" action="${pageContext.request.contextPath}/user/userList.html" method="get">
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="idMin">用户编号</label>
												<div class="controls">
													<input type="text" id="idMin" class="span5" name="user.idMin"  value="${user.idMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="idMax" class="span5" name="user.idMax"  value="${user.idMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="username">用户名</label>
												<div class="controls">
													<input type="text" id="username" name="user.username"  value="${user.username}"  maxlength="255" placeholder="用户名">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="password">密码</label>
												<div class="controls">
													<input type="text" id="password" name="user.password"  value="${user.password}"  maxlength="255" placeholder="密码">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userApplyMin">申请人</label>
												<div class="controls">
													<input type="text" id="userApplyMin" class="span5" name="user.userApplyMin"  value="${user.userApplyMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userApplyMax" class="span5" name="user.userApplyMax"  value="${user.userApplyMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateApplyMin">申请时间</label>
												<div class="controls">
													<input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="user.dateApplyMin"  value="${user.dateApplyMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="user.dateApplyMax"  value="${user.dateApplyMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCheckMin">审核人</label>
												<div class="controls">
													<input type="text" id="userCheckMin" class="span5" name="user.userCheckMin"  value="${user.userCheckMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userCheckMax" class="span5" name="user.userCheckMax"  value="${user.userCheckMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCheckMin">审核时间</label>
												<div class="controls">
													<input type="text" id="dateCheckMin" class="span5 Wdate" onclick="WdatePicker()" name="user.dateCheckMin"  value="${user.dateCheckMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateCheckMax" class="span5 Wdate" onclick="WdatePicker()" name="user.dateCheckMax"  value="${user.dateCheckMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="flagDeleted">删除标识</label>
												<div class="controls">
													<input type="text" id="flagDeleted" name="user.flagDeleted"  value="${user.flagDeleted}"  maxlength="1" placeholder="删除标识">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userCreatedMin">创建人</label>
												<div class="controls">
													<input type="text" id="userCreatedMin" class="span5" name="user.userCreatedMin"  value="${user.userCreatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userCreatedMax" class="span5" name="user.userCreatedMax"  value="${user.userCreatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="dateCreatedMin">创建时间</label>
												<div class="controls">
													<input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="user.dateCreatedMin"  value="${user.dateCreatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="user.dateCreatedMax"  value="${user.dateCreatedMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userUpdatedMin">更新人</label>
												<div class="controls">
													<input type="text" id="userUpdatedMin" class="span5" name="user.userUpdatedMin"  value="${user.userUpdatedMin}"  maxlength="20" placeholder="最小值">
													<span class="add-on">~</span>
													<input type="text" id="userUpdatedMax" class="span5" name="user.userUpdatedMax"  value="${user.userUpdatedMax}"  maxlength="20" placeholder="最大值">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="lastUpdatedMin">更新时间</label>
												<div class="controls">
													<input type="text" id="lastUpdatedMin" class="span5 Wdate" onclick="WdatePicker()" name="user.lastUpdatedMin"  value="${user.lastUpdatedMin}"  maxlength="19" placeholder="最小日期">
													<span class="add-on">~</span>
													<input type="text" id="lastUpdatedMax" class="span5 Wdate" onclick="WdatePicker()" name="user.lastUpdatedMax"  value="${user.lastUpdatedMax}"  maxlength="19" placeholder="最大日期">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="nickName">昵称</label>
												<div class="controls">
													<input type="text" id="nickName" name="user.nickName"  value="${user.nickName}"  maxlength="255" placeholder="昵称">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="cellphone">手机号码</label>
												<div class="controls">
													<input type="text" id="cellphone" name="user.cellphone"  value="${user.cellphone}"  maxlength="255" placeholder="手机号码">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="contactor">联系人</label>
												<div class="controls">
													<input type="text" id="contactor" name="user.contactor"  value="${user.contactor}"  maxlength="255" placeholder="联系人">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="qq">腾讯号码</label>
												<div class="controls">
													<input type="text" id="qq" name="user.qq"  value="${user.qq}"  maxlength="255" placeholder="腾讯号码">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="email">电子邮箱</label>
												<div class="controls">
													<input type="text" id="email" name="user.email"  value="${user.email}"  maxlength="255" placeholder="电子邮箱">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="address">联系地址</label>
												<div class="controls">
													<input type="text" id="address" name="user.address"  value="${user.address}"  maxlength="255" placeholder="联系地址">
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="credit">认证标识</label>
												<div class="controls">
													<input type="text" id="credit" name="user.credit"  value="${user.credit}"  maxlength="2" placeholder="认证标识">
												</div>
											</div>
										</div>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="userLevel">用户级别</label>
												<div class="controls">
													<input type="text" id="userLevel" name="user.userLevel"  value="${user.userLevel}"  maxlength="2" placeholder="用户级别">
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
							<a class="btn btn-small" href="${pageContext.request.contextPath}/user/userCreate.html"> <iclass="icon-plus"></i>创建 </a>
							<button class="btn btn-small" onclick="$('#myqueryform').submit();">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
								<th>用户编号</th>
								<th>用户名</th>
								<th>密码</th>
								<th>申请人</th>
								<th>申请时间</th>
								<th>审核人</th>
								<th>审核时间</th>
								<th>删除标识</th>
								<th>创建人</th>
								<th>创建时间</th>
								<th>更新人</th>
								<th>更新时间</th>
								<th>昵称</th>
								<th>手机号码</th>
								<th>联系人</th>
								<th>腾讯号码</th>
								<th>电子邮箱</th>
								<th>联系地址</th>
								<th>认证标识</th>
								<th>用户级别</th>
								<th>操作</th>
							</thead>
							<tbody>
							<c:forEach var="item" items="${pagination.list}">
							<tr>
								<td>${item.id}</td>
								<td>${item.username}</td>
								<td>${item.password}</td>
								<td>${item.userApply}</td>
								<td><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd"/></td>
								<td>${item.userCheck}</td>
								<td><fmt:formatDate value="${item.dateCheck}" pattern="yyyy-MM-dd"/></td>
								<td>${item.flagDeleted}</td>
								<td>${item.userCreated}</td>
								<td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd"/></td>
								<td>${item.userUpdated}</td>
								<td><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd"/></td>
								<td>${item.nickName}</td>
								<td>${item.cellphone}</td>
								<td>${item.contactor}</td>
								<td>${item.qq}</td>
								<td>${item.email}</td>
								<td>${item.address}</td>
								<td>${item.credit}</td>
								<td>${item.userLevel}</td>
								<td>
									<a href="${pageContext.request.contextPath}/user/userEdit.html?user.id=${item.id}" class="btn btn-mini">编辑</a>
									<a href="${pageContext.request.contextPath}/user/userItem.html?user.id=${item.id}" class="btn btn-mini">详细</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<x:page href="${pageContext.request.contextPath}/user/userList.html" pagination="${pagination}"/>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_user").addClass("active");
	 });
	</script>
</html>
