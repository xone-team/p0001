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
							<li class="active">创建Address</li>
						</ul>
					</div>
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/address/addressSave.html">
						<div class="control-group">
							<label class="control-label" for="id">主键</label>
							<div class="controls">
								<input type="text" id="id" name="address.id" maxlength="20" placeholder="主键">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="provinceCode">省份编码</label>
							<div class="controls">
								<input type="text" id="provinceCode" name="address.provinceCode" maxlength="20" placeholder="省份编码">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cityCode">城市编码</label>
							<div class="controls">
								<input type="text" id="cityCode" name="address.cityCode" maxlength="20" placeholder="城市编码">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="districtCode">区县编码</label>
							<div class="controls">
								<input type="text" id="districtCode" name="address.districtCode" maxlength="20" placeholder="区县编码">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="detail">详细地址</label>
							<div class="controls">
								<input type="text" id="detail" name="address.detail" maxlength="1023" placeholder="详细地址">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="zip">邮编</label>
							<div class="controls">
								<input type="text" id="zip" name="address.zip" maxlength="10" placeholder="邮编">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="flagDeleted">是否被删除了</label>
							<div class="controls">
								<input type="text" id="flagDeleted" name="address.flagDeleted" maxlength="1" placeholder="是否被删除了">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userCreated">创建人</label>
							<div class="controls">
								<input type="text" id="userCreated" name="address.userCreated" maxlength="20" placeholder="创建人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="dateCreated">创建日期</label>
							<div class="controls">
								<input type="text" id="dateCreated" name="address.dateCreated" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="创建日期">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userUpdated">更新人</label>
							<div class="controls">
								<input type="text" id="userUpdated" name="address.userUpdated" maxlength="20" placeholder="更新人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="lastUpdated">更新日期</label>
							<div class="controls">
								<input type="text" id="lastUpdated" name="address.lastUpdated" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="更新日期">
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
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_address").addClass("active");
	 });
	</script>
</html>
