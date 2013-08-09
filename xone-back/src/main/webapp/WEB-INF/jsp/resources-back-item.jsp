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
						<li><a href="${pageContext.request.contextPath}/resources/resourcesList.html">资源列表</a> <span class="divider">/</span></li>
						<li class="active">资源详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">编号</td>
							<td>${resources.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">资源名称</td>
							<td>${resources.name}</td>
						</tr>
						<tr>
							<td style="width:60px;">资源类型</td>
							<td>${resources.resourceType}</td>
						</tr>
						<tr>
							<td style="width:60px;">优先级</td>
							<td>${resources.priority}</td>
						</tr>
						<tr>
							<td style="width:60px;">资源地址</td>
							<td>${resources.resourceUrl}</td>
						</tr>
						<tr>
							<td style="width:60px;">备注</td>
							<td>${resources.remark}</td>
						</tr>
                        <tr>
                            <td style="width:60px;">是否可用</td>
                            <td>${resources.enableName}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">角色</td>
                            <td><c:forEach items="${rolesList}" var="role">
                                    <span class="label label-default">${role.name}</span>
                                </c:forEach></td>
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
	     jQuery("#X_menu_li_resources").addClass("active");
	 });
	</script>
</html>
