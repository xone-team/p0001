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
							<li class="active">创建Purchase</li>
						</ul>
					</div>
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/purchase/purchaseSave.html">
						<div class="control-group">
							<label class="control-label" for="id">编号</label>
							<div class="controls">
								<input type="text" id="id" name="purchase.id" maxlength="20" placeholder="编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="purchaseName">产品名称</label>
							<div class="controls">
								<input type="text" id="purchaseName" name="purchase.purchaseName" maxlength="255" placeholder="产品名称">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="purchaseType">求购类型</label>
							<div class="controls">
								<input type="text" id="purchaseType" name="purchase.purchaseType" maxlength="2" placeholder="求购类型">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="purchaseNum">求购数量</label>
							<div class="controls">
								<input type="text" id="purchaseNum" name="purchase.purchaseNum" maxlength="255" placeholder="求购数量">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="purchaseValid">有效期</label>
							<div class="controls">
								<input type="text" id="purchaseValid" name="purchase.purchaseValid" maxlength="19" placeholder="有效期">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="purchaseAddress">产品产地</label>
							<div class="controls">
								<input type="text" id="purchaseAddress" name="purchase.purchaseAddress" maxlength="255" placeholder="产品产地">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="purchaseLocation">产品属地</label>
							<div class="controls">
								<input type="text" id="purchaseLocation" name="purchase.purchaseLocation" maxlength="255" placeholder="产品属地">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="purchaseDesc">求购描述</label>
							<div class="controls">
								<input type="text" id="purchaseDesc" name="purchase.purchaseDesc" maxlength="255" placeholder="求购描述">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="flagDeleted">删除标识</label>
							<div class="controls">
								<input type="text" id="flagDeleted" name="purchase.flagDeleted" maxlength="1" placeholder="删除标识">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userApply">申请人</label>
							<div class="controls">
								<input type="text" id="userApply" name="purchase.userApply" maxlength="20" placeholder="申请人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="dateApply">申请时间</label>
							<div class="controls">
								<input type="text" id="dateApply" name="purchase.dateApply" maxlength="19" placeholder="申请时间">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userCheck">审核人</label>
							<div class="controls">
								<input type="text" id="userCheck" name="purchase.userCheck" maxlength="20" placeholder="审核人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="dateCheck">审核时间</label>
							<div class="controls">
								<input type="text" id="dateCheck" name="purchase.dateCheck" maxlength="19" placeholder="审核时间">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userCreated">创建人</label>
							<div class="controls">
								<input type="text" id="userCreated" name="purchase.userCreated" maxlength="20" placeholder="创建人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="dateCreated">创建时间</label>
							<div class="controls">
								<input type="text" id="dateCreated" name="purchase.dateCreated" maxlength="19" placeholder="创建时间">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userUpdated">更新人</label>
							<div class="controls">
								<input type="text" id="userUpdated" name="purchase.userUpdated" maxlength="20" placeholder="更新人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="lastUpdated">更新时间</label>
							<div class="controls">
								<input type="text" id="lastUpdated" name="purchase.lastUpdated" maxlength="19" placeholder="更新时间">
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">提交创建</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
