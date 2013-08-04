<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <li>后台 <span class="divider">/</span></li>
                        <li>用户管理 <span class="divider">/</span></li>
                        <li><a href="${pageContext.request.contextPath}/roles/rolesList.html">角色列表</a> <span class="divider">/</span></li>
                        <li class="active">角色编辑</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/roles/rolesUpdate.html">
                    <input type="hidden" id="id" name="roles.id" value="${roles.id}">
                    <div class="control-group">
                        <label class="control-label" for="name">角色名称</label>
                        <div class="controls">
                            <input type="text" id="name" name="roles.name" value="${roles.name}" maxlength="255" placeholder="角色名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="remark">角色备注</label>
                        <div class="controls">
                            <input type="text" id="remark" name="roles.remark" value="${roles.remark}" maxlength="255" placeholder="角色备注">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="enable">可用标识</label>
                        <div class="controls">
                            <select class="selectpicker" id="enable" name="roles.enable">
                                <c:forEach items="${commonTypes.ynList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == roles.enable}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="button" class="btn" onclick="doSaveForm();">提交更新</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_roles").addClass("active");
    });
    function doSaveForm(){
		var $form = $('#saveForm');
		var validate = [{
			name: 'name',
			text: '请输入角色名'
		}];
		
		var pass = XONE.valid(validate, $form, "roles.");
		if(pass)
		    $form.submit();
    }
</script>
</html>
