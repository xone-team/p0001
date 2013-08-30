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
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/person/personSave.html">
                    <div class="control-group">
                        <label class="control-label" for="username">用户名</label>
                        <div class="controls">
                            <input type="text" id="username" name="person.username" maxlength="20" placeholder="用户名"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">密码</label>
                        <div class="controls">
                            <input type="password" id="password" name="person.password" maxlength="20" placeholder="密码"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="nickName">昵称</label>
                        <div class="controls">
                            <input type="text" id="nickName" name="person.nickName" maxlength="20" placeholder="昵称"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cellphone">手机号码</label>
                        <div class="controls">
                            <input type="text" id="cellphone" name="person.cellphone" maxlength="11" placeholder="手机号码">
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
                            <input type="text" id="qq" name="person.qq" maxlength="20" placeholder="腾讯号码">
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
                                <c:forEach items="${credit}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == person.credit}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userLevel">用户级别</label>
                        <div class="controls">
                            <select class="selectpicker" id="userLevel" name="person.userLevel">
                                <c:forEach items="${userLevel}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == person.userLevel}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="roleIds">角色</label>
                        <div class="controls">
                            <div id="roleIdsSelectResult" class="inline">
                                <c:forEach items="${rolesList}" var="role">
                                    <input type="hidden" class="X-select-hidden-value" value="${role.id}" name="roleIds">
                                    <span class="label label-default">${role.name}</span>
                                </c:forEach>
                            </div>
                            <button type="button" class="btn inline" onclick="$('#windowTitleDialogrolescheck').modal('show');">
                                <i class="icon-filter"></i>选择
                            </button>
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

    <jsp:include page="common-modal.jsp">
        <jsp:param name="myidentify" value="rolescheck" />
        <jsp:param name="title" value="请选择角色" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/roles/rolesCheck.html" />
    </jsp:include>

</body>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
<script src="${STATIC_ROOT}/js/fileupload.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#windowTitleDialogrolescheck').delegate('button.rolescheckselectbutton', 'click', function(e) {
            e.preventDefault();
            var $this = $(this);
            var checkedRows = $("#windowTitleDialogrolescheck input.rolescheck:checked");
            if (checkedRows.size() < 1) {
                return alert("请至少选择一个角色。");
            }
            var h = "";
            checkedRows.each(function() {
                var r = $(this);
                h += '<input type="hidden" class="X-select-hidden-value" value="' + r.attr('attr-id') + '" name="roleIds">';
                h += '<span class="label label-default">' + r.attr('attr-name') + '</span>';
            })

            $("#roleIdsSelectResult").html(h);
            $this.closest('div.modal').modal('hide');
            return false;
        });
    });
</script>


<script>
    jQuery(function() {
        jQuery("#X_menu_li_person").addClass("active");
        $('#saveForm').submit(function(){
            var $form = $(this);

            var validate = [ {
                name : 'userName',
                text : '请输入用户名'
            }, {
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

            var pass = XONE.valid(validate, $form, "person.");
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

