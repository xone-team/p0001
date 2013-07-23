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
						<li><a href="${pageContext.request.contextPath}/adbanner/adbannerList.html">adbanner列表</a> <span class="divider">/</span></li>
						<li class="active">adbanner详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">编号</td>
							<td>${adbanner.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">相关编号</td>
							<td>${adbanner.refId}</td>
						</tr>
						<tr>
							<td style="width:60px;">广告类型</td>
							<td>${adbanner.adType}</td>
						</tr>
						<tr>
							<td style="width:60px;">相关编号</td>
							<td>${adbanner.adRefId}</td>
						</tr>
						<tr>
							<td style="width:60px;">开始时间</td>
							<td>${adbanner.adStart}</td>
						</tr>
						<tr>
							<td style="width:60px;">结束时间</td>
							<td>${adbanner.adEnd}</td>
						</tr>
						<tr>
							<td style="width:60px;">用户编号</td>
							<td>${adbanner.userId}</td>
						</tr>
						<tr>
							<td style="width:60px;">删除标识</td>
							<td>${adbanner.flagDeleted}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请人</td>
							<td>${adbanner.userApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请时间</td>
							<td>${adbanner.dateApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核人</td>
							<td>${adbanner.userCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核时间</td>
							<td>${adbanner.dateCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${adbanner.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建时间</td>
							<td>${adbanner.dateCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${adbanner.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td>${adbanner.lastUpdated}</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
