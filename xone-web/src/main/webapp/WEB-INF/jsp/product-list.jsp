<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib"%>
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
                        <ul class="listview image" style="width: 100%">
                            <c:forEach var="item" items="${pagination.list}">
                                <li>
                                    <div class="icon">
                                        <img src="${pageContext.request.contextPath}/image.html?id=${item.ids[0]}">
                                    </div>
                                    <div class="data">
                                        <h4>${item.productName}</h4>
                                        <p>发布日期:${item.dateCreated},更新日期:${item.lastUpdated}</p>
                                        <p>产品地址:${item.productAddress},产品属地:${item.productLocation},产品类型:${item.productType},产品描述:${item.productDesc}</p>
                                        <a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.id}" target="_blank">查看详情</a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <x:page href="${pageContext.request.contextPath}/product/list.html" pagination="${pagination}" />
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
