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
                        <li class="active">资源列表</li>
                    </ul>
                </div>
                <div class="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
                        </div>
                        <div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <form id="myqueryform" action="${pageContext.request.contextPath}/resources/resourcesList.html" method="get">
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="name">资源名称</label>
                                                <div class="controls">
                                                    <input type="text" id="name" name="resources.name" value="${resources.name}" maxlength="255" placeholder="资源名称">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="resourceTypeMin">资源类型</label>
                                                <div class="controls">
                                                    <input type="text" id="resourceTypeMin" class="span5" name="resources.resourceTypeMin" value="${resources.resourceTypeMin}" maxlength="11" placeholder="最小值">
                                                    <span class="add-on">~</span>
                                                    <input type="text" id="resourceTypeMax" class="span5" name="resources.resourceTypeMax" value="${resources.resourceTypeMax}" maxlength="11" placeholder="最大值">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="priorityMin">优先级</label>
                                                <div class="controls">
                                                    <input type="text" id="priorityMin" class="span5" name="resources.priorityMin" value="${resources.priorityMin}" maxlength="11" placeholder="最小值">
                                                    <span class="add-on">~</span>
                                                    <input type="text" id="priorityMax" class="span5" name="resources.priorityMax" value="${resources.priorityMax}" maxlength="11" placeholder="最大值">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="resourceUrl">资源地址</label>
                                                <div class="controls">
                                                    <input type="text" id="resourceUrl" name="resources.resourceUrl" value="${resources.resourceUrl}" maxlength="255" placeholder="资源地址">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="remark">备注</label>
                                                <div class="controls">
                                                    <input type="text" id="remark" name="resources.remark" value="${resources.remark}" maxlength="1024" placeholder="备注">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateCreatedMin">创建时间</label>
                                                <div class="controls">
                                                    <input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="resources.dateCreatedMin" value="${resources.dateCreatedMin}" maxlength="19" placeholder="最小日期">
                                                    <span class="add-on">~</span>
                                                    <input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="resources.dateCreatedMax" value="${resources.dateCreatedMax}" maxlength="19" placeholder="最大日期">
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
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/resources/resourcesCreate.html"> <i class="icon-plus"></i>创建
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
                                <th>资源名称</th>
                                <th>资源类型</th>
                                <th>优先级</th>
                                <th>资源地址</th>
                                <th>备注</th>
                                <th>创建时间</th>
                                <th style="width: 4em;">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}" varStatus="status">
                                <tr>
                                    <td class="table-col-index">${status.index + 1}</td>
                                    <td><a href="${pageContext.request.contextPath}/resources/resourcesItem.html?resources.id=${item.id}">${item.name}</a></td>
                                    <td>${item.resourceType}</td>
                                    <td class="table-col-number">${item.priority}</td>
                                    <td>${item.resourceUrl}</td>
                                    <td>${item.remark}</td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td><a href="${pageContext.request.contextPath}/resources/resourcesEdit.html?resources.id=${item.id}" class="btn btn-mini"><i class="icon-edit"> </i>编辑</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <x:page href="${pageContext.request.contextPath}/resources/resourcesList.html" pagination="${pagination}" />
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
                        XONE.CURRENT_MODEL.deleteUrl = "${pageContext.request.contextPath}/resources/resourcesDelete.html";
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
        jQuery("#X_menu_li_resources").addClass("active");
    });
</script>
</html>
