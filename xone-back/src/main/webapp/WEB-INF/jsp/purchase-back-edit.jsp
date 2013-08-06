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
                        <li><a href="${pageContext.request.contextPath}/purchase/purchaseList.html">求购列表</a> <span class="divider">/</span></li>
                        <li class="active">求购编辑</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/purchase/purchaseUpdate.html">
                    <input type="hidden" name="purchase.id" value="${purchase.id}">
                    <div class="control-group">
                        <label class="control-label" for="purchaseName">产品名称</label>
                        <div class="controls">
                            <input type="text" id="purchaseName" name="purchase.purchaseName" value="${purchase.purchaseName}" maxlength="255" placeholder="产品名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseType">求购类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="purchaseType" name="purchase.purchaseType">
                                <c:forEach items="${commonTypes.productTypeList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == purchase.purchaseType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseNum">求购数量</label>
                        <div class="controls">
                            <input type="text" id="purchaseNum" name="purchase.purchaseNum" value="${purchase.purchaseNum}" maxlength="255" placeholder="求购数量">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseValid">有效期</label>
                        <div class="controls">
                            <input type="text" id="purchaseValid" name="purchase.purchaseValid" value="<fmt:formatDate value="${purchase.purchaseValid}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="有效期">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseAddress">产品产地</label>
                        <div class="controls">
                            <input type="text" id="purchaseAddress" name="purchase.purchaseAddress" value="${purchase.purchaseAddress}" maxlength="255" placeholder="产品产地">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseLocation">产品属地</label>
                        <div class="controls">
                            <input type="text" id="purchaseLocation" name="purchase.purchaseLocation" value="${purchase.purchaseLocation}" maxlength="255" placeholder="产品属地">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseDesc">求购描述</label>
                        <div class="controls">
                            <input type="text" id="purchaseDesc" name="purchase.purchaseDesc" value="${purchase.purchaseDesc}" maxlength="255" placeholder="求购描述">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="purchaseCheckStatus">审核结果</label>
                        <div class="controls">
                            <select class="selectpicker" id="purchaseCheckStatus" name="purchase.check.checkStatus">
                                <c:forEach items="${commonTypes.other1CheckStatusList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == purchase.check.checkStatus}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="purchaseRemark">审核意见</label>
                        <div class="controls">
                            <input type="text" id="purchaseRemark" name="purchase.check.remark" value="${purchase.check.remark}" maxlength="255" placeholder="审核意见">
                        </div>
                    </div>

                    <div class="well">
                        审核历史
                        <c:forEach items="${ purchase.checkList }" var="item" varStatus="status">
                            <div class="control-group">
                                <label class="control-label">审核结果</label>
                                <div class="controls">
                                    <c:forEach items="${commonTypes.other1CheckStatusList}" var="it">
                                        <c:if test="${it.value == item.checkStatus}">${ it.name }</c:if>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">审核意见</label>
                                <div class="controls">${ item.remark }</div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn">提交更新
                            </button>
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
        jQuery("#X_menu_li_purchase").addClass("active");
    });

    function doSaveForm() {
        var $form = $('#saveForm');
        var validate = [ {
            name : 'purchase.purchaseName',
            text : '请输入求购产品名'
        }, {
            name : 'purchase.purchasePrice',
            text : '请输入求购产品价格'
        }, {
            name : 'purchase.purchasePrice',
            text : '求购产品价格必须为数字，且大于0',
            func : numberValidation
        }, {
            name : 'purchase.purchaseNum',
            text : '请输入求购产品数量'
        }, {
            name : 'purchase.purchaseNum',
            text : '求购产品数量必须为数字，且大于0',
            func : numberValidation
        } ];

        var pass = XONE.valid(validate, $form, "");

        if (pass)
            $form.submit();
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
