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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="16" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的其它服务 <span class="divider">/</span></li>
                    <li><a href="${pageContext.request.contextPath}/delivery/deliveryList.html">物流配送列表</a> <span class="divider">/</span></li>
                    <li class="active">编辑物流配送</li>
                </ul>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/delivery/deliveryUpdate.html">
                    <input type="hidden" name="delivery.id" value="${delivery.id }" />
                    <div class="control-group">
                        <label class="control-label" for="marketarea">市场区域</label>
                        <div class="controls">
                            <input type="text" id="marketarea" name="delivery.marketarea" value="${delivery.marketarea }" maxlength="255" placeholder="市场区域">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="determini">目的地点</label>
                        <div class="controls">
                            <input type="text" id="determini" name="delivery.determini" value="${delivery.determini }" maxlength="255" placeholder="目的地点">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="loadtime">上货时间</label>
                        <div class="controls">
                            <div class="input-append date" data-date-format="yyyy-mm-dd hh:ii">
                                <input type="text" id="loadtime" class="Wdate" value="${delivery.loadtime }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});" name="delivery.loadtime" maxlength="19" placeholder="上货时间" readonly="readonly">
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="loadaddress">上货地点</label>
                        <div class="controls">
                            <input type="text" id="loadaddress" name="delivery.loadaddress" value="${delivery.loadaddress }" maxlength="255" placeholder="上货地点">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="boxNum">箱数</label>
                        <div class="controls">
                            <input type="text" id="boxNum" onblur="calculateBoxTotal();" value="${delivery.boxNum }" name="delivery.boxNum" maxlength="20" placeholder="箱数" value="0">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="unitNum">单位重量(千克)</label>
                        <div class="controls">
                            <input type="text" id="unitNum" onblur="calculateBoxTotal();" value="${delivery.unitNum }" name="delivery.unitNum" maxlength="20" placeholder="单位重量" value="0">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="boxTotal">总箱重(千克)</label>
                        <div class="controls">
                            <input type="text" id="boxTotal" name="delivery.boxTotal" value="${delivery.boxTotal }" maxlength="20" placeholder="总箱重" value="0">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="totalWeight">总重(千克)</label>
                        <div class="controls">
                            <input type="text" id="totalWeight" name="delivery.totalWeight" value="${delivery.totalWeight }" maxlength="20" placeholder="总重" value="0">
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
                            <button type="submit" name="update" value="update" class="btn">提交更新</button>
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

            return true;
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
