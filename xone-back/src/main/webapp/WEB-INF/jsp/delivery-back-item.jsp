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
						<li><a href="${pageContext.request.contextPath}/delivery/deliveryList.html">delivery列表</a> <span class="divider">/</span></li>
						<li class="active">delivery详细</li>
					</ul>
				</div>
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
							<td><fmt:formatDate value="${delivery.dateApply}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td style="width:60px;">审核人</td>
							<td>${delivery.userCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核时间</td>
							<td><fmt:formatDate value="${delivery.dateCheck}" pattern="yyyy-MM-dd"/></td>
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
							<td><fmt:formatDate value="${delivery.dateCreated}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${delivery.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td><fmt:formatDate value="${delivery.lastUpdated}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
	<script>
	 jQuery(function(){
	     jQuery("#X_menu_li_delivery").addClass("active");
	 });
	</script>
</html>
