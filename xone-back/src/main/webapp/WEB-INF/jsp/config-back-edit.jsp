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
                        <li>产品管理 <span class="divider">/</span></li>
                        <li><a href="${pageContext.request.contextPath}/config/configList.html">系统设置列表</a> <span class="divider">/</span></li>
                        <li class="active">编辑系统设置项</li>
                    </ul>
                </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/config/configUpdate.html">
                    <input type="hidden" name="config.id" value="${config.id}">
                    <div class="control-group">
                        <label class="control-label" for="code">编码</label>
                        <div class="controls">
                            <input type="text" id="code" name="config.code" value="${config.code}" maxlength="20" placeholder="编码">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="name">名称</label>
                        <div class="controls">
                            <input type="text" id="name" name="config.name" value="${config.name}" maxlength="100" placeholder="名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="value">值</label>
                        <div class="controls">
                            <input type="text" id="value" name="config.value" value="${config.value}" maxlength="255" placeholder="值">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn">提交更新</button>
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
        jQuery("#X_menu_li_config").addClass("active");
    });
</script>
</html>
