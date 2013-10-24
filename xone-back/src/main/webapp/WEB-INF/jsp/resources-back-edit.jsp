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
                        <li><a href="${pageContext.request.contextPath}/resources/resourcesList.html">资源列表</a> <span class="divider">/</span></li>
                        <li class="active">资源编辑</li>
                    </ul>
                </div>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/resources/resourcesUpdate.html">
                    <input type="hidden" name="resources.id" value="${resources.id}">
                    <div class="control-group">
                        <label class="control-label" for="name">资源名称</label>
                        <div class="controls">
                            <input type="text" id="name" name="resources.name" value="${resources.name}" maxlength="255" placeholder="资源名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="resourceType">资源类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="resourceType" name="resources.resourceType">
                                <c:forEach items="${resourceType}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == resources.resourceType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="priority">优先级</label>
                        <div class="controls">
                            <input type="text" id="priority" name="resources.priority" value="${resources.priority}" maxlength="11" placeholder="优先级">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="resourceUrl">资源地址</label>
                        <div class="controls">
                            <input type="text" id="resourceUrl" name="resources.resourceUrl" value="${resources.resourceUrl}" maxlength="255" placeholder="资源地址">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="remark">备注</label>
                        <div class="controls">
                            <input type="text" id="remark" name="resources.remark" value="${resources.remark}" maxlength="1024" placeholder="备注">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="enable">可用标识</label>
                        <div class="controls">
                            <select class="selectpicker" id="enable" name="resources.enable">
                                <c:forEach items="${enable}" var="it">
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
                                    <input type="hidden" class="X-select-hidden-value" value="${role.id}" name="roleIds">
                                    <span class="label label-default">${role.name}</span>
                                </c:forEach>
                            </div>
                            <button type="button" class="btn inline" onclick="$('#windowTitleDialogrolescheck').modal('show');">
                                <i class="icon-filter"></i>选择
                            </button>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn" onclick="return confirm2('update', '确定更新本条记录?');">提交更新</button>
                            <button type="submit" name="delete" value="delete" class="btn" onclick="return confirm2('delete', '确定删除本条记录?');">删除记录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>

    <jsp:include page="common-modal.jsp">
        <jsp:param name="myidentify" value="rolescheck" />
        <jsp:param name="title" value="请选择角色" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/roles/rolesCheck.html" />
    </jsp:include>

</body>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
<script src="${STATIC_ROOT}/js/fileupload.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#windowTitleDialogrolescheck').delegate('button.rolescheckselectbutton', 'click', function(e) {
            e.preventDefault();
            var $this = $(this);
            var checkedRows = $("#windowTitleDialogrolescheck input.rolescheck:checked");
            if (checkedRows.size() < 1) {
                return alert("请至少选择一个角色。");
            }
            var h = "";
            checkedRows.each(function() {
                var r = $(this);
                h += '<input type="hidden" class="X-select-hidden-value" value="' + r.attr('attr-id') + '" name="roleIds">';
                h += '<span class="label label-default">' + r.attr('attr-name') + '</span>';
            })

            $("#roleIdsSelectResult").html(h);
            $this.closest('div.modal').modal('hide');
            return false;
        });
    });
</script>

<script>
window.submitButtonName = "update";
function confirm2(buttonName, msg){
    window.submitButtonName = buttonName;
    return confirm(msg);
}
    jQuery(function() {
        jQuery("#X_menu_li_resources").addClass("active");
        $('#saveForm').submit(function() {
            if('delete' == window.submitButtonName){
                return true;
            }
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
            return pass;
        });
    });
    function numberValidation(inputEl) {
        var result = true;
        var val = inputEl.val();
        if (val != null && val.length > 0) {
            var n = null;
            try {
                n = parseInt(val);
            } catch (e) {
            }

            if (n == null || isNaN(n) || n < 0) {
                result = false;
            }
        }
        return result;
    }
</script>
</html>
