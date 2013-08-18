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
                        <li class="active">公司信息列表</li>
                    </ul>
                </div>
                <div class="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
                        </div>
                        <div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <form id="myqueryform" action="${pageContext.request.contextPath}/companyInfo/companyInfoList.html" method="get">
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="name">公司名称</label>
                                                <div class="controls">
                                                    <input type="text" id="name" name="companyInfo.name" value="${companyInfo.name}" maxlength="255" placeholder="公司名称">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="address">公司地址</label>
                                                <div class="controls">
                                                    <input type="text" id="address" name="companyInfo.address" value="${companyInfo.address}" maxlength="255" placeholder="公司地址">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="tel">公司电话</label>
                                                <div class="controls">
                                                    <input type="text" id="tel" name="companyInfo.tel" value="${companyInfo.tel}" maxlength="25" placeholder="公司电话">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="mobile">移动电话</label>
                                                <div class="controls">
                                                    <input type="text" id="mobile" name="companyInfo.mobile" value="${companyInfo.mobile}" maxlength="15" placeholder="移动电话">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="contact">联系人</label>
                                                <div class="controls">
                                                    <input type="text" id="contact" name="companyInfo.contact" value="${companyInfo.contact}" maxlength="15" placeholder="联系人">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="fax">公司传真</label>
                                                <div class="controls">
                                                    <input type="text" id="fax" name="companyInfo.fax" value="${companyInfo.fax}" maxlength="25" placeholder="公司传真">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5 form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="intro">公司简介</label>
                                                <div class="controls">
                                                    <input type="text" id="intro" name="companyInfo.intro" value="${companyInfo.intro}" maxlength="25" placeholder="公司简介">
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
                        <a class="btn btn-small" href="${pageContext.request.contextPath}/companyInfo/companyInfoCreate.html">
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
                            <th>序号</th>
                            <th>公司名称</th>
                            <th>公司地址</th>
                            <th>公司电话</th>
                            <th>移动电话</th>
                            <th>联系人</th>
                            <th>公司传真</th>
                            <th>公司简介</th>
                            <th>创建日期</th>
                            <th style="width: 8em;">操作</th>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${pagination.list}">
                                <tr>
                                    <td class="table-col-index">${status.index + 1}</td>
                                    <td>${item.name}</td>
                                    <td>${item.address}</td>
                                    <td>${item.tel}</td>
                                    <td>${item.mobile}</td>
                                    <td>${item.contact}</td>
                                    <td>${item.fax}</td>
                                    <td>${item.intro}</td>
                                    <td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td><a href="${pageContext.request.contextPath}/companyInfo/companyInfoEdit.html?companyInfo.id=${item.id}" class="btn btn-mini">
                                            <i class="icon-edit"> </i>编辑
                                        </a> <a href="${pageContext.request.contextPath}/companyInfo/companyInfoItem.html?companyInfo.id=${item.id}" class="btn btn-mini">
                                            <i class="icon-list-alt"> </i>详细
                                        </a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <x:page href="${pageContext.request.contextPath}/companyInfo/companyInfoList.html" pagination="${pagination}" />
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
<script>
    jQuery(function() {
        jQuery("#X_menu_li_companyInfo").addClass("active");

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
