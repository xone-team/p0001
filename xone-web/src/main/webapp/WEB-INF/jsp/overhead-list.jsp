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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="19" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的其它服务 <span class="divider">/</span></li>
                    <li class="active">我的置顶列表</li>
                </ul>
                <table class="table table-bordered" style="width: 100%">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>置顶类型</th>
                            <th>审核状态</th>
                            <th>备注</th>
                            <th>申请日期</th>
                            <th>审核日期</th>
                            <th style="width: 8em;">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${pagination.list}" varStatus="status">
                            <tr>
                                <td class="table-col-index">${status.index + 1}</td>
                                <td>${item.overheadTypeName}</td>
                                <td>${item.checkStatusName}</td>
                                <td>${item.remark}</td>
                                <td class="table-col-number"><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td class="table-col-number"><fmt:formatDate value="${item.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td><a href="${pageContext.request.contextPath}/overhead/overheadEdit.html?overhead.id=${item.id}" class="btn btn-mini">
                                        <i class="icon-edit"> </i>编辑
                                    </a> <a href="${pageContext.request.contextPath}/overhead/overheadItem.html?overhead.id=${item.id}" class="btn btn-mini">
                                        <i class="icon-list-alt"></i>详细
                                    </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <x:page href="${pageContext.request.contextPath}/overhead/overheadList.html" pagination="${pagination}" />
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
</html>
