<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户中心</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="common-header.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="common-nav.jsp"><jsp:param value="5" name="offset"/></jsp:include>
	<div class="container">
		<div class="row">
			<div class="span3">
				<jsp:include page="user-center-menu.jsp"><jsp:param value="5" name="menuindex"/></jsp:include>
			</div>
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a> <span class="divider">/</span></li>
					<li><a href="${pageContext.request.contextPath}/user/userList.html">user列表</a> <span class="divider">/</span></li>
					<li class="active">user编辑</li>
				</ul>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/userUpdate.html">
					<div class="control-group">
						<label class="control-label" for="id">用户编号</label>
						<div class="controls">
							<input type="text" id="id" name="user.id" value="${user.id}" maxlength="20" placeholder="用户编号">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="username">用户名</label>
						<div class="controls">
							<input type="text" id="username" name="user.username" value="${user.username}" maxlength="255" placeholder="用户名">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">密码</label>
						<div class="controls">
							<input type="text" id="password" name="user.password" value="${user.password}" maxlength="255" placeholder="密码">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userApply">申请人</label>
						<div class="controls">
							<input type="text" id="userApply" name="user.userApply" value="${user.userApply}" maxlength="20" placeholder="申请人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateApply">申请时间</label>
						<div class="controls">
							<input type="text" id="dateApply" name="user.dateApply" value="${user.dateApply}" maxlength="19" placeholder="申请时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCheck">审核人</label>
						<div class="controls">
							<input type="text" id="userCheck" name="user.userCheck" value="${user.userCheck}" maxlength="20" placeholder="审核人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCheck">审核时间</label>
						<div class="controls">
							<input type="text" id="dateCheck" name="user.dateCheck" value="${user.dateCheck}" maxlength="19" placeholder="审核时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="flagDeleted">删除标识</label>
						<div class="controls">
							<input type="text" id="flagDeleted" name="user.flagDeleted" value="${user.flagDeleted}" maxlength="1" placeholder="删除标识">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人</label>
						<div class="controls">
							<input type="text" id="userCreated" name="user.userCreated" value="${user.userCreated}" maxlength="20" placeholder="创建人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建时间</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="user.dateCreated" value="${user.dateCreated}" maxlength="19" placeholder="创建时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="user.userUpdated" value="${user.userUpdated}" maxlength="20" placeholder="更新人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新时间</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="user.lastUpdated" value="${user.lastUpdated}" maxlength="19" placeholder="更新时间">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="nickName">昵称</label>
						<div class="controls">
							<input type="text" id="nickName" name="user.nickName" value="${user.nickName}" maxlength="255" placeholder="昵称">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="cellphone">手机号码</label>
						<div class="controls">
							<input type="text" id="cellphone" name="user.cellphone" value="${user.cellphone}" maxlength="255" placeholder="手机号码">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="contactor">联系人</label>
						<div class="controls">
							<input type="text" id="contactor" name="user.contactor" value="${user.contactor}" maxlength="255" placeholder="联系人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="qq">腾讯号码</label>
						<div class="controls">
							<input type="text" id="qq" name="user.qq" value="${user.qq}" maxlength="255" placeholder="腾讯号码">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="email">电子邮箱</label>
						<div class="controls">
							<input type="text" id="email" name="user.email" value="${user.email}" maxlength="255" placeholder="电子邮箱">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="address">联系地址</label>
						<div class="controls">
							<input type="text" id="address" name="user.address" value="${user.address}" maxlength="255" placeholder="联系地址">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="credit">认证标识</label>
						<div class="controls">
							<input type="text" id="credit" name="user.credit" value="${user.credit}" maxlength="2" placeholder="认证标识">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userLevel">用户级别</label>
						<div class="controls">
							<input type="text" id="userLevel" name="user.userLevel" value="${user.userLevel}" maxlength="2" placeholder="用户级别">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" name="update" value="update" class="btn">提交更新</button>
							<button type="submit" name="delete" value="delete" class="btn">删除角色</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
