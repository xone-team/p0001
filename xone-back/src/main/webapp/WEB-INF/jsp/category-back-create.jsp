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
                        <li class="active">创建分类</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/category/categorySave.html">
                    <div class="control-group">
                        <label class="control-label" for="name">名称</label>
                        <div class="controls">
                            <input type="text" id="name" name="category.name" maxlength="1023" placeholder="名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="detail">描述</label>
                        <div class="controls">
                            <input type="text" id="detail" name="category.detail" maxlength="1023" placeholder="描述">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="sort">顺序</label>
                        <div class="controls">
                            <input type="text" id="sort" name="category.sort" maxlength="11" placeholder="顺序" value="0">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="button" class="btn" onclick="doSaveForm();">提交创建</button>
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
        jQuery("#X_menu_li_category").addClass("active");
    });
    function doSaveForm() {
        var $form = $('#saveForm');
        var validate = [ {
            name : 'name',
            text : '请输入名称'
        }, {
            name : 'sort',
            text : '请输入顺序'
        }, {
            name : 'sort',
            text : '顺序必须为数字',
            func : numberValidation
        } ];

        var pass = XONE.valid(validate, $form, "categroy.");
        if (pass)
            $form.submit();
    }
    function numberValidation(inputEl){
        var result = true;
	    var val = inputEl.val();
	    if(val != null && val.length > 0){
	        var n = null;
	        try{
	            n = parseInt(val);
	        }catch(e){}
	        
	        if(n == null || isNaN(n) || n < 0){
	            result = false;
	        }
	    }
	    return result;
    }
</script>
</html>
