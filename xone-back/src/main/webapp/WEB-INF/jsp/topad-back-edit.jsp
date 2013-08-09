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
                        <li><a href="${pageContext.request.contextPath}/topad/topadList.html">置顶列表</a> <span class="divider">/</span></li>
                        <li class="active">置顶编辑</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/topad/topadUpdate.html">
                    <input type="hidden" name="topad.id" value="${topad.id}">
                    <div class="control-group">
                        <label class="control-label" for="productId">产品</label>
                        <div class="controls">
                            <div id="productIdsSelectResult" class="inline">
                                <div class="X-select-result inline">
                                    <input type="hidden" class="X-select-hidden-value" value="${topad.productId}" name="topad.productId">
                                    <a href="${pageContext.request.contextPath}/product/productItem.html?product.id=${topad.productId}"><span class="label label-default">${product.productName}</span></a>
                                </div>
                            </div>
                            <button type="button" class="btn" onclick="showModalProductSelect($('#productIdsSelectResult'), 'topad.productId');">
                                <i class="icon-filter"></i>选择
                            </button>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="checkStatus">审核状态</label>
                        <div class="controls">
                            <select class="selectpicker" id="checkStatus" name="topad.checkStatus">
                                <c:forEach items="${types.topadCheckStatusList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == topad.checkStatus}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="remark">备注</label>
                        <div class="controls">
                            <input type="text" id="remark" name="topad.remark" value="${topad.remark}" maxlength="1023" placeholder="备注">
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


    <!-- modal to select product -->
    <div id="X_model_productSelect" class="modal hide fade">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>选择角色</h3>
        </div>
        <div class="modal-body">
            <!-- query conditions -->
            <form id="modalProductQueryForm">
                <div class="row-fluid">
                    <div class="span5 form-horizontal">
                        <div class="control-group">
                            <label class="control-label" for="modalInputProductName">名称</label>
                            <div class="controls">
                                <input type="text" name="product.productName" id="modalInputProductName" placeholder="名称">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- /query conditions -->
            <div class="row-fluid">
                <p class="text-right">
                    <button class="btn btn-small" onclick="queryModalProduct();">
                        <i class="icon-search"></i>查询
                    </button>
                </p>
            </div>
            <!-- query result -->
            <div class="row-fluid">
                <table class="table table-hover table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th>名称</th>
                            <th>描述</th>
                            <th>选择</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyListModalProduct">
                    </tbody>
                </table>
            </div>
            <!-- /query result -->
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal">取消</button>
            <button class="btn btn-primary" onclick="endModalProductSelect();">完成</button>
        </div>
    </div>
    <script type="text/javascript">
                    function showModalProductSelect(targetObj, targetName) {
                        XONE.CURRENT_MODEL = {};
                        XONE.CURRENT_MODEL.target = targetObj;
                        XONE.CURRENT_MODEL.modal = jQuery("#X_model_productSelect");
                        XONE.CURRENT_MODEL.listBody = jQuery("#tbodyListModalProduct");
                        XONE.CURRENT_MODEL.container = jQuery("#modalProductQueryForm");
                        XONE.CURRENT_MODEL.queryUrl = "${pageContext.request.contextPath}/product/productSelect.html";
                        XONE.CURRENT_MODEL.targetName = targetName;

                        XONE.CURRENT_MODEL.modal.modal("show");
                        queryModalProduct();
                    }
                    function endModalProductSelect() {
                        var listBody = XONE.CURRENT_MODEL.listBody;
                        var container = XONE.CURRENT_MODEL.container;
                        var modalCurrent = XONE.CURRENT_MODEL.modal;
                        var targetObj = XONE.CURRENT_MODEL.target;
                        var targetName = XONE.CURRENT_MODEL.targetName;

                        var selectedResult = jQuery("input[type=radio]:checked", listBody).siblings(".X-select-result");
                        if (selectedResult != null) {
                            modalCurrent.modal('hide');
                            var h = selectedResult.clone();
                            h.removeClass("hide").addClass("inline");
                            jQuery(".X-select-hidden-value", h).attr("name", targetName);
                            targetObj.html(h);
                        }
                    }

                    function queryModalProduct() {
                        var listBody = XONE.CURRENT_MODEL.listBody;
                        var container = XONE.CURRENT_MODEL.container;
                        var queryUrl = XONE.CURRENT_MODEL.queryUrl;

                        var d = container.serializeObject();
                        jQuery.ajax({
                            url : queryUrl,
                            type : "POST",
                            dataType : "html",
                            data : d,
                            success : function(html, textStatus, jqXHR) {
                                listBody.html(html);
                            }
                        });
                    }
                </script>
    <!-- /modal to select product -->




</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_topad").addClass("active");
        $('#saveForm').submit(function() {
            var $form = $('#saveForm');
            var validate = [ {
                name : 'productId',
                text : '请选择产品'
            } ];

            var pass = XONE.valid(validate, $form, "topad.");
            return pass;
        });
    });
</script>
</html>
