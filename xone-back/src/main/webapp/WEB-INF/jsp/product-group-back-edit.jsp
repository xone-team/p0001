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
                        <li><a href="${pageContext.request.contextPath}/productGroup/productGroupList.html">团购列表</a> <span class="divider">/</span></li>
                        <li class="active">团购编辑</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/productGroup/productGroupUpdate.html">
                    <input type="hidden" name="productGroup.id" value="${productGroup.id}">
                    <div class="control-group">
                        <label class="control-label" for="productId">产品编号</label>
                        <div class="controls">
                            <input type="text" id="productId" name="productGroup.productId" value="${productGroup.productId }" maxlength="20" placeholder="产品编号" readonly="readonly"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="groupNum">团购数量</label>
                        <div class="controls">
                            <input type="text" id="groupNum" name="productGroup.groupNum" value="${productGroup.groupNum }" maxlength="20" placeholder="团购数量"><code>*</code>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="checkStatus">审核状态</label>
                        <div class="controls">
                            <select class="selectpicker" id="checkStatus" name="productGroup.checkStatus">
                                <c:forEach items="${checkStatus}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == productGroup.checkStatus}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="remark">备注</label>
                        <div class="controls">
                            <input type="text" id="remark" name="productGroup.remark" value="${productGroup.remark}" maxlength="1023" placeholder="备注">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn" onclick="return confirm('确定更新本条记录?');">提交更新</button>
                            <button type="submit" name="delete" value="delete" class="btn" onclick="return confirm('确定删除本条记录?');">删除记录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>

    <jsp:include page="common-modal.jsp">
        <jsp:param name="myidentify" value="Product" />
        <jsp:param name="title" value="请选择团购的售卖产品" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/product/productListAjax.html?product.saleType=2" />
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
            $('#productId').val($this.attr('attr-id'));
            $this.closest('div.modal').modal('hide');
            return false;
        });
    });
</script>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_productGroup").addClass("active");
        $('#productId').click(function() {
            $('#windowTitleDialogProduct').modal('show');
        });
        $('#saveForm').submit(function() {
            var $form = $(this);
            var validate = [ {
                name : 'productId',
                text : '请选择相关产品'
            }, {
                name : 'groupNum',
                text : '填写团购数量'
            }, {
                name : 'groupNum',
                text : '团购数量必须为数字，且大于0',
                func : numberValidation
            } ];

            var pass = XONE.valid(validate, $form, "productGroup.");
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

            if (n == null || isNaN(n) || n < 1) {
                result = false;
            }
        }
        return result;
    }
</script>
<c:if test="${!empty fieldErrors }">
    <script>
                    <c:forEach items="${fieldErrors }" var="fieldError">
                    XONE.renderFieldMessage('${fieldError.value }', "error", $('input[name="${fieldError.key}"]'));
                    </c:forEach>
                </script>
</c:if>
</html>
