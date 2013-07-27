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
                                <form id="myqueryform" action="${pageContext.request.contextPath}/person/personList.html" method="get">
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="username">用户名</label>
                                                <div class="controls">
                                                    <input type="text" id="username" name="person.username" value="${person.username}" maxlength="255" placeholder="用户名">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="dateCreatedMin">创建时间</label>
                                                <div class="controls">
                                                    <input type="text" id="dateCreatedMin" class="span5 Wdate" onclick="WdatePicker()" name="person.dateCreatedMin" value="${person.dateCreatedMin}" maxlength="19" placeholder="最小日期"> <span class="add-on">~</span> <input type="text" id="dateCreatedMax" class="span5 Wdate" onclick="WdatePicker()" name="person.dateCreatedMax" value="${person.dateCreatedMax}" maxlength="19" placeholder="最大日期">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid hide">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="password">密码</label>
                                                <div class="controls">
                                                    <input type="text" id="password" name="person.password" value="${person.password}" maxlength="255" placeholder="密码">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="roleId">角色</label>
                                                <div class="controls">
                                                    <div id="roleId" class="inline"></div>
                                                    <button type="button" class="btn inline" onclick="showModalRolesSelect($('#roleId'), 'roles.roleId');">
                                                        <i class="icon-filter"></i>选择
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="nickName">昵称</label>
                                                <div class="controls">
                                                    <input type="text" id="nickName" name="person.nickName" value="${person.nickName}" maxlength="255" placeholder="昵称">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="cellphone">手机号码</label>
                                                <div class="controls">
                                                    <input type="text" id="cellphone" name="person.cellphone" value="${person.cellphone}" maxlength="255" placeholder="手机号码">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="contactor">联系人</label>
                                                <div class="controls">
                                                    <input type="text" id="contactor" name="person.contactor" value="${person.contactor}" maxlength="255" placeholder="联系人">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="qq">腾讯号码</label>
                                                <div class="controls">
                                                    <input type="text" id="qq" name="person.qq" value="${person.qq}" maxlength="255" placeholder="腾讯号码">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="email">电子邮箱</label>
                                                <div class="controls">
                                                    <input type="text" id="email" name="person.email" value="${person.email}" maxlength="255" placeholder="电子邮箱">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="address">联系地址</label>
                                                <div class="controls">
                                                    <input type="text" id="address" name="person.address" value="${person.address}" maxlength="255" placeholder="联系地址">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="credit">认证标识</label>
                                                <div class="controls">
                                                    <input type="text" id="credit" name="person.credit" value="${person.credit}" maxlength="2" placeholder="认证标识">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="userLevel">用户级别</label>
                                                <div class="controls">
                                                    <input type="text" id="userLevel" name="person.userLevel" value="${person.userLevel}" maxlength="2" placeholder="用户级别">
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
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/person/personCreate.html"> <i class="icon-plus"> </i>创建
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
                                <th>用户名</th>
                                <th>创建时间</th>
                                <th>昵称</th>
                                <th>手机号码</th>
                                <th>联系人</th>
                                <th>腾讯号码</th>
                                <th>电子邮箱</th>
                                <th>联系地址</th>
                                <th>认证标识</th>
                                <th>用户级别</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td><a href="${pageContext.request.contextPath}/person/personItem.html?person.id=${item.id}">${item.username} </a></td>
                                    <td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd" /></td>
                                    <td>${item.nickName}</td>
                                    <td>${item.cellphone}</td>
                                    <td>${item.contactor}</td>
                                    <td>${item.qq}</td>
                                    <td>${item.email}</td>
                                    <td>${item.address}</td>
                                    <td><c:forEach items="${commonTypes.ynList}" var="it">
                                            <c:if test="${it.value == item.credit}">${it.name}</c:if>
                                        </c:forEach></td>
                                    <td><c:forEach items="${commonTypes.userLevelList}" var="it">
                                            <c:if test="${it.value == item.userLevel}">${it.name}</c:if>
                                        </c:forEach></td>
                                    <td><a href="${pageContext.request.contextPath}/person/personEdit.html?person.id=${item.id}" class="btn btn-mini"><i class="icon-edit"> </i>编辑</a>
                                        <button class="btn btn-mini" onclick="showModalDelete('person.id=${item.id}')">
                                            <i class="icon-trash"> </i>删除
                                        </button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <x:page href="${pageContext.request.contextPath}/person/personList.html" pagination="${pagination}" />
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
    
    
    <!-- modal to select role -->
    <div id="X_model_rolesSelect" class="modal hide fade">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>选择角色</h3>
        </div>
        <div class="modal-body">
            <!-- query conditions -->
            <form id="modalRolesQueryForm">
                <div class="row-fluid">
                    <div class="span5 form-horizontal">
                        <div class="control-group">
                            <label class="control-label" for="modalInputName">名称</label>
                            <div class="controls">
                                <input type="text" name="roles.name" id="modalInputName" placeholder="名称">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- /query conditions -->
            <div class="row-fluid">
                <p class="text-right">
                    <button class="btn btn-small" onclick="queryModalRoles();">
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
                            <th>备注</th>
                            <th>选择</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyListModalRoles">
                    </tbody>
                </table>
            </div>
            <!-- /query result -->
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal">取消</button>
            <button class="btn btn-primary" onclick="endModalRolesSelect();">完成</button>
        </div>
    </div>
    <script type="text/javascript">
                    function showModalRolesSelect(targetObj, targetName) {
                        XONE.CURRENT_MODEL = {};
                        XONE.CURRENT_MODEL.target = targetObj;
                        XONE.CURRENT_MODEL.modal = jQuery("#X_model_rolesSelect");
                        XONE.CURRENT_MODEL.listBody = jQuery("#tbodyListModalRoles");
                        XONE.CURRENT_MODEL.container = jQuery("#modalRolesQueryForm");
                        XONE.CURRENT_MODEL.queryUrl = "${pageContext.request.contextPath}/roles/rolesSelect.html";
                        XONE.CURRENT_MODEL.targetName = targetName;

                        XONE.CURRENT_MODEL.modal.modal("show");
                        queryModalRoles();
                    }
                    function endModalRolesSelect() {
                        var listBody = XONE.CURRENT_MODEL.listBody;
                        var container = XONE.CURRENT_MODEL.container;
                        var modalCurrent = XONE.CURRENT_MODEL.modal;
                        var targetObj = XONE.CURRENT_MODEL.target;
                        var targetName = XONE.CURRENT_MODEL.targetName;

                        var selectedResult = jQuery("input[type=radio]:checked", listBody).siblings(".X-select-result");
                        if (selectedResult == null) {
                            alert("请选择一角色");
                        } else {
                            modalCurrent.modal('hide');
                            var h = selectedResult.clone();
                            h.removeClass("hide").addClass("inline");
                            jQuery(".X-select-hidden-value", h).attr("name", targetName);
                            targetObj.html(h);
                        }
                    }

                    function queryModalRoles() {
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
                        XONE.CURRENT_MODEL.deleteUrl = "${pageContext.request.contextPath}/person/personDelete.html";
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
        jQuery("#X_menu_li_person").addClass("active");
    });
</script>
</html>
