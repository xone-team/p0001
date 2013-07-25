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
						<li><a href="${pageContext.request.contextPath}/topad/topadList.html">topad列表</a> <span class="divider">/</span></li>
						<li class="active">topad编辑</li>
					</ul>
				</div>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/topad/topadUpdate.html">
					<div class="control-group">
						<label class="control-label" for="id">主键</label>
						<div class="controls">
							<input type="text" id="id" name="topad.id" value="${topad.id}" maxlength="20" placeholder="主键">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="productId">产品</label>
						<div class="controls">
							<input type="text" id="productId" name="topad.productId" value="${topad.productId}" maxlength="20" placeholder="产品">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="checkStatus">审核状态</label>
						<div class="controls">
							<input type="text" id="checkStatus" name="topad.checkStatus" value="${topad.checkStatus}" maxlength="1" placeholder="审核状态">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="remark">备注</label>
						<div class="controls">
							<input type="text" id="remark" name="topad.remark" value="${topad.remark}" maxlength="1023" placeholder="备注">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userApply">申请人</label>
						<div class="controls">
							<input type="text" id="userApply" name="topad.userApply" value="${topad.userApply}" maxlength="20" placeholder="申请人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateApply">申请日期</label>
						<div class="controls">
							<input type="text" id="dateApply" name="topad.dateApply" value="<fmt:formatDate value="${topad.dateApply}" pattern="yyyy-MM-dd"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="申请日期">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCheck">审核人</label>
						<div class="controls">
							<input type="text" id="userCheck" name="topad.userCheck" value="${topad.userCheck}" maxlength="20" placeholder="审核人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCheck">审核日期</label>
						<div class="controls">
							<input type="text" id="dateCheck" name="topad.dateCheck" value="<fmt:formatDate value="${topad.dateCheck}" pattern="yyyy-MM-dd"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="审核日期">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="flagDeleted">是否被删除了</label>
						<div class="controls">
							<input type="text" id="flagDeleted" name="topad.flagDeleted" value="${topad.flagDeleted}" maxlength="1" placeholder="是否被删除了">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人</label>
						<div class="controls">
							<input type="text" id="userCreated" name="topad.userCreated" value="${topad.userCreated}" maxlength="20" placeholder="创建人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建日期</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="topad.dateCreated" value="<fmt:formatDate value="${topad.dateCreated}" pattern="yyyy-MM-dd"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="创建日期">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="topad.userUpdated" value="${topad.userUpdated}" maxlength="20" placeholder="更新人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新日期</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="topad.lastUpdated" value="<fmt:formatDate value="${topad.lastUpdated}" pattern="yyyy-MM-dd"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="更新日期">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" name="update" value="update" class="btn">提交更新</button>
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
	     jQuery("#X_menu_li_topad").addClass("active");
	 });
	</script>
</html>
