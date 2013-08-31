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
                                                        <c:forEach items="${checkStatus}" var="it">
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
                                                        <c:forEach items="${productType}" var="it">
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
                                                        <c:forEach items="${saleType}" var="it">
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
                                                    <input type="text" id="userId" onclick="$('#windowTitleDialoguserinfo').modal('show');" name="product.person.id" maxlength="20" value="${product.person.id}" placeholder="用户编号">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateApplyMin">申请时间</label>
                                                <div class="controls">
                                                    <input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="product.dateApplyMin" value="${product.dateApplyMin}" maxlength="19" placeholder="最小日期">
                                                    <span class="add-on">~</span>
                                                    <input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="product.dateApplyMax" value="${product.dateApplyMax}" maxlength="19" placeholder="最大日期">
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
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/product/productCreate.html">
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
                                <th>产品名称</th>
                                <th>产品类型</th>
                                <th>销售类型</th>
                                <th>产品价格</th>
                                <th>产品数量</th>
                                <th>产品产地</th>
                                <th>产品属地</th>
                                <th>申请时间</th>
                                <th>审核状态</th>
                                <th style="width: 8em;">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}" varStatus="status">
                                <tr>
                                    <td class="table-col-index">${item.id}</td>
                                    <td>${item.productName}</td>
                                    <td>${item.productTypeName}</td>
                                    <td>${item.saleTypeName }</td>
                                    <td class="table-col-number">${item.productPrice}</td>
                                    <td class="table-col-number">${item.productNum}</td>
                                    <td>${item.productAddress}</td>
                                    <td>${item.productLocation}</td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${item.checkStatusName}</td>
                                    <td><a href="${pageContext.request.contextPath}/product/productEdit.html?product.id=${item.id}" class="btn btn-mini">
                                            <i class="icon-edit"> </i>编辑
                                        </a> <a href="${pageContext.request.contextPath}/product/productItem.html?product.id=${item.id}" class="btn btn-mini">
                                            <i class="icon-list-alt"> </i>详细
                                        </a></td>
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

    <jsp:include page="common-modal.jsp">
        <jsp:param name="myidentify" value="userinfo" />
        <jsp:param name="title" value="请选择一个用户" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/user/userListAjax.html" />
    </jsp:include>

</body>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_product").addClass("active");

        $('#windowTitleDialoguserinfo').delegate('a.userinfoselect', 'click', function(e) {
            e.preventDefault();
            var $this = $(this);
            $('#userId').val($this.attr('attr-id'));
            $this.closest('div.modal').modal('hide');
            return false;
        });
    });
</script>
</html>
