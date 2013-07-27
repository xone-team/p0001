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
                        <li class="active">创建用户</li>
                    </ul>
                </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/person/personSave.html">
                    <div class="control-group">
                        <label class="control-label" for="username">用户名</label>
                        <div class="controls">
                            <input type="text" id="username" name="person.username" maxlength="255" placeholder="用户名">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">密码</label>
                        <div class="controls">
                            <input type="text" id="password" name="person.password" maxlength="255" placeholder="密码">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="nickName">昵称</label>
                        <div class="controls">
                            <input type="text" id="nickName" name="person.nickName" maxlength="255" placeholder="昵称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cellphone">手机号码</label>
                        <div class="controls">
                            <input type="text" id="cellphone" name="person.cellphone" maxlength="255" placeholder="手机号码">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="contactor">联系人</label>
                        <div class="controls">
                            <input type="text" id="contactor" name="person.contactor" maxlength="255" placeholder="联系人">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="qq">腾讯号码</label>
                        <div class="controls">
                            <input type="text" id="qq" name="person.qq" maxlength="255" placeholder="腾讯号码">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="email">电子邮箱</label>
                        <div class="controls">
                            <input type="text" id="email" name="person.email" maxlength="255" placeholder="电子邮箱">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="address">联系地址</label>
                        <div class="controls">
                            <input type="text" id="address" name="person.address" maxlength="255" placeholder="联系地址">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="credit">认证标识</label>
                        <div class="controls">
                            <select class="selectpicker" id="credit" name="person.credit">
                                <c:forEach items="${commonTypes.ynList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == person.credit}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userLevel">用户级别</label>
                        <div class="controls">
                            <select class="selectpicker" id="userLevel" name="person.userLevel">
                                <c:forEach items="${commonTypes.userLevelList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == person.userLevel}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn">提交创建</button>
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
        jQuery("#X_menu_li_user").addClass("active");
    });
</script>
</html>

