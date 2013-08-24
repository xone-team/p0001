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
    <jsp:include page="common-nav.jsp"><jsp:param value="3" name="offset" /></jsp:include>
    <div class="container">
        <div class="row">
            <div class="span9 bs-docs-sidebar">
                <div class="row-fluid">
                    <div class="span12">
                        <c:choose>
                            <c:when test="${not empty purchase && not empty purchase.id}">
                                <table class="table table-bordered" style="width: 100%">
                                    <tr>
                                        <td>产品名称</td>
                                        <td>${purchase.purchaseName}</td>
                                    </tr>
                                    <tr>
                                        <td>产品类型</td>
                                        <td>${purchase.purchaseType}</td>
                                    </tr>
                                    <tr>
                                        <td>产品产地</td>
                                        <td>${purchase.purchaseAddress}</td>
                                    </tr>
                                    <tr>
                                        <td>产品属地</td>
                                        <td>${purchase.purchaseLocation}</td>
                                    </tr>
                                    <tr>
                                        <td>数 量</td>
                                        <td>${purchase.purchaseNum}</td>
                                    </tr>
                                    <tr>
                                        <td>描 述</td>
                                        <td>${purchase.purchaseDesc}</td>
                                    </tr>
                                    <c:forEach var="item" items="${purchase.ids}">
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

            <div class="span3 box-shadow rounded">

                <div class="right-content">

                    <div class="row-fluid">

                        <ul class="thumbnails">
                            <c:forEach var="item" items="${adList}">
                                <li class="span12" timestamp="${item.dateCreated}">
                                    <div class="thumbnail">
                                        <div class="image-wrapper">
                                            <c:choose>
                                                <c:when test="${item.adType=='0' }">
                                                    <c:set var="adrequest" value="/product/item.html?product.id=${item.refId}"></c:set>
                                                </c:when>
                                                <c:when test="${item.adType=='1' }">
                                                    <c:set var="adrequest" value="/purchase/item.html?purchase.id=${item.refId}"></c:set>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="adrequest" value="/product/list.html"></c:set>
                                                </c:otherwise>
                                            </c:choose>
                                            <a href="${pageContext.request.contextPath}${adrequest}">
                                                <img src="${pageContext.request.contextPath}/assistant/image.html?id=${item.adRefId}" alt="">
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
