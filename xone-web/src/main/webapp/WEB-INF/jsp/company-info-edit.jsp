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
					<li><a href="${pageContext.request.contextPath}/companyinfo/companyInfoList.html">companyInfo列表</a> <span class="divider">/</span></li>
					<li class="active">companyInfo编辑</li>
				</ul>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/companyInfoUpdate.html">
					<input type="hidden" name="companyInfo.id" value="${companyInfo.id}" />
					<div class="control-group">
						<label class="control-label" for="name">公司名称</label>
						<div class="controls">
							<input type="text" id="name" name="companyInfo.name" value="${companyInfo.name}" maxlength="255" placeholder="公司名称">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="address">公司地址</label>
						<div class="controls">
							<input type="text" id="address" name="companyInfo.address" value="${companyInfo.address}" maxlength="255" placeholder="公司地址">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="tel">公司电话</label>
						<div class="controls">
							<input type="text" id="tel" name="companyInfo.tel" value="${companyInfo.tel}" maxlength="25" placeholder="公司电话">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="mobile">移动电话</label>
						<div class="controls">
							<input type="text" id="mobile" name="companyInfo.mobile" value="${companyInfo.mobile}" maxlength="15" placeholder="移动电话">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="contact">联系人</label>
						<div class="controls">
							<input type="text" id="contact" name="companyInfo.contact" value="${companyInfo.contact}" maxlength="15" placeholder="联系人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="fax">公司传真</label>
						<div class="controls">
							<input type="text" id="fax" name="companyInfo.fax" value="${companyInfo.fax}" maxlength="25" placeholder="公司传真">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="intro">公司简介</label>
						<div class="controls">
							<input type="text" id="intro" name="companyInfo.intro" value="${companyInfo.intro}" maxlength="25" placeholder="公司简介">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userId">关联用户</label>
						<div class="controls">
							<input type="text" id="userId" name="companyInfo.userId" value="${companyInfo.userId}" maxlength="20" placeholder="关联用户">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人</label>
						<div class="controls">
							<input type="text" id="userCreated" name="companyInfo.userCreated" value="${companyInfo.userCreated}" maxlength="20" placeholder="创建人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建日期</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="companyInfo.dateCreated" value="${companyInfo.dateCreated}" maxlength="19" placeholder="创建日期">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="companyInfo.userUpdated" value="${companyInfo.userUpdated}" maxlength="20" placeholder="更新人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新日期</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="companyInfo.lastUpdated" value="${companyInfo.lastUpdated}" maxlength="19" placeholder="更新日期">
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
