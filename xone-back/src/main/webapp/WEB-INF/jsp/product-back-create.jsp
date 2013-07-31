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
                        <li class="active">创建产品</li>
                    </ul>
                </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/product/productSave.html">
                    <div class="control-group">
                        <label class="control-label" for="productName">产品名称</label>
                        <div class="controls">
                            <input type="text" id="productName" name="product.productName" maxlength="255" placeholder="产品名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productType">产品类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="productType" name="product.productType">
                                <c:forEach items="${commonTypes.productTypeList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == product.productType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="saleType">销售类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="saleType" name="product.saleType">
                                <c:forEach items="${commonTypes.saleTypeList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == product.saleType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productPrice">产品价格</label>
                        <div class="controls">
                            <input type="text" id="productPrice" name="product.productPrice" maxlength="200" placeholder="产品价格">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productNum">产品数量</label>
                        <div class="controls">
                            <input type="text" id="productNum" name="product.productNum" maxlength="255" placeholder="产品数量">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productValid">有效期</label>
                        <div class="controls">
                            <input type="text" id="productValid" name="product.productValid" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="有效期">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productAddress">产品产地</label>
                        <div class="controls">
                            <input type="text" id="productAddress" name="product.productAddress" maxlength="255" placeholder="产品产地">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productLocation">产品属地</label>
                        <div class="controls">
                            <input type="text" id="productLocation" name="product.productLocation" maxlength="255" placeholder="产品属地">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productDesc">产品描述</label>
                        <div class="controls">
                            <input type="text" id="productDesc" name="product.productDesc" maxlength="255" placeholder="产品描述">
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
</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_product").addClass("active");
    });
</script>
</html>
