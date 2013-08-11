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
                        <li class="active">创建物流配送</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/delivery/deliverySave.html">
                    <div class="control-group">
                        <label class="control-label" for="productId">产品编号</label>
                        <div class="controls">
                            <input type="text" id="productId" name="delivery.productId" maxlength="20" placeholder="产品编号" readonly="readonly">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="marketarea">市场区域</label>
                        <div class="controls">
                            <input type="text" id="marketarea" name="delivery.marketarea" maxlength="255" placeholder="市场区域">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="determini">目的地点</label>
                        <div class="controls">
                            <input type="text" id="determini" name="delivery.determini" maxlength="255" placeholder="目的地点">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="loadtime">上货时间</label>
                        <div class="controls">
                            <div class="input-append date" data-date-format="yyyy-mm-dd hh:ii">
                                <input type="text" id="loadtime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});" name="delivery.loadtime" maxlength="19" placeholder="上货时间" readonly="readonly">
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="loadaddress">上货地点</label>
                        <div class="controls">
                            <input type="text" id="loadaddress" name="delivery.loadaddress" maxlength="255" placeholder="上货地点">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="boxNum">箱数</label>
                        <div class="controls">
                            <input type="text" id="boxNum" onblur="calculateBoxTotal();" name="delivery.boxNum" maxlength="20" placeholder="箱数" value="0">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="unitNum">单位重量</label>
                        <div class="controls">
                            <input type="text" id="unitNum" onblur="calculateBoxTotal();" name="delivery.unitNum" maxlength="20" placeholder="单位重量" value="0">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="boxTotal">总箱重</label>
                        <div class="controls">
                            <input type="text" id="boxTotal" name="delivery.boxTotal" maxlength="20" placeholder="总箱重" value="0">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="totalWeight">总重</label>
                        <div class="controls">
                            <input type="text" id="totalWeight" name="delivery.totalWeight" maxlength="20" placeholder="总重" value="0">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="flagPass">通过标识</label>
                        <div class="controls">
                            <select class="selectpicker" id="flagPass" name="delivery.flagPass">
                                <c:forEach items="${flagPass}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == delivery.flagPass}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="remark">备注</label>
                        <div class="controls">
                            <input type="text" id="remark" name="delivery.remark" maxlength="1023" placeholder="备注">
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
        <jsp:param name="myidentify" value="Product" />
        <jsp:param name="title" value="请选择产品" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/product/productListAjax.html" />
    </jsp:include>
</body>
<script src="${STATIC_ROOT}/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${STATIC_ROOT}/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
<script src="${STATIC_ROOT}/js/common.js"></script>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_delivery").addClass("active");

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
                name : 'productId',
                text : '选择产品'
            }, {
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
                name : 'boxNum',
                text : '请输入箱数'
            }, {
                name : 'boxNum',
                text : '箱数必须为数字',
                func : numberValidation
            }, {
                name : 'unitNum',
                text : '请输入箱重'
            }, {
                name : 'unitNum',
                text : '箱重必须为数字',
                func : numberValidation
            }, {
                name : 'boxTotal',
                text : '请输入总箱重'
            }, {
                name : 'boxTotal',
                text : '总箱重必须为数字',
                func : numberValidation
            }, {
                name : 'totalWeight',
                text : '请输入总重'
            }, {
                name : 'totalWeight',
                text : '总重必须为数字',
                func : numberValidation
            } ];

            var pass = XONE.valid(validate, $form, "delivery.");
            return pass;
        });
    });
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
</html>
