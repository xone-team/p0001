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
                        <li class="active">用户列表</li>
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
                                                    <button type="button" class="btn inline" onclick="$('#windowTitleDialogrolesinfo').modal('show');">
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
                                                    <select class="selectpicker" id="credit" name="person.credit">
                                                        <option value="">全部</option>
                                                        <c:forEach items="${credit}" var="it">
                                                            <option value="${it.value}" <c:if test="${it.value == person.credit}">selected</c:if>>${it.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="userLevel">用户级别</label>
                                                <div class="controls">
                                                    <select class="selectpicker" id="userLevel" name="person.userLevel">
                                                        <option value="">全部</option>
                                                        <c:forEach items="${userLevel}" var="it">
                                                            <option value="${it.value}" <c:if test="${it.value == person.userLevel}">selected</c:if>>${it.name}</option>
                                                        </c:forEach>
                                                    </select>
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
                                <th style="width: 8em;">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}" varStatus="status">
                                <tr>
                                    <td class="table-col-index">${status.index + 1}</td>
                                    <td>${item.username}</td>
                                    <td class="table-col-number"><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${item.nickName}</td>
                                    <td class="table-col-number">${item.cellphone}</td>
                                    <td>${item.contactor}</td>
                                    <td class="table-col-number">${item.qq}</td>
                                    <td>${item.email}</td>
                                    <td>${item.address}</td>
                                    <td>${item.creditName}</td>
                                    <td>${item.userLevelName}</td>
                                    <td><a href="${pageContext.request.contextPath}/person/personEdit.html?person.id=${item.id}" class="btn btn-mini"> <i class="icon-edit"> </i>编辑
                                    </a> <a href="${pageContext.request.contextPath}/person/personItem.html?person.id=${item.id}" class="btn btn-mini"> <i class="icon-list-alt"> </i>详细
                                    </a></td>
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

    <jsp:include page="common-modal.jsp">
        <jsp:param name="myidentify" value="rolesinfo" />
        <jsp:param name="title" value="请选择一个角色" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/roles/rolesListAjax.html" />
    </jsp:include>

</body>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
<script src="${STATIC_ROOT}/js/fileupload.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#windowTitleDialogrolesinfo').delegate('a.rolesinfoselect', 'click', function(e) {
            e.preventDefault();
            var $this = $(this);
            $('#rolesId').val($this.attr('attr-id'));
            $this.closest('div.modal').modal('hide');
            return false;
        });
    });
</script>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_person").addClass("active");
    });
</script>
</html>
