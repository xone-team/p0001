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
                        <li class="active">角色列表</li>
                    </ul>
                </div>
                <div class="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
                        </div>
                        <div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <form id="myqueryform" action="${pageContext.request.contextPath}/roles/rolesList.html" method="get">
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="name">角色名称</label>
                                                <div class="controls">
                                                    <input type="text" id="name" name="roles.name" value="${roles.name}" maxlength="255" placeholder="角色名称">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="remark">角色备注</label>
                                                <div class="controls">
                                                    <input type="text" id="remark" name="roles.remark" value="${roles.remark}" maxlength="255" placeholder="角色备注">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateCreatedMin">创建时间</label>
                                                <div class="controls">
                                                    <input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="roles.dateCreatedMin" value="${roles.dateCreatedMin}" maxlength="19" placeholder="最小日期">
                                                    <span class="add-on">~</span>
                                                    <input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="roles.dateCreatedMax" value="${roles.dateCreatedMax}" maxlength="19" placeholder="最大日期">
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
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/roles/rolesCreate.html"> <i class="icon-plus"></i>创建
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
                                <th>角色名称</th>
                                <th>角色备注</th>
                                <th>创建时间</th>
                                <th>更新时间</th>
                                <th style="width: 4em;">操作</th>
                            <tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}" varStatus="status">
                                <tr>
                                    <td class="table-col-index">${status.index + 1}</td>
                                    <td><a href="${pageContext.request.contextPath}/roles/rolesItem.html?roles.id=${item.id}">${item.name} </a></td>
                                    <td>${item.remark}</td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td><a href="${pageContext.request.contextPath}/roles/rolesEdit.html?roles.id=${item.id}" class="btn btn-mini"><i class="icon-edit"> </i>编辑</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <x:page href="${pageContext.request.contextPath}/roles/rolesList.html" pagination="${pagination}" />
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>

    <!--  modal confirm to delete -->
    <div id="X_model_confirm2delete" class="modal hide fade" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
                        XONE.CURRENT_MODEL.deleteUrl = "${pageContext.request.contextPath}/roles/rolesDelete.html";
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
        jQuery("#X_menu_li_roles").addClass("active");
    });
</script>
</html>
