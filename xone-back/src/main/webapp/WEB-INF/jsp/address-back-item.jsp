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
						<li><a href="${pageContext.request.contextPath}/address/addressList.html">address列表</a> <span class="divider">/</span></li>
						<li class="active">address详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">主键</td>
							<td>${address.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">省份编码</td>
							<td>${address.provinceCode}</td>
						</tr>
						<tr>
							<td style="width:60px;">城市编码</td>
							<td>${address.cityCode}</td>
						</tr>
						<tr>
							<td style="width:60px;">区县编码</td>
							<td>${address.districtCode}</td>
						</tr>
						<tr>
							<td style="width:60px;">详细地址</td>
							<td>${address.detail}</td>
						</tr>
						<tr>
							<td style="width:60px;">邮编</td>
							<td>${address.zip}</td>
						</tr>
						<tr>
							<td style="width:60px;">是否被删除了</td>
							<td>${address.flagDeleted}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${address.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建日期</td>
							<td><fmt:formatDate value="${address.dateCreated}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${address.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新日期</td>
							<td><fmt:formatDate value="${address.lastUpdated}" pattern="yyyy-MM-dd"/></td>
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
	     jQuery("#X_menu_li_address").addClass("active");
	 });
	</script>
</html>
