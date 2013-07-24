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
						<li><a href="${pageContext.request.contextPath}/imageuploaded/imageUploadedList.html">imageUploaded列表</a> <span class="divider">/</span></li>
						<li class="active">imageUploaded详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">编号</td>
							<td>${imageUploaded.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">相关编号</td>
							<td>${imageUploaded.refId}</td>
						</tr>
						<tr>
							<td style="width:60px;">相关类型</td>
							<td>${imageUploaded.refType}</td>
						</tr>
						<tr>
							<td style="width:60px;">图片类型</td>
							<td>${imageUploaded.imageType}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${imageUploaded.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建时间</td>
							<td>${imageUploaded.dateCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${imageUploaded.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td>${imageUploaded.lastUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">名称</td>
							<td>${imageUploaded.image}</td>
						</tr>
						<tr>
							<td style="width:60px;">删除标识</td>
							<td>${imageUploaded.flagDeleted}</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
