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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="13" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心<span class="divider">/</span></li>
                    <li>我的求购发布 <span class="divider">/</span></li>
                    <li><a href="${pageContext.request.contextPath}/purchase/purchaseList.html">求购列表</a> <span class="divider">/</span></li>
                    <li class="active">编辑求购</li>
                </ul>
                <c:if test="${!empty actionErrors }">
                    <div class="alert">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach items="${actionErrors }" var="error">
                            <p>${error }</p>
                        </c:forEach>
                    </div>
                </c:if>
                <form class="form-horizontal" enctype="multipart/form-data" id="saveForm" method="post" action="${pageContext.request.contextPath}/purchase/purchaseUpdate.html">
                    <input type="hidden" name="purchase.id" value="${purchase.id}">
                    <div class="control-group">
                        <label class="control-label" for="purchaseName">产品名称</label>
                        <div class="controls">
                            <input type="text" id="purchaseName" name="purchase.purchaseName" value="${purchase.purchaseName}" maxlength="255" placeholder="产品名称">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseType">求购类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="purchaseType" name="purchase.purchaseType">
                                <c:forEach items="${purchaseType}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == purchase.purchaseType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseNum">求购数量</label>
                        <div class="controls">
                            <input type="text" id="purchaseNum" name="purchase.purchaseNum" value="${purchase.purchaseNum}" maxlength="255" placeholder="求购数量">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseAddress">产品产地</label>
                        <div class="controls">
                            <input type="text" id="purchaseAddress" name="purchase.purchaseAddress" value="${purchase.purchaseAddress}" maxlength="255" placeholder="产品产地">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseLocation">产品属地</label>
                        <div class="controls">
                            <input type="text" id="purchaseLocation" name="purchase.purchaseLocation" value="${purchase.purchaseLocation}" maxlength="255" placeholder="产品属地">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseDesc">求购描述</label>
                        <div class="controls">
                            <input type="text" id="purchaseDesc" name="purchase.purchaseDesc" value="${purchase.purchaseDesc}" maxlength="255" placeholder="求购描述">
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="purchaseDesc">求购图片</label>
                        <div class="controls row-fluid">
                            <div class="span4">
                                <div class="control-group uploadimagesdiv1" style="margin-bottom: 0px;">
                                    <c:forEach items="${purchase.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 0 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removePurchaseDynamicImage1('${it}');" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadpurchasedynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile1').click();">上传图片</button>
                            </div>
                            <div class="span4">
                                <div class="control-group uploadimagesdiv2" style="margin-bottom: 0px;">
                                    <c:forEach items="${purchase.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 1 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removePurchaseDynamicImage2('${it}');" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadpurchasedynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile2').click();">上传图片</button>
                            </div>
                            <div class="span4">
                                <div class="control-group uploadimagesdiv3" style="margin-bottom: 0px;">
                                    <c:forEach items="${purchase.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 2 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removePurchaseDynamicImage3('${it}');" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadpurchasedynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile3').click();">上传图片</button>
                            </div>
                            <input type="file" style="display: none;" id="uploadImageFile1" name="uploadFile1" value="">
                            <input type="file" style="display: none;" id="uploadImageFile2" name="uploadFile2" value="">
                            <input type="file" style="display: none;" id="uploadImageFile3" name="uploadFile3" value="">
                        </div>
                    </div>
                    <div class="control-group fileupload" style="display: none;">
                        <c:forEach items="${purchase.ids}" var="it" varStatus="status">
                            <input type="hidden" id="imageId${status.index + 1}" name="purchase.ids" value="${it}">
                        </c:forEach>
                    </div>


                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn" onclick="return confirm('确定更新本条记录?');">提交更新</button>
                            <c:if test="${purchase.checkStatus  == '0'}">
                                <button type="submit" name="delete" value="delete" class="btn" onclick="return confirm('确定关闭本条记录?');">关闭数据</button>
                            </c:if>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
<script src="${STATIC_ROOT}/js/fileupload.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_purchase").addClass("active");

        $('#uploadImageFile1[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removePurchaseDynamicImage1();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadpurchasedynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv1').html('').append(div);
                $('#imageId1').remove();
            }
        });
        $('#uploadImageFile2[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removePurchaseDynamicImage2();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadpurchasedynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv2').html('').append(div);
                $('#imageId2').remove();
            }
        });
        $('#uploadImageFile3[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removePurchaseDynamicImage3();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadpurchasedynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv3').html('').append(div);
                $('#imageId3').remove();
            }
        });

        $('#saveForm').submit(function() {
            var $form = $(this);
            var validate = [ {
                name : 'purchase.purchaseName',
                text : '请输入求购产品名'
            }, {
                name : 'purchase.purchasePrice',
                text : '请输入求购产品价格'
            }, {
                name : 'purchase.purchaseNum',
                text : '请输入求购产品数量'
            }, {
                name : 'purchase.purchaseAddress',
                text : '请输入求购产品产地'
            }, {
                name : 'purchase.purchaseLocation',
                text : '请输入求购产品属地'
            }, {
                name : 'uploadFile1',
                text : '请上传主图片',
                func : imageRequired
            } ];
            var pass = XONE.valid(validate, $form, "");
            return pass;
        });
    });
    function imageRequired() {
        var result = true;
        try {
            result = !($("input[name='purchase.ids']").size() < 1 && $("#uploadImageFile1").val().length < 1 && $("#uploadImageFile2").val().length < 1 && $("#uploadImageFile3").val().length < 1)
        } catch (e) {
            alert(e)
        }
        return result;
    }

    function removePurchaseDynamicImage1(id) {
        $('div.uploadimagesdiv1').html('');
        $('#uploadImageFile1').val('');
        if (id != null)
            $('input[name="purchase.ids"][value="' + id + '"]').remove();
        return false;
    }
    function removePurchaseDynamicImage2(id) {
        $('div.uploadimagesdiv2').html('');
        $('#uploadImageFile2').val('');
        if (id != null)
            $('input[name="purchase.ids"][value="' + id + '"]').remove();
        return false;
    }
    function removePurchaseDynamicImage3(id) {
        $('div.uploadimagesdiv3').html('');
        $('#uploadImageFile3').val('');
        if (id != null)
            $('input[name="purchase.ids"][value="' + id + '"]').remove();
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

            if (n == null || isNaN(n) || n < 1) {
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
