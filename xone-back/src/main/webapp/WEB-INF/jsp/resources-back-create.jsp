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
                        <li class="active">创建资源</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/resources/resourcesSave.html">
                    <div class="control-group">
                        <label class="control-label" for="name">资源名称</label>
                        <div class="controls">
                            <input type="text" id="name" name="resources.name" maxlength="255" placeholder="资源名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="resourceType">资源类型</label>
                        <div class="controls">
                            <input type="text" id="resourceType" name="resources.resourceType" maxlength="11" placeholder="资源类型" value="1">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="priority">优先级</label>
                        <div class="controls">
                            <input type="text" id="priority" name="resources.priority" maxlength="11" placeholder="优先级" value="0">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="resourceUrl">资源地址</label>
                        <div class="controls">
                            <input type="text" id="resourceUrl" name="resources.resourceUrl" maxlength="255" placeholder="资源地址">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="remark">备注</label>
                        <div class="controls">
                            <input type="text" id="remark" name="resources.remark" maxlength="1024" placeholder="备注">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="enable">可用标识</label>
                        <div class="controls">
                            <select class="selectpicker" id="enable" name="resources.enable">
                                <c:forEach items="${commonTypes.ynList}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == resources.enable}">selected</c:if>>${it.name}</option>
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
                            <button type="button" class="btn" onclick="doSaveForm();">提交创建</button>
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
        jQuery("#X_menu_li_resources").addClass("active");
    });
    jQuery(function() {
        jQuery("#X_menu_li_roles").addClass("active");
    });
    function doSaveForm() {
        var $form = $('#saveForm');
        var validate = [ {
            name : 'name',
            text : '请输入资源名'
        }, {
            name : 'resourceType',
            text : '请输入资源类别'
        }, {
            name : 'resourceType',
            text : '请输入资源类别格式错误',
            func : numberValidation
        }, {
            name : 'priority',
            text : '请输入优先级'
        }, {
            name : 'priority',
            text : '优先级必须为数字',
            func : numberValidation
        }, {
            name : 'resourceUrl',
            text : '请输入资源地址'
        } ];

        var pass = XONE.valid(validate, $form, "resources.");
        if (pass)
            $form.submit();
    }
    function numberValidation(inputEl){
        var result = true;
	    var val = inputEl.val();
	    if(val != null && val.length > 0){
	        var n = null;
	        try{
	            n = parseInt(val);
	        }catch(e){}
	        
	        if(n == null || isNaN(n) || n < 0){
	            result = false;
	        }
	    }
	    return result;
    }
</script>
</html>
