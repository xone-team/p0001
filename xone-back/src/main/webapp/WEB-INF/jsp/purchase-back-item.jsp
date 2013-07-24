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
						<li><a href="${pageContext.request.contextPath}/purchase/purchaseList.html">purchase列表</a> <span class="divider">/</span></li>
						<li class="active">purchase详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">编号</td>
							<td>${purchase.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品名称</td>
							<td>${purchase.purchaseName}</td>
						</tr>
						<tr>
							<td style="width:60px;">求购类型</td>
							<td>${purchase.purchaseType}</td>
						</tr>
						<tr>
							<td style="width:60px;">求购数量</td>
							<td>${purchase.purchaseNum}</td>
						</tr>
						<tr>
							<td style="width:60px;">有效期</td>
							<td>${purchase.purchaseValid}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品产地</td>
							<td>${purchase.purchaseAddress}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品属地</td>
							<td>${purchase.purchaseLocation}</td>
						</tr>
						<tr>
							<td style="width:60px;">求购描述</td>
							<td>${purchase.purchaseDesc}</td>
						</tr>
						<tr>
							<td style="width:60px;">删除标识</td>
							<td>${purchase.flagDeleted}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请人</td>
							<td>${purchase.userApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请时间</td>
							<td>${purchase.dateApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核人</td>
							<td>${purchase.userCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核时间</td>
							<td>${purchase.dateCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${purchase.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建时间</td>
							<td>${purchase.dateCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${purchase.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td>${purchase.lastUpdated}</td>
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
	     jQuery("#X_menu_li_purchase").addClass("active");
	 });
	</script>
</html>
