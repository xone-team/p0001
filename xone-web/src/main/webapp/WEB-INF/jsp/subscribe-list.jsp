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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="18" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的其它服务 <span class="divider">/</span></li>
                    <li class="active">我的订阅列表</li>
                </ul>
                <table class="table table-bordered" style="width: 100%">
                    <thead>
                        <th>编号</th>
                        <th>市场区域</th>
                        <th>产品名称</th>
                        <th>销售类型</th>
                        <th>公司信誉</th>
                        <th>相关编号</th>
                        <th style="width: 8em;">操作</th>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${pagination.list}">
                            <tr>
                                <td class="table-col-index">${item.id}</td>
                                <td>${item.marketarea}</td>
                                <td>${item.productNameKey}</td>
                                <td>${item.saleTypeName}</td>
                                <td>${item.creditName}</td>
                                <td class="table-col-number">${item.refId}</td>
                                <td><a href="${pageContext.request.contextPath}/subscribe/subscribeEdit.html?subscribe.id=${item.id}" class="btn btn-mini">
                                        <i class="icon-edit"> </i>编辑
                                    </a> <a href="${pageContext.request.contextPath}/subscribe/subscribeItem.html?subscribe.id=${item.id}" class="btn btn-mini">
                                        <i class="icon-list-alt"> </i>详细
                                    </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <x:page href="${pageContext.request.contextPath}/subscribe/subscribeList.html" pagination="${pagination}" />
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
