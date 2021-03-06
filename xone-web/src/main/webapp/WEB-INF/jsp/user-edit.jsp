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
    <jsp:include page="common-nav.jsp"><jsp:param value="5" name="offset" /></jsp:include>
    <div class="container">
        <div class="row">
            <div class="span3">
                <jsp:include page="user-center-menu.jsp"><jsp:param value="2" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a> <span class="divider">/</span></li>
                    <li class="active">更新资料</li>
                </ul>
                <form id="saveForm" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/userUpdate.html">
                    <div class="control-group">
                        <label class="control-label" for="username">用户名</label>
                        <div class="controls">${user.username}</div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">密码</label>
                        <div class="controls">
                            <input type="password" class="hide" id="password" maxlength="20" placeholder="密码"><code>*</code>
                            <a href="javascript:void(0);" onclick="$('#password').removeClass('hide').attr('name', 'user.repassword');">重设密码</a>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="dateApply">注册时间</label>
                        <div class="controls">${user.dateApply}</div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="nickName">昵称</label>
                        <div class="controls">
                            <input type="text" id="nickName" name="user.nickName" value="${user.nickName}" maxlength="255" placeholder="昵称"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cellphone">手机号码</label>
                        <div class="controls">
                            <input type="text" id="cellphone" name="user.cellphone" value="${user.cellphone}" maxlength="255" placeholder="手机号码">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="contactor">联系人</label>
                        <div class="controls">
                            <input type="text" id="contactor" name="user.contactor" value="${user.contactor}" maxlength="255" placeholder="联系人">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="qq">腾讯号码</label>
                        <div class="controls">
                            <input type="text" id="qq" name="user.qq" value="${user.qq}" maxlength="255" placeholder="腾讯号码">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="email">电子邮箱</label>
                        <div class="controls">
                            <input type="text" id="email" name="user.email" value="${user.email}" maxlength="255" placeholder="电子邮箱">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="address">联系地址</label>
                        <div class="controls">
                            <input type="text" id="address" name="user.address" value="${user.address}" maxlength="255" placeholder="联系地址">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="credit">认证标识</label>
                        <div class="controls">${user.creditName}</div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userLevel">用户级别</label>
                        <div class="controls">${user.userLevelName}</div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn">提交更新</button>
                        </div>
                    </div>
                </form>
            </div>
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
                name : 'password',
                text : '请输入密码'
            }, {
                name : 'nickName',
                text : '请输入呢称'
            }, {
                name : 'password',
                text : '密碼在 6 － 20 个字之间',
                func : lengthValidation
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
