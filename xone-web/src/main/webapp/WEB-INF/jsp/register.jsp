<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="common-header.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common-nav.jsp"><jsp:param value="0" name="offset" /></jsp:include>
    <!--主体-->
    <div id="container">
        <!--位置导航-->
        <div class="wzdh">首页&nbsp;&gt;&nbsp;用户注册</div>
        <!--位置导航 end-->
        <form  id="saveForm" method="post" action="${pageContext.request.contextPath}/user/registerSave.html" class="form">
            <div class="register">
                <div class="register_pic">
                    <img src="${STATIC_ROOT}/new-style/images/register.gif" width="106" height="37" />
                </div>
                <div class="register_name">

                    <ul>
                        <li><label><span>*</span>用户名</label> <input name="user.username" maxlength="20" type="text" class="input" style="width: 250px;" /></li>
                        <li><label><span>*</span>密码</label> <input name="user.password" maxlength="20" type="password" class="input" style="width: 250px;" /></li>
                        <li><label><span>*</span>确认密码</label> <input name="user.repassword" maxlength="20" type="password" class="input" style="width: 250px;" /></li>
                        <li><label><span>*</span>昵称</label> <input name="user.nickName" maxlength="20" type="text" class="input" style="width: 250px;" /></li>
                        <li><label>手机号</label> <input name="user.cellphone" maxlength="11" type="text" class="input" style="width: 250px;" /></li>
                        <li><label>联系人</label> <input name="user.contactor" maxlength="255" type="text" class="input" style="width: 250px;" /></li>
                        <li><label>QQ号码</label> <input name="user.qq" maxlength="20" type="text" class="input" style="width: 250px;" /></li>
                        <li><label>电子邮箱</label> <input name="user.email" maxlength="255" type="text" class="input" style="width: 250px;" /></li>
                        <li><label>联系地址</label> <input name="user.address" maxlength="255" type="text" class="input" style="width: 250px;" /></li>
                        <li><label></label> <input type="submit" value="确认注册" class="input2" style="width: 250px;" /></li>
                    </ul>

                </div>
                <div class="register_r">
                    <p>
                        请认真、仔细地填写以下信息，严肃的商业信息有助于您获得别人的信任，结交潜在的商业伙伴，获取商业机会！<br /> <br />
                    </p>
                    <p>
                        为了提高本网站的质量，请大家认真负责的发布信息。出现以下问题一律删除账号：<br /> <br />
                    </p>
                    <p>发布重复、违法、虚假、分类不正确、标题和概述带有特殊字符、内容排版很乱。</p>
                    <br />
                    <p class="red b">带*号项目为必填项目</p>
                    <br />
                    <br />
                    <br />
                </div>
                <div class="cb"></div>
            </div>
        </form>
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
