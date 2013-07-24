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
						<li><a href="${pageContext.request.contextPath}/product/productList.html">product列表</a> <span class="divider">/</span></li>
						<li class="active">product详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">编号</td>
							<td>${product.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品名称</td>
							<td>${product.productName}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品类型</td>
							<td>${product.productType}</td>
						</tr>
						<tr>
							<td style="width:60px;">销售类型</td>
							<td>${product.saleType}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品价格</td>
							<td>${product.productPrice}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品数量</td>
							<td>${product.productNum}</td>
						</tr>
						<tr>
							<td style="width:60px;">有效期</td>
							<td>${product.productValid}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品产地</td>
							<td>${product.productAddress}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品属地</td>
							<td>${product.productLocation}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品描述</td>
							<td>${product.productDesc}</td>
						</tr>
						<tr>
							<td style="width:60px;">删除标识</td>
							<td>${product.flagDeleted}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请人</td>
							<td>${product.userApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请时间</td>
							<td>${product.dateApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核人</td>
							<td>${product.userCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核时间</td>
							<td>${product.dateCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${product.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建时间</td>
							<td>${product.dateCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${product.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新时间</td>
							<td>${product.lastUpdated}</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
