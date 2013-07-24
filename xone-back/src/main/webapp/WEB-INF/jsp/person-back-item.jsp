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
						<li><a href="${pageContext.request.contextPath}/person/personList.html">person列表</a> <span class="divider">/</span></li>
						<li class="active">person详细</li>
					</ul>
				</div>
				<table class="table table-bordered" style="width:100%">
					<tbody>
						<tr>
							<td style="width:60px;">主键</td>
							<td>${person.id}</td>
						</tr>
						<tr>
							<td style="width:60px;">登录名</td>
							<td>${person.username}</td>
						</tr>
						<tr>
							<td style="width:60px;">登录密码</td>
							<td>${person.password}</td>
						</tr>
						<tr>
							<td style="width:60px;">显示名</td>
							<td>${person.nickName}</td>
						</tr>
						<tr>
							<td style="width:60px;">手机</td>
							<td>${person.cellphone}</td>
						</tr>
						<tr>
							<td style="width:60px;">联系人</td>
							<td>${person.contactor}</td>
						</tr>
						<tr>
							<td style="width:60px;"></td>
							<td>${person.qq}</td>
						</tr>
						<tr>
							<td style="width:60px;"></td>
							<td>${person.email}</td>
						</tr>
						<tr>
							<td style="width:60px;">所在地(reference:address.id)</td>
							<td>${person.address}</td>
						</tr>
						<tr>
							<td style="width:60px;">信用</td>
							<td>${person.credit}</td>
						</tr>
						<tr>
							<td style="width:60px;">用户等级</td>
							<td>${person.userLevel}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请人(reference:user.id)(default:0)</td>
							<td>${person.userApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">申请日期</td>
							<td>${person.dateApply}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核人(reference:user.id)(default:0)</td>
							<td>${person.userCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">审核日期</td>
							<td>${person.dateCheck}</td>
						</tr>
						<tr>
							<td style="width:60px;">是否被删除了(dict:yn)(0,否,1,是)(default:0)</td>
							<td>${person.flagDeleted}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建人(reference:user.id)(default:0)</td>
							<td>${person.userCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">创建日期</td>
							<td>${person.dateCreated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新人(reference:user.id)(default:0)</td>
							<td>${person.userUpdated}</td>
						</tr>
						<tr>
							<td style="width:60px;">更新日期</td>
							<td>${person.lastUpdated}</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
