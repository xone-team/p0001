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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="9" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <div class="row-fluid">
                    <ul class="breadcrumb" id="X_breadcrumbs_ul">
                        <li>用户中心<span class="divider">/</span></li>
                        <li>我的售卖发布 <span class="divider">/</span></li>
                        <li><a href="${pageContext.request.contextPath}/product/productList.html">产品列表</a> <span class="divider">/</span></li>
                        <li class="active">编辑产品</li>
                    </ul>
                </div>
                <c:if test="${!empty actionErrors }">
                    <div class="alert">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach items="${actionErrors }" var="error">
                            <p>${error }</p>
                        </c:forEach>
                    </div>
                </c:if>
                <form class="form-horizontal" enctype="multipart/form-data" id="productEditForm${myidentify}" method="post" action="${pageContext.request.contextPath}/product/productUpdate.html">
                    <input type="hidden" name="product.id" value="${product.id}">
                    <div class="control-group">
                        <label class="control-label" for="productName">产品名称</label>
                        <div class="controls">
                            <input type="text" id="productName" name="product.productName" value="${product.productName}" maxlength="255" placeholder="产品名称">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productType">产品类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="productType" name="product.productType">
                                <c:forEach items="${productType}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == product.productType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="saleType">销售类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="saleType" name="product.saleType">
                                <c:forEach items="${saleType}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == product.saleType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productPrice">产品价格</label>
                        <div class="controls">
                            <input type="text" id="productPrice" name="product.productPrice" value="${product.productPrice}" maxlength="20" placeholder="产品价格">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productNum">产品数量</label>
                        <div class="controls">
                            <input type="text" id="productNum" name="product.productNum" value="${product.productNum}" maxlength="20" placeholder="产品数量">
                            <code>*</code>
                        </div>
                    </div>
                    <c:if test="${product.saleType  == '2'}">
                        <div class="control-group">
                            <label class="control-label" for="productNum">团购情况</label>
                            <div class="controls">该产品已有 ${orderedPersonNum} 人参加团购，共团购 ${orderedProductNum} 件。</div>
                        </div>
                    </c:if>
                    <div class="control-group">
                        <label class="control-label" for="productAddress">产品产地</label>
                        <div class="controls">
                            <input type="text" id="productAddress" name="product.productAddress" value="${product.productAddress}" maxlength="255" placeholder="产品产地">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productLocation">产品属地</label>
                        <div class="controls">
                            <input type="text" id="productLocation" name="product.productLocation" value="${product.productLocation}" maxlength="255" placeholder="产品属地">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productDesc">产品描述</label>
                        <div class="controls">
                            <input type="text" id="productDesc" name="product.productDesc" value="${product.productDesc}" maxlength="255" placeholder="产品描述">
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="productDesc">产品图片</label>
                        <div class="controls row-fluid">
                            <div class="span4">
                                <div class="control-group uploadimagesdiv1" style="margin-bottom: 0px;">
                                    <c:forEach items="${product.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 0 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removeProductDynamicImage1('${it}');" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadproductdynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile1').click();">上传图片</button>
                            </div>
                            <div class="span4">
                                <div class="control-group uploadimagesdiv2" style="margin-bottom: 0px;">
                                    <c:forEach items="${product.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 1 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removeProductDynamicImage2('${it}');" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadproductdynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile2').click();">上传图片</button>
                            </div>
                            <div class="span4">
                                <div class="control-group uploadimagesdiv3" style="margin-bottom: 0px;">
                                    <c:forEach items="${product.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 2 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removeProductDynamicImage3('${it}');" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadproductdynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
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
                        <c:forEach items="${product.ids}" var="it" varStatus="status">
                            <input type="hidden" id="imageId${status.index + 1}" name="product.ids" value="${it}">
                        </c:forEach>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn" onclick="return confirm('确定更新本条记录?');">提交更新</button>
                            <c:if test="${product.checkStatus  == '0'}">
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
        jQuery("#X_menu_li_product").addClass("active");
        $('#uploadImageFile1[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeProductDynamicImage1();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadproductdynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv1').html('').append(div);
                $('#imageId1').remove();
            }
        });
        $('#uploadImageFile2[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeProductDynamicImage2();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadproductdynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv2').html('').append(div);
                $('#imageId2').remove();
            }
        });
        $('#uploadImageFile3[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeProductDynamicImage3();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadproductdynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv3').html('').append(div);
                $('#imageId3').remove();
            }
        });

        $('#productEditForm${myidentify}').submit(function() {
            var $form = $(this);
            var validate = [ {
                name : 'product.productName',
                text : '请输入产品名'
            }, {
                name : 'product.productType',
                text : '请选择产品类型',
                find : findSelectEl
            }, {
                name : 'product.saleType',
                text : '请选择销售类型',
                find : findSelectEl
            }, {
                name : 'product.productPrice',
                text : '请输入产品价格'
            }, {
                name : 'product.productNum',
                text : '请输入产品数量'
            }, {
                name : 'product.productAddress',
                text : '请输入产品产地'
            }, {
                name : 'product.productLocation',
                text : '请输入产品属地'
            }, {
                name : 'uploadFile1',
                text : '请上传主图片',
                func : imageRequired
            } ];
            var pass = XONE.valid(validate, $form, "");
            return pass;
        });
    });

    function findSelectEl(name, container) {
        return jQuery('select[name="' + name + '"]', container);
    }
    function imageRequired() {
        var result = true;
        try {
            result = !($("input[name='product.ids']").size() < 1 && $("#uploadImageFile1").val().length < 1 && $("#uploadImageFile2").val().length < 1 && $("#uploadImageFile3").val().length < 1)
        } catch (e) {
            alert(e)
        }
        return result;
    }
    function removeProductDynamicImage1(id) {
        $('div.uploadimagesdiv1').html('');
        $('#uploadImageFile1').val('');
        if (id != null)
            $('input[name="product.ids"][value="' + id + '"]').remove();
        return false;
    }
    function removeProductDynamicImage2(id) {
        $('div.uploadimagesdiv2').html('');
        $('#uploadImageFile2').val('');
        if (id != null)
            $('input[name="product.ids"][value="' + id + '"]').remove();
        return false;
    }
    function removeProductDynamicImage3(id) {
        $('div.uploadimagesdiv3').html('');
        $('#uploadImageFile3').val('');
        if (id != null)
            $('input[name="product.ids"][value="' + id + '"]').remove();
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
