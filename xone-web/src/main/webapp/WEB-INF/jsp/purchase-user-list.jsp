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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="13" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心<span class="divider">/</span></li>
                    <li>我的求购发布 <span class="divider">/</span></li>
                    <li class="active">求购列表</li>
                </ul>
                <table class="table table-bordered" style="width: 100%">
                    <thead>
                        <tr>
                            <th>编号</th>
                            <th>产品名称</th>
                            <th>求购类型</th>
                            <th>求购数量</th>
                            <th>产品产地</th>
                            <th>产品属地</th>
                            <th>申请时间</th>
                            <th>审核状态</th>
                            <th style="width: 8em;">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${pagination.list}" varStatus="status">
                            <tr>
                                <td class="table-col-index"><th>编号</th></td>
                                <td>${item.purchaseName}</td>
                                <td>${item.purchaseTypeName }</td>
                                <td class="table-col-number">${item.purchaseNum}</td>
                                <td>${item.purchaseAddress}</td>
                                <td>${item.purchaseLocation}</td>
                                <td class="table-col-number"><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td>${item.checkStatusName}</td>
                                <td>
                                    <c:if test="${item.checkStatus != '1'}">
                                    <a href="${pageContext.request.contextPath}/purchase/purchaseEdit.html?purchase.id=${item.id}" class="btn btn-mini">
                                        <i class="icon-edit"> </i>编辑
                                    </a>
                                    </c:if>
                                     <a href="${pageContext.request.contextPath}/purchase/purchaseItem.html?purchase.id=${item.id}" class="btn btn-mini">
                                        <i class="icon-list-alt"> </i>详细
                                    </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <x:page href="${pageContext.request.contextPath}/purchase/purchaseList.html" pagination="${pagination}" />
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
