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
                        <li><a href="${pageContext.request.contextPath}/product/productList.html">产品列表</a> <span class="divider">/</span></li>
                        <li class="active">产品编辑</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" enctype="multipart/form-data" id="productEditForm${myidentify}" method="post" action="${pageContext.request.contextPath}/product/productUpdate.html">
                    <input type="hidden" name="product.id" value="${product.id}">
                    <div class="control-group">
                        <label class="control-label" for="productName">产品名称</label>
                        <div class="controls">
                            <input type="text" id="productName" name="product.productName" value="${product.productName}" maxlength="255" placeholder="产品名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productType">产品类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="productType" name="product.productType">
                                <c:forEach items="${types.productTypeList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == product.productType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="saleType">销售类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="saleType" name="product.saleType">
                                <c:forEach items="${types.saleTypeList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == product.saleType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productPrice">产品价格</label>
                        <div class="controls">
                            <input type="text" id="productPrice" name="product.productPrice" value="${product.productPrice}" maxlength="200" placeholder="产品价格">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productNum">产品数量</label>
                        <div class="controls">
                            <input type="text" id="productNum" name="product.productNum" value="${product.productNum}" maxlength="255" placeholder="产品数量">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productValid">有效期</label>
                        <div class="controls">
                            <input type="text" id="productValid" name="product.productValid" value="<fmt:formatDate value="${product.productValid}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="有效期">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productAddress">产品产地</label>
                        <div class="controls">
                            <input type="text" id="productAddress" name="product.productAddress" value="${product.productAddress}" maxlength="255" placeholder="产品产地">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productLocation">产品属地</label>
                        <div class="controls">
                            <input type="text" id="productLocation" name="product.productLocation" value="${product.productLocation}" maxlength="255" placeholder="产品属地">
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
                        <div class="controls">
                            <div class="span4">
                                <div class="control-group uploadimagesdiv1" style="margin-bottom: 0px;">
                                    <c:forEach items="${product.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 0 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removeProductDynamicImage1();" value="删除图片">&times;</button>
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
                                                <button class="close pull-right" onclick="removeProductDynamicImage2();" value="删除图片">&times;</button>
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
                                                <button class="close pull-right" onclick="removeProductDynamicImage3();" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadproductdynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile3').click();">上传图片</button>
                            </div>
                        </div>
                    </div>
                    <div class="control-group fileupload" style="display: none;">
                        <input type="file" id="uploadImageFile1" name="uploadFile1" value=""> <input type="file" id="uploadImageFile2" name="uploadFile2" value=""> <input type="file" id="uploadImageFile3" name="uploadFile3" value="">
                        <c:forEach items="${product.ids}" var="it">
                            <input type="hidden" name="product.ids" value="${it}">
                        </c:forEach>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="prodCheckStatus">审核结果</label>
                        <div class="controls">
                            <select class="selectpicker" id="prodCheckStatus" name="product.check.checkStatus">
                                <c:forEach items="${types.other1CheckStatusList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == product.check.checkStatus}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="prodCheckRemark">审核意见</label>
                        <div class="controls">
                            <input type="text" id="prodCheckRemark" name="product.check.remark" value="${product.check.remark}" maxlength="255" placeholder="审核意见">
                        </div>
                    </div>
                    <div class="well">
                        审核历史
                        <c:forEach items="${ product.checkList }" var="item" varStatus="status">
                            <div class="control-group">
                                <label class="control-label" for="prodCheckStatus">审核结果</label>
                                <div class="controls">
                                    <c:forEach items="${types.other1CheckStatusList}" var="it">
                                        <c:if test="${it.value == item.checkStatus}">${ it.name }</c:if>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="prodCheckRemark">审核意见</label>
                                <div class="controls">${ item.remark }</div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn">提交更新</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
    <script src="${STATIC_ROOT}/js/fileupload.js"></script>
</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_product").addClass("active");
        $('#uploadImageFile1[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeProductDynamicImage1();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadproductdynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv1').html('').append(div);
            }
        });
        $('#uploadImageFile2[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeProductDynamicImage2();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadproductdynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv2').html('').append(div);
            }
        });
        $('#uploadImageFile3[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeProductDynamicImage3();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadproductdynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv3').html('').append(div);
            }
        });
    });
    function removeProductDynamicImage1() {
        $('div.uploadimagesdiv').html('');
        $('#uploadImageFile').val('');
        return false;
    }
    function removeProductDynamicImage2() {
        $('div.uploadimagesdiv2').html('');
        $('#uploadImageFile2').val('');
        return false;
    }
    function removeProductDynamicImage3() {
        $('div.uploadimagesdiv3').html('');
        $('#uploadImageFile3').val('');
        return false;
    }
    
    function doSaveForm() {
        var $form = $('#saveForm');
        $form.submit();
        return;
        
        var validate = [ {
            name : 'product.productName',
            text : '请输入产品名'
        }, {
            name : 'product.productPrice',
            text : '请输入产品价格'
        }, {
            name : 'product.productPrice',
            text : '产品价格必须为数字，且大于0',
			func : numberValidation       
        }, {
            name : 'product.productNum',
            text : '请输入产品数量'
        }, {
            name : 'product.productNum',
            text : '产品数量必须为数字，且大于0',
			func : numberValidation       
        } ];

        var pass = XONE.valid(validate, $form, "");

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
