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
                <c:choose>
                    <c:when test="${product.saleType == '1' }"><jsp:include page="user-center-menu.jsp"><jsp:param value="10" name="menuindex" />
                        </jsp:include></c:when>
                    <c:when test="${product.saleType == '2' }"><jsp:include page="user-center-menu.jsp"><jsp:param value="11" name="menuindex" />
                        </jsp:include></c:when>
                    <c:otherwise><jsp:include page="user-center-menu.jsp"><jsp:param value="9" name="menuindex" />
                        </jsp:include></c:otherwise>
                </c:choose>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心<span class="divider">/</span></li>
                    <li>我的售卖发布 <span class="divider">/</span></li>
                    <li class="active">我的产品列表</li>
                </ul>
                <div class="accordion" style="display: none;">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
                        </div>
                        <div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <c:choose>
                                    <c:when test="${product.saleType == '1' }">
                                        <form id="myqueryform" action="${pageContext.request.contextPath}/product/productSalesList.html" method="POST">
                                            <input name="product.saleType" value="1">
                                        </form>
                                    </c:when>
                                    <c:when test="${product.saleType == '2' }">
                                        <form id="myqueryform" action="${pageContext.request.contextPath}/product/productGroupsList.html" method="POST">
                                            <input name="product.saleType" value="2">
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <form id="myqueryform" action="${pageContext.request.contextPath}/product/productNormalList.html" method="POST">
                                            <input name="product.saleType" value="0">
                                        </form>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <p class="text-right">
                        <button class="btn btn-small" onclick="$('#myqueryform').submit();">
                            <span class="icon-search"></span>查询
                        </button>
                    </p>
                </div>
                <table class="table table-bordered" style="width: 100%">
                    <thead>
                        <th>编号</th>
                        <th>产品名称</th>
                        <th>产品类型</th>
                        <th>销售类型</th>
                        <th>产品价格</th>
                        <th>产品数量</th>
                        <th>产品产地</th>
                        <th>产品属地</th>
                        <th>申请时间</th>
                        <th>审核状态</th>
                        <th style="width: 8em;">操作</th>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${pagination.list}">
                            <tr>
                                <td class="table-col-index"><th>编号</th></td>
                                <td>${item.productName}</td>
                                <td>${product.productTypeName }</td>
                                <td>${item.saleTypeName }</td>
                                <td class="table-col-number">${item.productPrice}</td>
                                <td class="table-col-number">${item.productNum}</td>
                                <td>${item.productAddress}</td>
                                <td>${item.productLocation}</td>
                                <td class="table-col-number"><fmt:formatDate value="${item.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td>${item.checkStatusName}</td>
                                <td>
                                    <c:if test="${item.checkStatus != '1'}">
                                    <c:choose>
                                        <c:when test="${product.saleType == '1' }">
                                            <a href="${pageContext.request.contextPath}/product/productSalesEdit.html?product.id=${item.id}" class="btn btn-mini">
                                                <i class="icon-edit"> </i>编辑
                                            </a>
                                        </c:when>
                                        <c:when test="${product.saleType == '2' }">
                                            <a href="${pageContext.request.contextPath}/product/productGroupsEdit.html?product.id=${item.id}" class="btn btn-mini">
                                                <i class="icon-edit"> </i>编辑
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/product/productNormalEdit.html?product.id=${item.id}" class="btn btn-mini">
                                                <i class="icon-edit"> </i>编辑
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/product/productItem.html?product.id=${item.id}" class="btn btn-mini">
                                        <i class="icon-list-alt"> </i>详细
                                    </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <x:page href="${pageContext.request.contextPath}/product/productList.html" pagination="${pagination}" />
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
