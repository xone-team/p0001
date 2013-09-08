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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="14" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的配套服务 <span class="divider">/</span></li>
                    <li class="active">创建物流配送</li>
                </ul>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/delivery/deliverySave.html">
                    <div class="control-group">
                        <label class="control-label" for="marketarea">市场区域</label>
                        <div class="controls">
                            <input type="text" id="marketarea" name="delivery.marketarea" value="${delivery.marketarea }" maxlength="255" placeholder="市场区域">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="determini">目的地点</label>
                        <div class="controls">
                            <input type="text" id="determini" name="delivery.determini" value="${delivery.determini }" maxlength="255" placeholder="目的地点">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="loadtime">上货时间</label>
                        <div class="controls">
                            <input type="text" id="loadtime" class="Wdate" value="${delivery.loadtime }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});" name="delivery.loadtime" maxlength="19" placeholder="上货时间" readonly="readonly">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="loadaddress">上货地点</label>
                        <div class="controls">
                            <input type="text" id="loadaddress" name="delivery.loadaddress" value="${delivery.loadaddress }" maxlength="255" placeholder="上货地点">
                            <code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="totalWeight">货量:</label>
                        <div class="controls">
                            <p>
                                箱数
                                <input class="span1" type="text" id="boxNum" value="${delivery.boxNum }" name="delivery.boxNum" maxlength="20" placeholder="箱数">
                                X
                                <input class="span1" type="text" id="unitNum" value="${delivery.unitNum }" name="delivery.unitNum" maxlength="20" placeholder="单位重量">
                                kg/箱 = 总共
                                <input class="span1" type="text" id="boxTotal" name="delivery.boxTotal" value="${delivery.boxTotal}" maxlength="20" placeholder="总箱重">
                                kg
                            </p>
                            或者&nbsp;总重
                            <input type="text" id="totalWeight" name="delivery.totalWeight" value="${delivery.totalWeight }" maxlength="20" placeholder="总重">
                            kg
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="remark">备注</label>
                        <div class="controls">
                            <input type="text" id="remark" name="delivery.remark" value="${delivery.remark }" maxlength="1023" placeholder="备注">
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
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>

    <jsp:include page="common-modal.jsp">
        <jsp:param name="myidentify" value="Product" />
        <jsp:param name="title" value="请选择产品" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/product/productListAjax.html" />
    </jsp:include>
</body>
<script src="${STATIC_ROOT}/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${STATIC_ROOT}/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
<script src="${STATIC_ROOT}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<script>
    jQuery(function() {
        $('.selectpicker').selectpicker({
            style : 'btn-info'
        });
        $('#windowTitleDialogProduct').delegate('a.productselectinfo', 'click', function(e) {
            e.preventDefault();
            var $this = $(this);
            $('#productId').val($this.attr('attr-id'));
            $this.closest('div.modal').modal('hide');
            return false;
        });
        $('#productId').click(function() {
            $('#windowTitleDialogProduct').modal('show');
        });

        $('#saveForm').submit(function() {
            var $form = $('#saveForm');
            var validate = [ {
                name : 'marketarea',
                text : '请输入市场区域'
            }, {
                name : 'determini',
                text : '请输入目的地'
            }, {
                name : 'loadtime',
                text : '请输入上货时间'
            }, {
                name : 'loadaddress',
                text : '请输入上货地点'
            }, {
                name : 'totalWeight',
                text : '请输入总重或箱重的任一种',
                func : weightValidation
            } ];

            var pass = XONE.valid(validate, $form, "delivery.");
            return pass;
        });
    });

    function weightValidation() {
        var result = (notBlank($('#totalWeight').val()) || (notBlank($('#boxNum').val()) && notBlank($('#unitNum').val()) && notBlank($('#boxTotal').val())))
        return result;
    }

    function notBlank(v) {
        return v != null && $.trim(v).length > 0;
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

    function calculateBoxTotal() {
        var boxNumInt, unitNumInt;
        try {
            boxNumInt = parseInt($("#boxNum").val());
            unitNumInt = parseFloat($('#unitNum').val()).toFixed(2);
        } catch (e) {
        }
        if (boxNumInt != null && !isNaN(boxNumInt) && unitNumInt != null && !isNaN(unitNumInt)) {
            $("#boxTotal").val((boxNumInt * unitNumInt).toFixed(2));
        }
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
