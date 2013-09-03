<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib"%>
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
    <jsp:include page="common-nav.jsp"><jsp:param value="5" name="offset" /></jsp:include>
    <div class="container">
        <div class="row">
            <div class="span3">
                <jsp:include page="user-center-menu.jsp"><jsp:param value="24" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的其它服务 <span class="divider">/</span></li>
                    <li class="active">我的公司列表</li>
                </ul>
                <table class="table table-bordered" style="width: 100%">
                    <thead>
                        <tr>
                            <th>编号</th>
                            <th>公司名称</th>
                            <th>公司地址</th>
                            <th>公司电话</th>
                            <th>移动电话</th>
                            <th>联系人</th>
                            <th>公司传真</th>
                            <th>公司简介</th>
                            <th>创建日期</th>
                            <th style="width: 8em;">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${pagination.list}" varStatus="status">
                            <tr>
                                <td class="table-col-index">${item.id}</td>
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
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>

    <jsp:include page="common-modal.jsp">
        <jsp:param name="myidentify" value="userinfo" />
        <jsp:param name="title" value="请选择一个用户" />
        <jsp:param name="url" value="${pageContext.request.contextPath }/user/userListAjax.html" />
    </jsp:include>

</body>
<script>
    jQuery(function() {
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
