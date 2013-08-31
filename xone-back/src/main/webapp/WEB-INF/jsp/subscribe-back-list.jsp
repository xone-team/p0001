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
                        <li>用户管理 <span class="divider">/</span></li>
                        <li class="active">列表</li>
                    </ul>
                </div>
                <div class="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
                        </div>
                        <div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <form id="myqueryform" action="${pageContext.request.contextPath}/subscribe/subscribeList.html" method="get">
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="idMin">编号</label>
                                                <div class="controls">
                                                    <input type="text" id="idMin" class="span5" name="subscribe.idMin" value="${subscribe.idMin}" maxlength="20" placeholder="最小值"> <span class="add-on">~</span> <input type="text" id="idMax" class="span5" name="subscribe.idMax" value="${subscribe.idMax}" maxlength="20" placeholder="最大值">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="marketarea">市场区域</label>
                                                <div class="controls">
                                                    <input type="text" id="marketarea" name="subscribe.marketarea" value="${subscribe.marketarea}" maxlength="20" placeholder="市场区域">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="productNameKey">产品名称</label>
                                                <div class="controls">
                                                    <input type="text" id="productNameKey" name="subscribe.productNameKey" value="${subscribe.productNameKey}" maxlength="20" placeholder="产品名称">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="saleType">销售类型</label>
                                                <div class="controls">
                                                    <input type="text" id="saleType" name="subscribe.saleType" value="${subscribe.saleType}" maxlength="2" placeholder="销售类型">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="credit">公司信誉</label>
                                                <div class="controls">
                                                    <input type="text" id="credit" name="subscribe.credit" value="${subscribe.credit}" maxlength="2" placeholder="公司信誉">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="refIdMin">相关编号</label>
                                                <div class="controls">
                                                    <input type="text" id="refIdMin" class="span5" name="subscribe.refIdMin" value="${subscribe.refIdMin}" maxlength="20" placeholder="最小值"> <span class="add-on">~</span> <input type="text" id="refIdMax" class="span5" name="subscribe.refIdMax" value="${subscribe.refIdMax}" maxlength="20" placeholder="最大值">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="userApplyMin">申请人</label>
                                                <div class="controls">
                                                    <input type="text" id="userApplyMin" class="span5" name="subscribe.userApplyMin" value="${subscribe.userApplyMin}" maxlength="20" placeholder="最小值"> <span class="add-on">~</span> <input type="text" id="userApplyMax" class="span5" name="subscribe.userApplyMax" value="${subscribe.userApplyMax}" maxlength="20" placeholder="最大值">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateApplyMin">申请时间</label>
                                                <div class="controls">
                                                    <input type="text" id="dateApplyMin" class="span5 Wdate" onclick="WdatePicker()" name="subscribe.dateApplyMin" value="${subscribe.dateApplyMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="dateApplyMax" class="span5 Wdate" onclick="WdatePicker()" name="subscribe.dateApplyMax" value="${subscribe.dateApplyMax}" maxlength="19" placeholder="最大日期">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="userCheckMin">审核人</label>
                                                <div class="controls">
                                                    <input type="text" id="userCheckMin" class="span5" name="subscribe.userCheckMin" value="${subscribe.userCheckMin}" maxlength="20" placeholder="最小值"> <span class="add-on">~</span> <input type="text" id="userCheckMax" class="span5" name="subscribe.userCheckMax" value="${subscribe.userCheckMax}" maxlength="20" placeholder="最大值">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateCheckMin">审核时间</label>
                                                <div class="controls">
                                                    <input type="text" id="dateCheckMin" class="span5 Wdate" onclick="WdatePicker()" name="subscribe.dateCheckMin" value="${subscribe.dateCheckMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="dateCheckMax" class="span5 Wdate" onclick="WdatePicker()" name="subscribe.dateCheckMax" value="${subscribe.dateCheckMax}" maxlength="19" placeholder="最大日期">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="flagDeleted">删除标识</label>
                                                <div class="controls">
                                                    <input type="text" id="flagDeleted" name="subscribe.flagDeleted" value="${subscribe.flagDeleted}" maxlength="1" placeholder="删除标识">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="userCreatedMin">创建人</label>
                                                <div class="controls">
                                                    <input type="text" id="userCreatedMin" class="span5" name="subscribe.userCreatedMin" value="${subscribe.userCreatedMin}" maxlength="20" placeholder="最小值"> <span class="add-on">~</span> <input type="text" id="userCreatedMax" class="span5" name="subscribe.userCreatedMax" value="${subscribe.userCreatedMax}" maxlength="20" placeholder="最大值">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateCreatedMin">创建时间</label>
                                                <div class="controls">
                                                    <input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="subscribe.dateCreatedMin" value="${subscribe.dateCreatedMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="subscribe.dateCreatedMax" value="${subscribe.dateCreatedMax}" maxlength="19" placeholder="最大日期">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="userUpdatedMin">更新人</label>
                                                <div class="controls">
                                                    <input type="text" id="userUpdatedMin" class="span5" name="subscribe.userUpdatedMin" value="${subscribe.userUpdatedMin}" maxlength="20" placeholder="最小值"> <span class="add-on">~</span> <input type="text" id="userUpdatedMax" class="span5" name="subscribe.userUpdatedMax" value="${subscribe.userUpdatedMax}" maxlength="20" placeholder="最大值">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="lastUpdatedMin">更新时间</label>
                                                <div class="controls">
                                                    <input type="text" id="lastUpdatedMin" class="span5 Wdate" onclick="WdatePicker()" name="subscribe.lastUpdatedMin" value="${subscribe.lastUpdatedMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="lastUpdatedMax" class="span5 Wdate" onclick="WdatePicker()" name="subscribe.lastUpdatedMax" value="${subscribe.lastUpdatedMax}" maxlength="19" placeholder="最大日期">
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
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/subscribe/subscribeCreate.html"> <i class="icon-plus"> </i>创建
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
                                <th>市场区域</th>
                                <th>产品名称</th>
                                <th>销售类型</th>
                                <th>公司信誉</th>
                                <th>相关编号</th>
                                <th>申请人</th>
                                <th>申请时间</th>
                                <th>审核人</th>
                                <th>审核时间</th>
                                <th>删除标识</th>
                                <th>创建人</th>
                                <th>创建时间</th>
                                <th>更新人</th>
                                <th>更新时间</th>
                                <th style="width: 4em;">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.marketarea}</td>
                                    <td>${item.productNameKey}</td>
                                    <td>${item.saleType}</td>
                                    <td>${item.credit}</td>
                                    <td>${item.refId}</td>
                                    <td>${item.userApply}</td>
                                    <td><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${item.userCheck}</td>
                                    <td><fmt:formatDate value="${item.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${item.flagDeleted}</td>
                                    <td>${item.userCreated}</td>
                                    <td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${item.userUpdated}</td>
                                    <td><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td><a href="${pageContext.request.contextPath}/subscribe/subscribeEdit.html?subscribe.id=${item.id}" class="btn btn-mini">编辑</a> <a href="${pageContext.request.contextPath}/subscribe/subscribeItem.html?subscribe.id=${item.id}" class="btn btn-mini">详细</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <x:page href="${pageContext.request.contextPath}/subscribe/subscribeList.html" pagination="${pagination}" />
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_subscribe").addClass("active");
    });
</script>
</html>
