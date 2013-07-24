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
						<li><a href="${pageContext.request.contextPath}/person/personList.html">person列表</a> <span class="divider">/</span></li>
						<li class="active">person编辑</li>
					</ul>
				</div>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/personUpdate.html">
					<div class="control-group">
						<label class="control-label" for="id">主键</label>
						<div class="controls">
							<input type="text" id="id" name="person.id" value="${person.id}" maxlength="20" placeholder="主键">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="username">登录名</label>
						<div class="controls">
							<input type="text" id="username" name="person.username" value="${person.username}" maxlength="255" placeholder="登录名">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">登录密码</label>
						<div class="controls">
							<input type="text" id="password" name="person.password" value="${person.password}" maxlength="255" placeholder="登录密码">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="nickName">显示名</label>
						<div class="controls">
							<input type="text" id="nickName" name="person.nickName" value="${person.nickName}" maxlength="255" placeholder="显示名">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="cellphone">手机</label>
						<div class="controls">
							<input type="text" id="cellphone" name="person.cellphone" value="${person.cellphone}" maxlength="255" placeholder="手机">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="contactor">联系人</label>
						<div class="controls">
							<input type="text" id="contactor" name="person.contactor" value="${person.contactor}" maxlength="255" placeholder="联系人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="qq"></label>
						<div class="controls">
							<input type="text" id="qq" name="person.qq" value="${person.qq}" maxlength="255" placeholder="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="email"></label>
						<div class="controls">
							<input type="text" id="email" name="person.email" value="${person.email}" maxlength="255" placeholder="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="address">所在地(reference:address.id)</label>
						<div class="controls">
							<input type="text" id="address" name="person.address" value="${person.address}" maxlength="255" placeholder="所在地(reference:address.id)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="credit">信用</label>
						<div class="controls">
							<input type="text" id="credit" name="person.credit" value="${person.credit}" maxlength="2" placeholder="信用">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userLevel">用户等级</label>
						<div class="controls">
							<input type="text" id="userLevel" name="person.userLevel" value="${person.userLevel}" maxlength="2" placeholder="用户等级">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userApply">申请人(reference:user.id)(default:0)</label>
						<div class="controls">
							<input type="text" id="userApply" name="person.userApply" value="${person.userApply}" maxlength="20" placeholder="申请人(reference:user.id)(default:0)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateApply">申请日期</label>
						<div class="controls">
							<input type="text" id="dateApply" name="person.dateApply" value="${person.dateApply}" maxlength="19" placeholder="申请日期">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCheck">审核人(reference:user.id)(default:0)</label>
						<div class="controls">
							<input type="text" id="userCheck" name="person.userCheck" value="${person.userCheck}" maxlength="20" placeholder="审核人(reference:user.id)(default:0)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCheck">审核日期</label>
						<div class="controls">
							<input type="text" id="dateCheck" name="person.dateCheck" value="${person.dateCheck}" maxlength="19" placeholder="审核日期">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="flagDeleted">是否被删除了(dict:yn)(0,否,1,是)(default:0)</label>
						<div class="controls">
							<input type="text" id="flagDeleted" name="person.flagDeleted" value="${person.flagDeleted}" maxlength="1" placeholder="是否被删除了(dict:yn)(0,否,1,是)(default:0)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人(reference:user.id)(default:0)</label>
						<div class="controls">
							<input type="text" id="userCreated" name="person.userCreated" value="${person.userCreated}" maxlength="20" placeholder="创建人(reference:user.id)(default:0)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建日期</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="person.dateCreated" value="${person.dateCreated}" maxlength="19" placeholder="创建日期">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人(reference:user.id)(default:0)</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="person.userUpdated" value="${person.userUpdated}" maxlength="20" placeholder="更新人(reference:user.id)(default:0)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新日期</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="person.lastUpdated" value="${person.lastUpdated}" maxlength="19" placeholder="更新日期">
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
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_person").addClass("active");
	 });
	</script>
</html>
