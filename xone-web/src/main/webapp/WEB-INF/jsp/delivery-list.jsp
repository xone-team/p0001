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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="16" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的配套服务 <span class="divider">/</span></li>
                    <li class="active">物流配送列表</li>
                </ul>
                <table class="table table-bordered" style="width: 100%">
                    <thead>
                        <tr>
                            <th>编号</th>
                            <th>市场区域</th>
                            <th>目的地点</th>
                            <th>上货时间</th>
                            <th>上货地点</th>
                            <th>箱数</th>
                            <th>单位重量</th>
                            <th>总箱数</th>
                            <th>总重</th>
                            <th>通过标识</th>
                            <th>创建时间</th>
                            <th style="width: 8em;">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${pagination.list}">
                            <tr>
                                <td class="table-col-index">${item.id}</td>
                                <td>${item.marketarea}</td>
                                <td>${item.determini}</td>
                                <td class="table-col-number"><fmt:formatDate value="${item.loadtime}" pattern="yyyy-MM-dd hh:mm" /></td>
                                <td>${item.loadaddress}</td>
                                <td class="table-col-number">${item.boxNum}</td>
                                <td class="table-col-number">${item.unitNum}</td>
                                <td class="table-col-number">${item.boxTotal}</td>
                                <td class="table-col-number">${item.totalWeight}</td>
                                <td>${item.flagPassName}</td>
                                <td class="table-col-number"><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                <td><c:if test="${item.flagPass != '1'}">
                                        <a href="${pageContext.request.contextPath}/delivery/deliveryEdit.html?delivery.id=${item.id}" class="btn btn-mini">
                                            <i class="icon-edit"> </i>编辑
                                        </a>
                                    </c:if> <a href="${pageContext.request.contextPath}/delivery/deliveryItem.html?delivery.id=${item.id}" class="btn btn-mini">
                                        <i class="icon-list-alt"> </i>详细
                                    </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <x:page href="${pageContext.request.contextPath}/delivery/deliveryList.html" pagination="${pagination}" />
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
