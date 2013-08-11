<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>欢迎使用</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${STATIC_ROOT}/css/docs.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/css/listview.css" />
<jsp:include page="common-header.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common-nav.jsp"><jsp:param value="2" name="offset" /></jsp:include>
    <div class="container">
        <div class="row">
            <div class="span9 bs-docs-sidebar">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <ul class="breadcrumb" id="X_breadcrumbs_ul">
                                <li>用户中心<span class="divider">/</span></li>
                                <li>我的售卖发布 <span class="divider">/</span></li>
                                <li><a href="${pageContext.request.contextPath}/product/productList.html">产品列表</a> <span class="divider">/</span></li>
                                <li class="active">产品详细</li>
                            </ul>
                        </div>
                        <c:choose>
                            <c:when test="${not empty product && not empty product.id}">
                                <table class="table table-bordered" style="width: 100%">
                                    <tr>
                                        <td>产品名称</td>
                                        <td>${product.productName}</td>
                                    </tr>
                                    <tr>
                                        <td>产品类型</td>
                                        <td>${product.productTypeName}</td>
                                    </tr>
                                    <tr>
                                        <td>产品产地</td>
                                        <td>${product.productAddress}</td>
                                    </tr>
                                    <tr>
                                        <td>产品属地</td>
                                        <td>${product.productLocation}</td>
                                    </tr>
                                    <tr>
                                        <td>产品价格</td>
                                        <td>${product.productPrice}</td>
                                    </tr>
                                    <tr>
                                        <td>数 量</td>
                                        <td>${product.productNum}</td>
                                    </tr>
                                    <tr>
                                        <td>有&nbsp&nbsp效&nbsp&nbsp期</td>
                                        <td>${product.productValid}</td>
                                    </tr>
                                    <tr>
                                        <td>描 述</td>
                                        <td>${product.productDesc}</td>
                                    </tr>
                                    <c:forEach var="item" items="${product.ids}">
                                        <tr>
                                            <td colspan="2"><img class="img-rounded" src="${pageContext.request.contextPath}/image.html?id=${item}" alt="" /></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <p>对不起，该页面已经被移走或者访问参数不正确!</p>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
            <div class="span3" style="margin-left: 13px;">
                <ul class="nav nav-list bs-docs-sidenav" style="margin-top: 0px;">
                    <li><a href="#global" style="padding: 15px 15px;">
                            <img class="img-rounded mybigimage" src="${STATIC_ROOT}/image/apple.png" style="width: 258px;">
                        </a></li>
                    <li><a href="#gridSystem" style="padding: 15px 15px;">
                            <img class="img-rounded mybigimage" src="${STATIC_ROOT}/image/angry.jpg" style="width: 258px;">
                        </a></li>
                </ul>
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
