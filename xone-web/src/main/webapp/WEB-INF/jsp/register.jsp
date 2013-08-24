<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>欢迎使用</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${STATIC_ROOT}/css/docs.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/css/listview.css" />
<jsp:include page="common-header.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common-nav.jsp"><jsp:param value="2" name="offset" /></jsp:include>
    <div class="container">
        <div class="row">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/registerSave.html">
                <div class="control-group">
                    <label class="control-label" for="username">用户名</label>
                    <div class="controls">
                        <input type="text" id="username" name="user.username" maxlength="255" placeholder="用户名">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password">密码</label>
                    <div class="controls">
                        <input type="password" id="password" name="user.password" maxlength="255" placeholder="密码">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="repassword">重复输入密码</label>
                    <div class="controls">
                        <input type="password" id="repassword" name="user.repassword" maxlength="255" placeholder="重复输入密码">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="nickName">昵称</label>
                    <div class="controls">
                        <input type="text" id="nickName" name="user.nickName" maxlength="255" placeholder="昵称">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="cellphone">手机号码</label>
                    <div class="controls">
                        <input type="text" id="cellphone" name="user.cellphone" maxlength="255" placeholder="手机号码">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="contactor">联系人</label>
                    <div class="controls">
                        <input type="text" id="contactor" name="user.contactor" maxlength="255" placeholder="联系人">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="qq">腾讯号码</label>
                    <div class="controls">
                        <input type="text" id="qq" name="user.qq" maxlength="255" placeholder="腾讯号码">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="email">电子邮箱</label>
                    <div class="controls">
                        <input type="text" id="email" name="user.email" maxlength="255" placeholder="电子邮箱">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="address">联系地址</label>
                    <div class="controls">
                        <input type="text" id="address" name="user.address" maxlength="255" placeholder="联系地址">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button type="submit" class="btn btn-warning inline">注册</button>
                    </div>
                </div>
            </form>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
<c:if test="${!empty fieldErrors }">
    <script>
                    function renderFieldMessage(fieldText, status, inputEl) {
                        var controlEl = inputEl.parent();
                        var controlGroupEl = controlEl.parent();
                        controlGroupEl.removeClass("warning error info success")
                        controlGroupEl.addClass(status);
                        controlEl.children().remove(".X-field-message");
                        controlEl.append('<span class="X-field-message help-inline">' + fieldText + '</span>');
                    }
                    <c:forEach items="${fieldErrors }" var="fieldError">
                    renderFieldMessage('${fieldError.value }', "error", $('input[name="${fieldError.key}"]'));
                    </c:forEach>
                </script>
</c:if>
</html>
