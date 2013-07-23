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
		<jsp:include page="common-nav.jsp"></jsp:include>
		<div class="container-fluid">
    		<div class="row-fluid" id="X_bodyContainer">
				<div class="span2">
					<jsp:include page="common-menu.jsp"></jsp:include>
				</div>
				<div class="span10" id="X_contentContainer">
				<div class="row-fluid">
					<ul class="breadcrumb" id="X_breadcrumbs_ul">
						<li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li>
						<li><a href="${pageContext.request.contextPath}/user/userList.html">user列表</a> <span class="divider">/</span></li>
						<li class="active">user详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">用户编号</td>
							<td>${user.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">用户名</td>
							<td>${user.username}</td>
						</tr>
						<tr>
							<td style="width:60px;">密码</td>
							<td>${user.password}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请人</td>
							<td>${user.userApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请时间</td>
							<td>${user.dateApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核人</td>
							<td>${user.userCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核时间</td>
							<td>${user.dateCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">删除标识</td>
							<td>${user.flagDeleted}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${user.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建时间</td>
							<td>${user.dateCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${user.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td>${user.lastUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">昵称</td>
							<td>${user.nickName}</td>
						</tr>
						<tr>
							<td style="width:60px;">手机号码</td>
							<td>${user.cellphone}</td>
						</tr>
						<tr>
							<td style="width:60px;">联系人</td>
							<td>${user.contactor}</td>
						</tr>
						<tr>
							<td style="width:60px;">腾讯号码</td>
							<td>${user.qq}</td>
						</tr>
						<tr>
							<td style="width:60px;">电子邮箱</td>
							<td>${user.email}</td>
						</tr>
						<tr>
							<td style="width:60px;">联系地址</td>
							<td>${user.address}</td>
						</tr>
						<tr>
							<td style="width:60px;">认证标识</td>
							<td>${user.credit}</td>
						</tr>
						<tr>
							<td style="width:60px;">用户级别</td>
							<td>${user.userLevel}</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
