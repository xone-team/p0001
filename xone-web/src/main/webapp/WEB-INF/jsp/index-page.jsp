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
    <jsp:include page="common-nav.jsp"><jsp:param value="1" name="offset" /></jsp:include>
    <div class="container">
        <div class="box-shadow">
            <div class="row-fluid">
                <div id="myCarousel" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="item">
                            <center>
                                <img style="height: 370px;" src="${STATIC_ROOT}/image/banner1.png" alt="">
                            </center>
                            <div class="carousel-caption">
                                <h4></h4>
                                <p></p>
                            </div>
                        </div>
                        <div class="item active">
                            <center>
                                <img style="height: 350px;" src="${STATIC_ROOT}/image/banner2.png" alt="">
                            </center>
                            <div class="carousel-caption">
                                <h4></h4>
                                <p></p>
                            </div>
                        </div>
                        <div class="item">
                            <center>
                                <img style="height: 350px;" src="${STATIC_ROOT}/image/banner3.png" alt="">
                            </center>
                            <div class="carousel-caption">
                                <h4></h4>
                                <p></p>
                            </div>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                        <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                    </ol>
                </div>

            </div>

        </div>

        <div class="row-fluid">

            <div class="span5 rounded box-shadow">
                <h2 class="presentation-box-heading">
                    <i class="icon-user"></i>大家在卖
                </h2>

                <div class="row-fluid">
                    <div class="inner-content">
                        <div class="list_gq">
                            <ul class="listview image">
                                <c:forEach var="item" items="${overheadPage.list}">
                                    <c:if test="${item.overheadType != '3' }">
                                        <li>
                                            <div class="icon">
                                                <img src="${pageContext.request.contextPath}/image.html?id=${item.product.ids[0]}">
                                            </div>
                                            <div class="data">
                                                <h4>${item.product.productName}</h4>
                                                <p>发布日期:${item.product.dateCreated},更新日期:${item.product.lastUpdated}</p>
                                                <p>产品地址:${item.product.productAddress},产品属地:${item.product.productLocation},产品类型:${item.product.productType},产品描述:${item.product.productDesc}</p>
                                                <a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.id}" target="_blank">查看详情</a>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="span5 pull-right">
                            <a href="${pageContext.request.contextPath}/product/list.html">
                                <i class="icon icon-arrow-right"></i> 更多
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span5 rounded box-shadow">
                <h2 class="presentation-box-heading">
                    <i class="icon-camera"></i>大家想买
                </h2>

                <div class="row-fluid">
                    <div class="inner-content">
                        <div class="list_gq">
                            <ul class="listview image">

                                <c:forEach var="item" items="${overheadPage.list}">
                                    <c:if test="${item.overheadType == '3' }">
                                        <li>
                                            <div class="icon">
                                                <img src="${pageContext.request.contextPath}/image.html?id=${item.purchase.ids[0]}">
                                            </div>
                                            <div class="data">
                                                <h4>${item.purchase.purchaseName}</h4>
                                                <p>发布日期:${item.purchase.dateCreated},更新日期:${item.purchase.lastUpdated}</p>
                                                <p>产品地址:${item.purchase.purchaseAddress},产品属地:${item.purchase.purchaseLocation},产品类型:${item.purchase.purchaseType},产品描述:${item.purchase.purchaseDesc}</p>
                                                <a href="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.purchase.id}" target="_blank">查看详情</a>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>

                            </ul>
                        </div>
                        <div class="span5 pull-right">
                            <a href="${pageContext.request.contextPath}/purchase/list.html">
                                <i class="icon icon-arrow-right"></i> 更多
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="span2 box-shadow rounded">

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

        <div class="alert alert-success">
            <center>
                掌畅水产品交易平台欢迎您 <strong><a href="#" class="alert-success-link">点击参与</a> </strong>
            </center>
        </div>

    </div>



    <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
