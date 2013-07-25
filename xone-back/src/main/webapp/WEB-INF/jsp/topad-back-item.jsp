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
						<li><a href="${pageContext.request.contextPath}/topad/topadList.html">topad列表</a> <span class="divider">/</span></li>
						<li class="active">topad详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">主键</td>
							<td>${topad.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">产品</td>
							<td>${topad.productId}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核状态</td>
							<td>${topad.checkStatus}</td>
						</tr>
						<tr>
							<td style="width:60px;">备注</td>
							<td>${topad.remark}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请人</td>
							<td>${topad.userApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请日期</td>
							<td><fmt:formatDate value="${topad.dateApply}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td style="width:60px;">审核人</td>
							<td>${topad.userCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核日期</td>
							<td><fmt:formatDate value="${topad.dateCheck}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td style="width:60px;">是否被删除了</td>
							<td>${topad.flagDeleted}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${topad.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建日期</td>
							<td><fmt:formatDate value="${topad.dateCreated}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${topad.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新日期</td>
							<td><fmt:formatDate value="${topad.lastUpdated}" pattern="yyyy-MM-dd"/></td>
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
	     jQuery("#X_menu_li_topad").addClass("active");
	 });
	</script>
</html>
