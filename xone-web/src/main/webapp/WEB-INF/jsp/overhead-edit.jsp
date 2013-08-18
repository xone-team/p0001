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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="19" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的其它服务 <span class="divider">/</span></li>
                    <li><a href="${pageContext.request.contextPath}/overhead/overheadList.html">我的置顶列表</a> <span class="divider">/</span></li>
                    <li class="active">编辑置顶</li>
                </ul>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/overhead/overheadUpdate.html">
                    <input type="hidden" name="overhead.id" value="${overhead.id}">
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
                            <input type="text" id="refId" name="overhead.refId" value="${overhead.refId}" maxlength="20" placeholder="相关编号" readonly="readonly">
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
                            <input type="text" id="remark" name="overhead.remark" value="${overhead.remark}" maxlength="1023" placeholder="备注">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn" onclick="return confirm('确定更新本条记录?');">提交更新</button>
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

            return true;
        });
    });
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
