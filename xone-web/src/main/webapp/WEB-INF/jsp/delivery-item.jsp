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
					<li><a href="${pageContext.request.contextPath}/delivery/deliveryList.html">delivery列表</a> <span class="divider">/</span></li>
					<li class="active">创建delivery</li>
				</ul>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">编号</td>
							<td>${delivery.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品编号</td>
							<td>${delivery.productId}</td>
						</tr>
						<tr>
							<td style="width:60px;">市场区域</td>
							<td>${delivery.marketarea}</td>
						</tr>
						<tr>
							<td style="width:60px;">目的地点</td>
							<td>${delivery.determini}</td>
						</tr>
						<tr>
							<td style="width:60px;">上货时间</td>
							<td>${delivery.loadtime}</td>
						</tr>
						<tr>
							<td style="width:60px;">上货地点</td>
							<td>${delivery.loadaddress}</td>
						</tr>
						<tr>
							<td style="width:60px;">箱数</td>
							<td>${delivery.boxNum}</td>
						</tr>
						<tr>
							<td style="width:60px;">单位重量</td>
							<td>${delivery.unitNum}</td>
						</tr>
						<tr>
							<td style="width:60px;">总箱数</td>
							<td>${delivery.boxTotal}</td>
						</tr>
						<tr>
							<td style="width:60px;">总重</td>
							<td>${delivery.totalWeight}</td>
						</tr>
						<tr>
							<td style="width:60px;">通过标识</td>
							<td>${delivery.flagPass}</td>
						</tr>
						<tr>
							<td style="width:60px;">备注</td>
							<td>${delivery.remark}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请人</td>
							<td>${delivery.userApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请时间</td>
							<td>${delivery.dateApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核人</td>
							<td>${delivery.userCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核时间</td>
							<td>${delivery.dateCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">删除标识</td>
							<td>${delivery.flagDeleted}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${delivery.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建时间</td>
							<td>${delivery.dateCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${delivery.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td>${delivery.lastUpdated}</td>
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
