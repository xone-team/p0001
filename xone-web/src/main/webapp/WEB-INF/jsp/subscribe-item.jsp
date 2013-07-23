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
					<li><a href="${pageContext.request.contextPath}/subscribe/subscribeList.html">subscribe列表</a> <span class="divider">/</span></li>
					<li class="active">创建subscribe</li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">编号</td>
							<td>${subscribe.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">市场区域</td>
							<td>${subscribe.marketarea}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品名称</td>
							<td>${subscribe.productNameKey}</td>
						</tr>
						<tr>
							<td style="width:60px;">销售类型</td>
							<td>${subscribe.saleType}</td>
						</tr>
						<tr>
							<td style="width:60px;">公司信誉</td>
							<td>${subscribe.credit}</td>
						</tr>
						<tr>
							<td style="width:60px;">相关编号</td>
							<td>${subscribe.refId}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请人</td>
							<td>${subscribe.userApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请时间</td>
							<td>${subscribe.dateApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核人</td>
							<td>${subscribe.userCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核时间</td>
							<td>${subscribe.dateCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">删除标识</td>
							<td>${subscribe.flagDeleted}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${subscribe.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建时间</td>
							<td>${subscribe.dateCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${subscribe.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td>${subscribe.lastUpdated}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>