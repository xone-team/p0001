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
                        <li class="active">创建求购</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/purchase/purchaseSave.html">
                    <div class="control-group">
                        <label class="control-label" for="purchaseName">产品名称</label>
                        <div class="controls">
                            <input type="text" id="purchaseName" name="purchase.purchaseName" maxlength="255" placeholder="产品名称"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseType">求购类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="purchaseType" name="purchase.purchaseType">
                                <c:forEach items="${purchaseType}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == purchase.purchaseType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseNum">求购数量</label>
                        <div class="controls">
                            <input type="text" id="purchaseNum" name="purchase.purchaseNum" value="${purchase.purchaseNum }" maxlength="255" placeholder="求购数量"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseAddress">产品产地</label>
                        <div class="controls">
                            <input type="text" id="purchaseAddress" name="purchase.purchaseAddress" maxlength="255" placeholder="产品产地"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseLocation">产品属地</label>
                        <div class="controls">
                            <input type="text" id="purchaseLocation" name="purchase.purchaseLocation" maxlength="255" placeholder="产品属地"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseDesc">求购描述</label>
                        <div class="controls">
                            <input type="text" id="purchaseDesc" name="purchase.purchaseDesc" maxlength="255" placeholder="求购描述"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseDesc">求购图片</label>
                        <div class="controls">
                            <div class="span4">
                                <div class="control-group uploadimagesdiv1" style="margin-bottom: 0px;"></div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile1').click();">上传图片</button>
                            </div>
                            <div class="span4">
                                <div class="control-group uploadimagesdiv2" style="margin-bottom: 0px;"></div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile2').click();">上传图片</button>
                            </div>
                            <div class="span4">
                                <div class="control-group uploadimagesdiv3" style="margin-bottom: 0px;"></div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile3').click();">上传图片</button>
                            </div>
                            <input type="file" class="hide" id="uploadImageFile1" name="uploadFile1" value="">
                            <input type="file" class="hide" id="uploadImageFile2" name="uploadFile2" value="">
                            <input type="file" class="hide" id="uploadImageFile3" name="uploadFile3" value="">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="create" value="create" class="btn">提交创建</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
<script src="${STATIC_ROOT}/js/fileupload.js"></script>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_purchase").addClass("active");

        $('#uploadImageFile1[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removePurchaseDynamicImage1();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadpurchasedynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv1').html('').append(div);
            }
        });
        $('#uploadImageFile2[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removePurchaseDynamicImage2();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadpurchasedynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv2').html('').append(div);
            }
        });
        $('#uploadImageFile3[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removePurchaseDynamicImage3();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadpurchasedynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv3').html('').append(div);
            }
        });

        $('#saveForm').submit(function() {
            var $form = $(this);
            var validate = [ {
                name : 'purchase.purchaseName',
                text : '请输入产品名'
            }, {
                name : 'purchase.purchasePrice',
                text : '请输入产品价格'
            }, {
                name : 'purchase.purchaseNum',
                text : '请输入产品数量'
            }, {
                name : 'purchase.purchaseAddress',
                text : '请输入产品产地'
            }, {
                name : 'purchase.purchaseLocation',
                text : '请输入产品属地'
            }, {
                name : 'purchase.purchaseDesc',
                text : '请输入产品描述'
            }, {
                name : 'uploadFile1',
                text : '请上传主图片'
            } ];
            var pass = XONE.valid(validate, $form, "");
            return pass;
        });
    });
    
    function removePurchaseDynamicImage1() {
        $('div.uploadimagesdiv1').html('');
        $('#uploadImageFile1').val('');
        return false;
    }
    function removePurchaseDynamicImage2() {
        $('div.uploadimagesdiv2').html('');
        $('#uploadImageFile2').val('');
        return false;
    }
    function removePurchaseDynamicImage3() {
        $('div.uploadimagesdiv3').html('');
        $('#uploadImageFile3').val('');
        return false;
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
</html>
