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
						<li class="active">address编辑</li>
					</ul>
				</div>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/addressUpdate.html">
					<div class="control-group">
						<label class="control-label" for="id">主键</label>
						<div class="controls">
							<input type="text" id="id" name="address.id" value="${address.id}" maxlength="20" placeholder="主键">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="provinceCode">省份编码(reference:province.code)</label>
						<div class="controls">
							<input type="text" id="provinceCode" name="address.provinceCode" value="${address.provinceCode}" maxlength="20" placeholder="省份编码(reference:province.code)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="cityCode">城市编码(reference:city.code)</label>
						<div class="controls">
							<input type="text" id="cityCode" name="address.cityCode" value="${address.cityCode}" maxlength="20" placeholder="城市编码(reference:city.code)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="districtCode">区县编码(reference:district.code)</label>
						<div class="controls">
							<input type="text" id="districtCode" name="address.districtCode" value="${address.districtCode}" maxlength="20" placeholder="区县编码(reference:district.code)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="detail">详细地址</label>
						<div class="controls">
							<input type="text" id="detail" name="address.detail" value="${address.detail}" maxlength="1023" placeholder="详细地址">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="zip">邮编</label>
						<div class="controls">
							<input type="text" id="zip" name="address.zip" value="${address.zip}" maxlength="10" placeholder="邮编">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="flagDeleted">是否被删除了(dict:yn)(0,否,1,是)(default:0)</label>
						<div class="controls">
							<input type="text" id="flagDeleted" name="address.flagDeleted" value="${address.flagDeleted}" maxlength="1" placeholder="是否被删除了(dict:yn)(0,否,1,是)(default:0)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userCreated">创建人(reference:user.id)(default:0)</label>
						<div class="controls">
							<input type="text" id="userCreated" name="address.userCreated" value="${address.userCreated}" maxlength="20" placeholder="创建人(reference:user.id)(default:0)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="dateCreated">创建日期</label>
						<div class="controls">
							<input type="text" id="dateCreated" name="address.dateCreated" value="${address.dateCreated}" maxlength="19" placeholder="创建日期">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="userUpdated">更新人(reference:user.id)(default:0)</label>
						<div class="controls">
							<input type="text" id="userUpdated" name="address.userUpdated" value="${address.userUpdated}" maxlength="20" placeholder="更新人(reference:user.id)(default:0)">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastUpdated">更新日期</label>
						<div class="controls">
							<input type="text" id="lastUpdated" name="address.lastUpdated" value="${address.lastUpdated}" maxlength="19" placeholder="更新日期">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" name="update" value="update" class="btn">提交更新</button>
							<button type="submit" name="delete" value="delete" class="btn">删除角色</button>
						</div>
					</div>
				</form>
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
