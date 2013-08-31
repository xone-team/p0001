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
    <jsp:include page="common-nav.jsp"><jsp:param value="0" name="offset" /></jsp:include>
    <div class="container">
        <div class="row">
            <form id="saveForm" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/registerSave.html">
                <div class="control-group">
                    <label class="control-label" for="username">用户名</label>
                    <div class="controls">
                        <input type="text" id="username" name="user.username" maxlength="20" placeholder="用户名"><code>*</code>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password">密码</label>
                    <div class="controls">
                        <input type="password" id="password" name="user.password" maxlength="20" placeholder="密码"><code>*</code>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="repassword">重复输入密码</label>
                    <div class="controls">
                        <input type="password" id="repassword" name="user.repassword" maxlength="20" placeholder="重复输入密码"><code>*</code>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="nickName">昵称</label>
                    <div class="controls">
                        <input type="text" id="nickName" name="user.nickName" maxlength="20" placeholder="昵称"><code>*</code>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="cellphone">手机号码</label>
                    <div class="controls">
                        <input type="text" id="cellphone" name="user.cellphone" maxlength="11" placeholder="手机号码">
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
                        <input type="text" id="qq" name="user.qq" maxlength="20" placeholder="腾讯号码">
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
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<script>
    $(function() {
        $('#saveForm').submit(function() {
            var $form = $(this);

            var validate = [ {
                name : 'userName',
                text : '请输入用户名'
            }, {
                name : 'password',
                text : '请输入密码'
            }, {
                name : 'repassword',
                text : '请重复输入一次密码'
            }, {
                name : 'nickName',
                text : '请输入呢称'
            }, {
                name : 'userName',
                text : '用户名在 6 － 20 个字之间',
                func : lengthValidation
            }, {
                name : 'password',
                text : '密碼在 6 － 20 个字之间',
                func : lengthValidation
            }, {
                name : 'repassword',
                text : '两次输入的密码不一致',
                func : passwordConfirm
            }, {
                name : 'cellphone',
                text : '请输入正确的手机号',
                func : isCellphone
            }, {
                name : 'qq',
                text : '请输入正确的QQ号',
                func : isQQ
            }, {
                name : 'email',
                text : '请输入正确的邮箱',
                func : isEmail
            } ];

            var pass = XONE.valid(validate, $form, "user.");
            return pass;
        });
		
        $("#username").bind("blur", function(){
            $nickName = $("#nickName");
            if($nickName.val() == null || $nickName.val().length < 1)
                $nickName.val($(this).val());
        });
    });
    function isEmail(){
        var result = true;
        var v = $("#email").val();
        if(v != null && v.length > 0){
            result = v.match(/[^@]+@[^@]/g);
        }
        return result;
    }
    
    function isQQ(){
        var result = true;
        var v = $("#qq").val();
        if(v != null && v.length > 0){
            result = v.match(/\d{5,11}/g);
        }
        return result;
    }
    
    function isCellphone(){
        var result = true;
        var v = $("#cellphone").val();
        if(v != null && v.length > 0){
            result = v.match(/1\d{10}/g);
        }
        return result;
    }
    
    function passwordConfirm(){
        var result = true;
        var passval = $("#password").val();
        var repassval = $("#repassword").val();
        if(repassval != passval){
            result = false;
        }
        return result;
    }
    
    function lengthValidation(inputEl){
        var result = true;
	    var val = inputEl.val();
	    if(val != null && val.length > 0){
	        var l = val.length;
	        if(l < 6 || l > 20){
	            result = false;
	        }
	    }
	    return result;
    }
    
    function numberValidation(inputEl) {
        var result = true;
        var val = inputEl.val();
        if (val != null && val.length > 0) {
            var n = null;
            try {
                n = parseInt(val);
            } catch (e) {
            }

            if (n == null || isNaN(n) || n < 0) {
                result = false;
            }
        }
        return result;
    }
</script>
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
