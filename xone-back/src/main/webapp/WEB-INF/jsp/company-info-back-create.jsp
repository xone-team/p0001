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
							<li class="active">创建CompanyInfo</li>
						</ul>
					</div>
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/companyinfo/companyInfoSave.html">
						<div class="control-group">
							<label class="control-label" for="name">公司名称</label>
							<div class="controls">
								<input type="text" id="name" name="companyInfo.name" maxlength="255" placeholder="公司名称">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="address">公司地址</label>
							<div class="controls">
								<input type="text" id="address" name="companyInfo.address" maxlength="255" placeholder="公司地址">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="tel">公司电话</label>
							<div class="controls">
								<input type="text" id="tel" name="companyInfo.tel" maxlength="25" placeholder="公司电话">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="mobile">移动电话</label>
							<div class="controls">
								<input type="text" id="mobile" name="companyInfo.mobile" maxlength="15" placeholder="移动电话">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="contact">联系人</label>
							<div class="controls">
								<input type="text" id="contact" name="companyInfo.contact" maxlength="15" placeholder="联系人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="fax">公司传真</label>
							<div class="controls">
								<input type="text" id="fax" name="companyInfo.fax" maxlength="25" placeholder="公司传真">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="intro">公司简介</label>
							<div class="controls">
								<input type="text" id="intro" name="companyInfo.intro" maxlength="25" placeholder="公司简介">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userId">关联用户</label>
							<div class="controls">
								<input type="text" id="userId" name="companyInfo.userId" maxlength="20" placeholder="关联用户">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userCreated">创建人</label>
							<div class="controls">
								<input type="text" id="userCreated" name="companyInfo.userCreated" maxlength="20" placeholder="创建人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="dateCreated">创建日期</label>
							<div class="controls">
								<input type="text" id="dateCreated" name="companyInfo.dateCreated" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="创建日期">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userUpdated">更新人</label>
							<div class="controls">
								<input type="text" id="userUpdated" name="companyInfo.userUpdated" maxlength="20" placeholder="更新人">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="lastUpdated">更新日期</label>
							<div class="controls">
								<input type="text" id="lastUpdated" name="companyInfo.lastUpdated" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="更新日期">
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
	     jQuery("#X_menu_li_companyinfo").addClass("active");
	 });
	</script>
</html>
