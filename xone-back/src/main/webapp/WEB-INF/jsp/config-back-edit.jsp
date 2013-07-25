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
						<li><a href="${pageContext.request.contextPath}/config/configList.html">config列表</a> <span class="divider">/</span></li>
						<li class="active">config编辑</li>
					</ul>
				</div>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/config/configUpdate.html">
					<div class="control-group">
						<label class="control-label" for="id">主键</label>
						<div class="controls">
							<input type="text" id="id" name="config.id" value="${config.id}" maxlength="20" placeholder="主键">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="code">编码</label>
						<div class="controls">
							<input type="text" id="code" name="config.code" value="${config.code}" maxlength="20" placeholder="编码">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="name">名称</label>
						<div class="controls">
							<input type="text" id="name" name="config.name" value="${config.name}" maxlength="100" placeholder="名称">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="value">值</label>
						<div class="controls">
							<input type="text" id="value" name="config.value" value="${config.value}" maxlength="255" placeholder="值">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="flagDeleted">是否被删除了</label>
						<div class="controls">
							<input type="text" id="flagDeleted" name="config.flagDeleted" value="${config.flagDeleted}" maxlength="1" placeholder="是否被删除了">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人</label>
						<div class="controls">
							<input type="text" id="userCreated" name="config.userCreated" value="${config.userCreated}" maxlength="20" placeholder="创建人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建日期</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="config.dateCreated" value="<fmt:formatDate value="${config.dateCreated}" pattern="yyyy-MM-dd"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="创建日期">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="config.userUpdated" value="${config.userUpdated}" maxlength="20" placeholder="更新人">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新日期</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="config.lastUpdated" value="<fmt:formatDate value="${config.lastUpdated}" pattern="yyyy-MM-dd"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="更新日期">
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
	     jQuery("#X_menu_li_config").addClass("active");
	 });
	</script>
</html>
