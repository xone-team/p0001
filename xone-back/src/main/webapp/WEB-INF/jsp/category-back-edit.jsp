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
						<li>后台 <span class="divider">/</span></li><li>产品管理 <span class="divider">/</span></li>
						<li><a href="${pageContext.request.contextPath}/category/categoryList.html">category列表</a> <span class="divider">/</span></li>
						<li class="active">分类编辑</li>
					</ul>
				</div>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/category/categoryUpdate.html">
                <input type="hidden" name="category.id" value="${category.id}">
					<div class="control-group">
						<label class="control-label" for="name">名称</label>
						<div class="controls">
							<input type="text" id="name" name="category.name" value="${category.name}" maxlength="1023" placeholder="名称">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="detail">描述</label>
						<div class="controls">
							<input type="text" id="detail" name="category.detail" value="${category.detail}" maxlength="1023" placeholder="描述">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="sort">顺序</label>
						<div class="controls">
							<input type="text" id="sort" name="category.sort" value="${category.sort}" maxlength="11" placeholder="顺序">
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
	     jQuery("#X_menu_li_category").addClass("active");
	 });
	</script>
</html>
