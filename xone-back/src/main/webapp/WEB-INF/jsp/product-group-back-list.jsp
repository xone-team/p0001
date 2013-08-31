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
                        <li class="active">团购列表</li>
                    </ul>
                </div>
                <div class="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
                        </div>
                        <div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <form id="myqueryform" action="${pageContext.request.contextPath}/productGroup/productGroupList.html" method="get">
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
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
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="remark">备注</label>
                                                <div class="controls">
                                                    <input type="text" id="remark" name="productGroup.remark" value="${productGroup.remark}" maxlength="1023" placeholder="备注">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateApplyMin">申请日期</label>
                                                <div class="controls">
                                                    <input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="productGroup.dateApplyMin" value="${productGroup.dateApplyMin}" maxlength="19" placeholder="最小日期">
                                                    <span class="add-on">~</span>
                                                    <input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="productGroup.dateApplyMax" value="${productGroup.dateApplyMax}" maxlength="19" placeholder="最大日期">
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
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/productGroup/productGroupCreate.html">
                            <i class="icon-plus"> </i>创建
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
                                <th>编号</th>
                                <th>产品编号</th>
                                <th>团购数量</th>
                                <th>审核状态</th>
                                <th>备注</th>
                                <th>申请日期</th>
                                <th>审核日期</th>
                                <th style="width: 8em;">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}" varStatus="status">
                                <tr>
                                    <td class="table-col-index">${item.id}</td>
                                    <td><a href="${pageContext.request.contextPath}/productGroup/productGroupItem.html?productGroup.id=${item.productId}"> ${item.productId} </a></td>
                                    <td>${item.groupNum}</td>
                                    <td>${item.checkStatusName}</td>
                                    <td>${item.remark}</td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td><a href="${pageContext.request.contextPath}/productGroup/productGroupEdit.html?productGroup.id=${item.id}" class="btn btn-mini">
                                            <i class="icon-edit"> </i>编辑
                                        </a> <a href="${pageContext.request.contextPath}/productGroup/productGroupItem.html?productGroup.id=${item.id}" class="btn btn-mini">
                                            <i class="icon-list-alt"></i>详细
                                        </a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <x:page href="${pageContext.request.contextPath}/productGroup/productGroupList.html" pagination="${pagination}" />
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_productGroup").addClass("active");
    });
</script>
</html>
