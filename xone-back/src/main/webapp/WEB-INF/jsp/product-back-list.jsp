<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>后台</title>
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
                        <li class="active">产品列表</li>
                    </ul>
                </div>
                <div class="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
                        </div>
                        <div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <form id="myqueryform" action="${pageContext.request.contextPath}/product/productList.html" method="get">
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productName">产品名称</label>
                                                <div class="controls">
                                                    <input type="text" id="productName" name="product.productName" value="${product.productName}" maxlength="255" placeholder="产品名称">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="checkStatus">审核状态</label>
                                                <div class="controls">
                                                    <select class="selectpicker" id="checkStatus" name="product.checkStatus">
                                                        <option value="">全部</option>
                                                        <c:forEach items="${types.other1CheckStatusList}" var="it">
                                                            <option value="${it.value}" <c:if test="${it.value == product.checkStatus}">selected</c:if>>${it.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productType">产品类型</label>
                                                <div class="controls">
                                                    <select class="selectpicker" id="productType" name="product.productType">
                                                        <option value="">全部</option>
                                                        <c:forEach items="${types.productTypeList}" var="it">
                                                            <option value="${it.value}" <c:if test="${it.value == product.productType}">selected</c:if>>${it.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="saleType">销售类型</label>
                                                <div class="controls">
                                                    <select class="selectpicker" id="saleType" name="product.saleType">
                                                        <option value="">全部</option>
                                                        <c:forEach items="${types.saleTypeList}" var="it">
                                                            <option value="${it.value}" <c:if test="${it.value == product.saleType}">selected</c:if>>${it.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productPrice">产品价格</label>
                                                <div class="controls">
                                                    <input type="text" id="productPrice" name="product.productPrice" value="${product.productPrice}" maxlength="200" placeholder="产品价格">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productNum">产品数量</label>
                                                <div class="controls">
                                                    <input type="text" id="productNum" name="product.productNum" value="${product.productNum}" maxlength="255" placeholder="产品数量">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productValidMin">有效期</label>
                                                <div class="controls">
                                                    <input type="text" id="productValidMin" class="span5 Wdate" onclick="WdatePicker()" name="product.productValidMin" value="${product.productValidMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="productValidMax" class="span5 Wdate" onclick="WdatePicker()" name="product.productValidMax" value="${product.productValidMax}" maxlength="19" placeholder="最大日期">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productAddress">产品产地</label>
                                                <div class="controls">
                                                    <input type="text" id="productAddress" name="product.productAddress" value="${product.productAddress}" maxlength="255" placeholder="产品产地">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productLocation">产品属地</label>
                                                <div class="controls">
                                                    <input type="text" id="productLocation" name="product.productLocation" value="${product.productLocation}" maxlength="255" placeholder="产品属地">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productDesc">产品描述</label>
                                                <div class="controls">
                                                    <input type="text" id="productDesc" name="product.productDesc" value="${product.productDesc}" maxlength="255" placeholder="产品描述">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="userApplyMin">申请人</label>
                                                <div class="controls">
                                                    <div id="userApplySelectResult" class="inline">
                                                        <div class="X-select-result inline">
                                                            <input type="hidden" class="X-select-hidden-value" value="${product.userApply}" name="product.userApply"> 
                                                            <input type="hidden" class="X-select-hidden-value-show" value="${product.person.username}" name="product.person.username"> 
                                                            <span class="label label-default">${product.person.username}</span>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn" onclick="showModalUserSelect($('#userApplySelectResult'), 'product.userApply', 'product.person.username');">
                                                        <i class="icon-filter"></i>选择
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateApplyMin">申请时间</label>
                                                <div class="controls">
                                                    <input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="product.dateApplyMin" value="${product.dateApplyMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="product.dateApplyMax" value="${product.dateApplyMax}" maxlength="19" placeholder="最大日期">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <p class="text-right">
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/product/productCreate.html"> <i class="icon-plus"> </i>创建
                        </a>
                        <button class="btn btn-small" onclick="$('#myqueryform').submit();">
                            <span class="icon-search"></span>查询
                        </button>
                    </p>
                </div>
                <div class="row-fluid">
                    <table class="table table-bordered" style="width: 100%">
                        <thead>
                            <tr>
                                <th>序号</th>
                                <th>产品名称</th>
                                <th>产品类型</th>
                                <th>销售类型</th>
                                <th>产品价格</th>
                                <th>产品数量</th>
                                <th>有效期</th>
                                <th>产品产地</th>
                                <th>产品属地</th>
                                <th>申请时间</th>
                                <th style="width: 8em;">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}" varStatus="status">
                                <tr>
                                    <td class="table-col-index">${status.index + 1}</td>
                                    <td><a href="${pageContext.request.contextPath}/product/productItem.html?product.id=${item.id}">${item.productName}</a></td>
                                    <td><c:forEach items="${types.productTypeList}" var="it">
                                            <c:if test="${it.value == item.productType}">${it.name}</c:if>
                                        </c:forEach></td>
                                    <td><c:forEach items="${types.saleTypeList}" var="it">
                                            <c:if test="${it.value == item.saleType}">${it.name}</c:if>
                                        </c:forEach></td>
                                    <td class="table-col-number">${item.productPrice}</td>
                                    <td class="table-col-number">${item.productNum}</td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.productValid}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${item.productAddress}</td>
                                    <td>${item.productLocation}</td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td><a href="${pageContext.request.contextPath}/product/productEdit.html?product.id=${item.id}" class="btn btn-mini"><i class="icon-edit"> </i>编辑</a>
                                        <button class="btn btn-mini" onclick="showModalDelete('product.id=${item.id}')">
                                            <i class="icon-trash"> </i>删除
                                        </button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <x:page href="${pageContext.request.contextPath}/product/productList.html" pagination="${pagination}" />
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>

    <!-- modal to select user -->
    <div id="X_model_userSelect" class="modal hide fade">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>选择角色</h3>
        </div>
        <div class="modal-body">
            <!-- query conditions -->
            <form id="modalUserQueryForm">
                <div class="row-fluid">
                    <div class="span5 form-horizontal">
                        <div class="control-group">
                            <label class="control-label" for="modalInputName">名称</label>
                            <div class="controls">
                                <input type="text" name="user.username" id="modalInputName" placeholder="名称">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- /query conditions -->
            <div class="row-fluid">
                <p class="text-right">
                    <button class="btn btn-small" onclick="queryModalUser();">
                        <i class="icon-search"></i>查询
                    </button>
                </p>
            </div>
            <!-- query result -->
            <div class="row-fluid">
                <table class="table table-hover table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th>用户名</th>
                            <th>拟称</th>
                            <th>选择</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyListModalUser">
                    </tbody>
                </table>
            </div>
            <!-- /query result -->
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal">取消</button>
            <button class="btn btn-primary" onclick="endModalUserSelect();">完成</button>
        </div>
    </div>
    <script type="text/javascript">
                    function showModalUserSelect(targetObj, targetName, targetShow) {
                        XONE.CURRENT_MODEL = {};
                        XONE.CURRENT_MODEL.target = targetObj;
                        XONE.CURRENT_MODEL.modal = jQuery("#X_model_userSelect");
                        XONE.CURRENT_MODEL.listBody = jQuery("#tbodyListModalUser");
                        XONE.CURRENT_MODEL.container = jQuery("#modalUserQueryForm");
                        XONE.CURRENT_MODEL.queryUrl = "${pageContext.request.contextPath}/person/personSelect.html";
                        XONE.CURRENT_MODEL.targetName = targetName;
                        XONE.CURRENT_MODEL.targetShow = targetShow;

                        XONE.CURRENT_MODEL.modal.modal("show");
                        queryModalUser();
                    }
                    function endModalUserSelect() {
                        var listBody = XONE.CURRENT_MODEL.listBody;
                        var container = XONE.CURRENT_MODEL.container;
                        var modalCurrent = XONE.CURRENT_MODEL.modal;
                        var targetObj = XONE.CURRENT_MODEL.target;
                        var targetName = XONE.CURRENT_MODEL.targetName;
                        var targetShow = XONE.CURRENT_MODEL.targetShow;

                        var selectedResult = jQuery("input[type=radio]:checked", listBody).siblings(".X-select-result");
                        if (selectedResult != null) {
                            modalCurrent.modal('hide');
                            var h = selectedResult.clone();
                            h.removeClass("hide").addClass("inline");
                            jQuery(".X-select-hidden-value", h).attr("name", targetName);
                            jQuery(".X-select-hidden-value-show", h).attr("name", targetShow);
                            targetObj.html(h);
                        }
                    }

                    function queryModalUser() {
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
    <!-- /modal to select role -->



    <!--  modal confirm to delete -->
    <div id="X_model_confirm2delete" class="modal hide fade">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>删除确认</h3>
        </div>
        <div class="modal-body">
            <p>确定要删除该记录吗？</p>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal">取消</button>
            <button class="btn btn-primary" onclick="endModalDelete()">确定</button>
        </div>
    </div>
    <script type="text/javascript">
                    function showModalDelete(targetParams) {
                        XONE.CURRENT_MODEL = {};
                        XONE.CURRENT_MODEL.target = targetParams;
                        XONE.CURRENT_MODEL.modal = jQuery("#X_model_confirm2delete");
                        XONE.CURRENT_MODEL.deleteUrl = "${pageContext.request.contextPath}/product/productDelete.html";
                        XONE.CURRENT_MODEL.modal.modal("show");
                    }
                    function endModalDelete() {
                        var modalCurrent = XONE.CURRENT_MODEL.modal;
                        var targetParams = XONE.CURRENT_MODEL.target;
                        var deleteUrl = XONE.CURRENT_MODEL.deleteUrl + "?" + targetParams;
                        modalCurrent.modal('hide');
                        location.href = deleteUrl;
                    }
                </script>
    <!--  /modal confirm to delete -->



</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_product").addClass("active");
    });
</script>
</html>
