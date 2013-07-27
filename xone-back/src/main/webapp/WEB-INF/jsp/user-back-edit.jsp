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
                        <li>用户管理 <span class="divider">/</span></li>
                        <li><a href="${pageContext.request.contextPath}/person/personList.html">用户列表</a> <span class="divider">/</span></li>
                        <li class="active">用户编辑</li>
                    </ul>
                </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/person/personUpdate.html">
                    <input type="hidden" name="person.id" value="${person.id}">
                    <div class="control-group">
                        <label class="control-label" for="username">用户名</label>
                        <div class="controls">
                            <input type="text" id="username" name="person.username" value="${person.username}" maxlength="255" placeholder="用户名">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">密码</label>
                        <div class="controls">
                            <input type="text" id="password" name="person.password" value="${person.password}" maxlength="255" placeholder="密码">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="nickName">昵称</label>
                        <div class="controls">
                            <input type="text" id="nickName" name="person.nickName" value="${person.nickName}" maxlength="255" placeholder="昵称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cellphone">手机号码</label>
                        <div class="controls">
                            <input type="text" id="cellphone" name="person.cellphone" value="${person.cellphone}" maxlength="255" placeholder="手机号码">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="contactor">联系人</label>
                        <div class="controls">
                            <input type="text" id="contactor" name="person.contactor" value="${person.contactor}" maxlength="255" placeholder="联系人">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="qq">腾讯号码</label>
                        <div class="controls">
                            <input type="text" id="qq" name="person.qq" value="${person.qq}" maxlength="255" placeholder="腾讯号码">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="email">电子邮箱</label>
                        <div class="controls">
                            <input type="text" id="email" name="person.email" value="${person.email}" maxlength="255" placeholder="电子邮箱">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="address">联系地址</label>
                        <div class="controls">
                            <input type="text" id="address" name="person.address" value="${person.address}" maxlength="255" placeholder="联系地址">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="credit">认证标识</label>
                        <div class="controls">
                            <select class="selectpicker" id="credit" name="person.credit">
                                <c:forEach items="${commonTypes.ynList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == person.credit}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userLevel">用户级别</label>
                        <div class="controls">
                            <select class="selectpicker" id="userLevel" name="person.userLevel">
                                <c:forEach items="${commonTypes.userLevelList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == person.userLevel}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="roleIds">角色</label>
                        <div class="controls">
                            <div id="roleIdsSelectResult" class="inline">
                                <c:forEach items="${rolesList}" var="role">
                                    <div class="X-select-result inline">
                                        <input type="hidden" class="X-select-hidden-value" value="${role.id}" name="roleIds"> <span class="label label-default">${role.name}</span>
                                    </div>
                                </c:forEach>
                            </div>
                            <button type="button" class="btn" onclick="showModalRolesSelect($('#roleIdsSelectResult'), 'roleIds');">
                                <i class="icon-filter"></i>选择
                            </button>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn">提交更新</button>
                        </div>
                    </div>
                </form>
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

                        var selectedResult = jQuery("input[type=checkbox]:checked", listBody).siblings(".X-select-result");
                        if (selectedResult != null) {
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
</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_person").addClass("active");
    });
</script>
</html>
