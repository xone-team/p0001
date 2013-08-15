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
                        <li class="active">创建置顶</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/overhead/overheadSave.html">
                    <div class="control-group">
                        <label class="control-label" for="overheadType">置顶类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="overheadType" name="overhead.overheadType">
                                <c:forEach items="${overheadType}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == overhead.overheadType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="refId">相关编号</label>
                        <div class="controls">
                            <input type="text" id="refId" name="overhead.refId" maxlength="20" placeholder="相关编号" readonly="readonly">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="checkStatus">审核状态</label>
                        <div class="controls">
                            <select class="selectpicker" id="checkStatus" name="overhead.checkStatus">
                                <c:forEach items="${checkStatus}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == overhead.checkStatus}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="remark">备注</label>
                        <div class="controls">
                            <input type="text" id="remark" name="overhead.remark" maxlength="1023" placeholder="备注">
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
        <jsp:param name="title" value="请选择广告对应的售卖产品" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/product/productListAjax.html" />
    </jsp:include>
    <jsp:include page="common-modal.jsp">
        <jsp:param name="myidentify" value="Purchase" />
        <jsp:param name="title" value="请选择广告对应的购买产品" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/purchase/purchaseListAjax.html" />
    </jsp:include>
</body>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
<script src="${STATIC_ROOT}/js/fileupload.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#windowTitleDialogProduct').delegate('a.productselectinfo', 'click', function(e) {
            e.preventDefault();
            var $this = $(this);
            $('#refId').val($this.attr('attr-id'));
            $this.closest('div.modal').modal('hide');
            return false;
        });
        $('#windowTitleDialogPurchase').delegate('a.purchaseselectinfo', 'click', function(e) {
            e.preventDefault();
            var $this = $(this);
            $('#refId').val($this.attr('attr-id'));
            $this.closest('div.modal').modal('hide');
            return false;
        });
    });
</script>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_overhead").addClass("active");
        $('#refId').click(function() {
            if ($('#overheadType').val() == '0') {
                $('#windowTitleDialogProduct').modal('show');
            } else {
                $('#windowTitleDialogPurchase').modal('show');
            }
        });
        $('#overheadType').bind('change', function() {
            $('#refId').val('');
            $('#refName').val('');
        })
        $('#saveForm').submit(function() {
            var $form = $('#saveForm');
            var validate = [ {
                name : 'refId',
                text : '请选择相关产品或求购'
            } ];

            var pass = XONE.valid(validate, $form, "overhead.");
            return pass;
        });
    });
</script>
</html>
