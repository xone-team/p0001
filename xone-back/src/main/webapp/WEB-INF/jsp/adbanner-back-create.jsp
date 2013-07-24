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
    		<div class="row-fluid">
				<div class="span2">
					<jsp:include page="common-menu.jsp"></jsp:include>
				</div>
				<div class="span10">
					<div class="row-fluid">
						<ul class="breadcrumb">
							<li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li>
							<li class="active">发布广告</li>
						</ul>
					</div>
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/adbanner/adbannerSave.html">
						<div class="control-group">
							<label class="control-label" for="refId">相关编号</label>
							<div class="controls">
								<input type="text" id="refId" name="adbanner.refId" maxlength="20" placeholder="相关编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adType">广告类型</label>
							<div class="controls">
								<input type="text" id="adType" name="adbanner.adType" maxlength="2" placeholder="广告类型">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adRefId">相关编号</label>
							<div class="controls">
								<input type="text" id="adRefId" name="adbanner.adRefId" maxlength="20" placeholder="相关编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adStart">开始时间</label>
							<div class="controls">
								<input type="text" id="adStart" name="adbanner.adStart" maxlength="19" placeholder="开始时间">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adEnd">结束时间</label>
							<div class="controls">
								<input type="text" id="adEnd" name="adbanner.adEnd" maxlength="19" placeholder="结束时间">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userId">用户编号</label>
							<div class="controls">
								<input type="text" id="userId" name="adbanner.userId" maxlength="20" placeholder="用户编号">
							</div>
						</div>
						<div class="control-group" style="display:none;">
							<input type="file" id="uploadImage" name="image">
						</div>
						<div class="control-group">
							<img src="text" />
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">提交创建</button>
								<button type="button" class="btn" onclick="$('#uploadImage').click();">上传图片</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
