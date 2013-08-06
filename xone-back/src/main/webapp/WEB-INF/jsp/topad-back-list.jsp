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
                        <li class="active">置顶列表</li>
                    </ul>
                </div>
                <div class="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
                        </div>
                        <div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <form id="myqueryform" action="${pageContext.request.contextPath}/topad/topadList.html" method="get">
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productName">产品名称</label>
                                                <div class="controls">
                                                    <input type="text" id="productName" name="topad.productName" value="${topad.productName}" maxlength="255" placeholder="产品名称">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="checkStatus">审核状态</label>
                                                <div class="controls">
                                                    <select class="selectpicker" id="checkStatus" name="topad.checkStatus">
                                                        <option value="">全部</option>
                                                        <c:forEach items="${commonTypes.topadCheckStatusList}" var="it">
                                                            <option value="${it.value}" <c:if test="${it.value == topad.checkStatus}">selected</c:if>>${it.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="remark">备注</label>
                                                <div class="controls">
                                                    <input type="text" id="remark" name="topad.remark" value="${topad.remark}" maxlength="1023" placeholder="备注">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="applyUsername">申请人用户名</label>
                                                <div class="controls">
                                                    <input type="text" id="username" name="topad.applyUsername" value="${topad.applyUsername}" maxlength="255" placeholder="申请人用户名">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateApplyMin">申请日期</label>
                                                <div class="controls">
                                                    <input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="topad.dateApplyMin" value="${topad.dateApplyMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="topad.dateApplyMax" value="${topad.dateApplyMax}" maxlength="19" placeholder="最大日期">
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
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/topad/topadCreate.html"> <i class="icon-plus"> </i>创建
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
                                <th>产品</th>
                                <th>审核状态</th>
                                <th>备注</th>
                                <th>申请人</th>
                                <th>申请日期</th>
                                <th>审核日期</th>
                                <th style="width: 8em;">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}" varStatus="status">
                                <tr>
                                    <td class="table-col-index">${status.index + 1}</td>
                                    <td><a href="${pageContext.request.contextPath}/product/productItem.html?product.id=${item.productId}">${item.productName}</a></td>
                                    <td><a href="${pageContext.request.contextPath}/topad/topadItem.html?topad.id=${item.id}"> <c:forEach items="${commonTypes.topadCheckStatusList}" var="it">
                                                <c:if test="${it.value == item.checkStatus}">${it.name}</c:if>
                                            </c:forEach>
                                    </a></td>
                                    <td>${item.remark}</td>
                                    <td><a href="${pageContext.request.contextPath}/person/personItem.html?person.id=${item.userApply}">${item.applyUsername}</a></td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td><a href="${pageContext.request.contextPath}/topad/topadEdit.html?topad.id=${item.id}" class="btn btn-mini"><i class="icon-edit"> </i>编辑</a>
                                        <button class="btn btn-mini" onclick="showModalDelete('person.id=${item.id}')">
                                            <i class="icon-trash"> </i>删除
                                        </button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <x:page href="${pageContext.request.contextPath}/topad/topadList.html" pagination="${pagination}" />
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>




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
                        XONE.CURRENT_MODEL.deleteUrl = "${pageContext.request.contextPath}/topad/topadDelete.html";
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
        jQuery("#X_menu_li_topad").addClass("active");
    });
</script>
</html>
