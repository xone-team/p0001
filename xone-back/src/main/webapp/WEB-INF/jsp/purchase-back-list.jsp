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
                        <li class="active">求购列表</li>
                    </ul>
                </div>
                <div class="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
                        </div>
                        <div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <form id="myqueryform" action="${pageContext.request.contextPath}/purchase/purchaseList.html" method="get">
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="purchaseName">产品名称</label>
                                                <div class="controls">
                                                    <input type="text" id="purchaseName" name="purchase.purchaseName" value="${purchase.purchaseName}" maxlength="255" placeholder="产品名称">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="purchaseType">求购类型</label>
                                                <div class="controls">
                                                    <select class="selectpicker" id="purchaseType" name="purchase.purchaseType">
                                                        <option value="">全部</option>
                                                        <c:forEach items="${commonTypes.productTypeList}" var="it">
                                                            <option value="${it.value}" <c:if test="${it.value == purchase.purchaseType}">selected</c:if>>${it.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="purchaseNum">求购数量</label>
                                                <div class="controls">
                                                    <input type="text" id="purchaseNum" name="purchase.purchaseNum" value="${purchase.purchaseNum}" maxlength="255" placeholder="求购数量">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="purchaseValidMin">有效期</label>
                                                <div class="controls">
                                                    <input type="text" id="purchaseValidMin" class="span5 Wdate" onclick="WdatePicker()" name="purchase.purchaseValidMin" value="${purchase.purchaseValidMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="purchaseValidMax" class="span5 Wdate" onclick="WdatePicker()" name="purchase.purchaseValidMax" value="${purchase.purchaseValidMax}" maxlength="19" placeholder="最大日期">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="purchaseAddress">产品产地</label>
                                                <div class="controls">
                                                    <input type="text" id="purchaseAddress" name="purchase.purchaseAddress" value="${purchase.purchaseAddress}" maxlength="255" placeholder="产品产地">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="purchaseLocation">产品属地</label>
                                                <div class="controls">
                                                    <input type="text" id="purchaseLocation" name="purchase.purchaseLocation" value="${purchase.purchaseLocation}" maxlength="255" placeholder="产品属地">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="purchaseDesc">求购描述</label>
                                                <div class="controls">
                                                    <input type="text" id="purchaseDesc" name="purchase.purchaseDesc" value="${purchase.purchaseDesc}" maxlength="255" placeholder="求购描述">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="userApply">申请人</label>
                                                <div class="controls">
                                                    <div id="userApplySelectResult" class="inline">
                                                        <div class="X-select-result inline">
                                                            <input type="hidden" class="X-select-hidden-value" value="${purchase.userApply}" name="purchase.userApply"> 
                                                            <input type="hidden" class="X-select-hidden-value-show" value="${purchase.person.username}" name="purchase.person.username"> 
                                                            <span class="label label-default">${purchase.person.username}</span>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn" onclick="showModalUserSelect($('#userApplySelectResult'), 'purchase.userApply', 'purchase.person.username');">
                                                        <i class="icon-filter"></i>选择
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateApplyMin">申请时间</label>
                                                <div class="controls">
                                                    <input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="purchase.dateApplyMin" value="${purchase.dateApplyMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="purchase.dateApplyMax" value="${purchase.dateApplyMax}" maxlength="19" placeholder="最大日期">
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
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/purchase/purchaseCreate.html"> <i class="icon-plus"> </i>创建
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
                                <th>求购类型</th>
                                <th>求购数量</th>
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
                                    <td><a href="${pageContext.request.contextPath}/purchase/purchaseItem.html?purchase.id=${item.id}">${item.purchaseName} </a></td>
                                    <td><c:forEach items="${commonTypes.productTypeList}" var="it">
                                            <c:if test="${it.value == item.purchaseType}">${it.name}</c:if>
                                        </c:forEach></td>
                                    <td class="table-col-number">${item.purchaseNum}</td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.purchaseValid}" pattern="yyyy-MM-dd" /></td>
                                    <td>${item.purchaseAddress}</td>
                                    <td>${item.purchaseLocation}</td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd" /></td>
                                    <td><a href="${pageContext.request.contextPath}/purchase/purchaseEdit.html?purchase.id=${item.id}" class="btn btn-mini"><i class="icon-edit"> </i>编辑</a>
                                        <button class="btn btn-mini" onclick="showModalDelete('purchase.id=${item.id}')">
                                            <i class="icon-trash"> </i>删除
                                        </button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <x:page href="${pageContext.request.contextPath}/purchase/purchaseList.html" pagination="${pagination}" />
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
                        XONE.CURRENT_MODEL.deleteUrl = "${pageContext.request.contextPath}/purchase/purchaseDelete.html";
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
        jQuery("#X_menu_li_purchase").addClass("active");
    });
</script>
</html>
