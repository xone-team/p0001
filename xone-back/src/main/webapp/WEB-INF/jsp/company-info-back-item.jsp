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
						<li><a href="${pageContext.request.contextPath}/companyinfo/companyInfoList.html">companyInfo列表</a> <span class="divider">/</span></li>
						<li class="active">companyInfo详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">主键</td>
							<td>${companyInfo.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">公司名称</td>
							<td>${companyInfo.name}</td>
						</tr>
						<tr>
							<td style="width:60px;">公司地址</td>
							<td>${companyInfo.address}</td>
						</tr>
						<tr>
							<td style="width:60px;">公司电话</td>
							<td>${companyInfo.tel}</td>
						</tr>
						<tr>
							<td style="width:60px;">移动电话</td>
							<td>${companyInfo.mobile}</td>
						</tr>
						<tr>
							<td style="width:60px;">联系人</td>
							<td>${companyInfo.contact}</td>
						</tr>
						<tr>
							<td style="width:60px;">公司传真</td>
							<td>${companyInfo.fax}</td>
						</tr>
						<tr>
							<td style="width:60px;">公司简介</td>
							<td>${companyInfo.intro}</td>
						</tr>
						<tr>
							<td style="width:60px;">关联用户</td>
							<td>${companyInfo.userId}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人</td>
							<td>${companyInfo.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建日期</td>
							<td><fmt:formatDate value="${companyInfo.dateCreated}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td style="width:60px;">更新人</td>
							<td>${companyInfo.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新日期</td>
							<td><fmt:formatDate value="${companyInfo.lastUpdated}" pattern="yyyy-MM-dd"/></td>
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
	     jQuery("#X_menu_li_companyinfo").addClass("active");
	 });
	</script>
</html>
