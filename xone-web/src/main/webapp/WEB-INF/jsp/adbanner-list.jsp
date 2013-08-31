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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="17" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的广告列表 <span class="divider">/</span></li>
                    <li class="active">广告列表</li>
                </ul>
                <table class="table table-bordered" style="width: 100%">
                    <thead>
                        <th>编号</th>
                        <th>相关编号</th>
                        <th>广告类型</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>创建时间</th>
                        <th style="width: 4em;">操作</th>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${pagination.list}">
                            <tr>
                                <td>${item.id}</td>
                                <td><c:choose>
                                        <c:when test="${item.adType == '0'}">
                                            <a href="${pageContext.request.contextPath}/product/productItem.html?product.id=${item.refId}" target="_blank">${item.refId}</a>
                                        </c:when>
                                        <c:when test="${item.adType == '1'}">
                                            <a href="${pageContext.request.contextPath}/purchase/purchaseItem.html?purchase.id=${item.refId}" target="_blank">${item.refId}</a>
                                        </c:when>
                                        <c:otherwise>${item.refId}</c:otherwise>
                                    </c:choose></td>
                                <td>${item.adTypeName}</td>
                                <td><fmt:formatDate value="${item.adStart}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                <td><fmt:formatDate value="${item.adEnd}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                <td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                <td><a href="${pageContext.request.contextPath}/adbanner/adbannerItem.html?adbanner.id=${item.id}" class="btn btn-mini" target="_blank">
                                        <i class="icon-list-alt"> </i>详细
                                    </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <x:page href="${pageContext.request.contextPath}/adbanner/adbannerList.html" pagination="${pagination}" />
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
