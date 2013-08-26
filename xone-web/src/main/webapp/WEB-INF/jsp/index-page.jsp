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
<jsp:include page="common-header.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common-nav.jsp"><jsp:param value="1" name="offset" /></jsp:include>
    <div class="container">
        <div class="hero-unit box-shadow">
            <div class="row-fluid">
                <div id="myCarousel" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="item">
                            <center>
                                <img style="height: 350px;" src="${STATIC_ROOT}/image/banner1.jpg" alt="">
                            </center>
                            <div class="carousel-caption">
                                <h4>广东中山罗氏沼虾苗价350元/万尾</h4>
                                <p>从广东省中山市港口、横栏、西区等罗氏沼虾主养镇区获悉，今春罗氏沼虾市场供应正常，苗量充裕，苗价卖到350元/万尾，目前棚虾已投苗90%。业内人士称，苗价不会出现去年高达500元/万尾</p>
                            </div>
                        </div>
                        <div class="item active">
                            <center>
                                <img style="height: 350px;" src="${STATIC_ROOT}/image/banner2.jpg" alt="">
                            </center>
                            <div class="carousel-caption">
                                <h4>罗氏沼虾苗</h4>
                                <p>笔者来到西区沙朗，走访长年经销罗氏沼虾苗的梁忠善。“一切不像市面上传说的那样，说浙江、湛江苗种场受水质、空气污染，病毒多，产量低，苗种紧缺，供应紧张</p>
                            </div>
                        </div>
                        <div class="item">
                            <center>
                                <img style="height: 350px;" src="${STATIC_ROOT}/image/banner4.jpg" alt="">
                            </center>
                            <div class="carousel-caption">
                                <h4>港口、沙朗等地的虾农就开始购苗养棚虾</h4>
                                <p>今投苗已达九成；剩下的白水虾塘清明前后才放苗，未投苗虾塘面积仅剩1/3。棚虾等开塘后适当补补苗即可</p>
                            </div>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                    </ol>
                </div>

            </div>

        </div>

        <div class="row-fluid">

            <div class="span5 rounded box-shadow">
                <h2 class="presentation-box-heading">
                    <i class="icon-user"></i>售卖
                </h2>

                <div class="row-fluid">
                    <div class="inner-content">
                        <div class="list_gq">
                            <ul>
                                <c:forEach var="item" items="${overheadPage.list}">
                                    <c:if test="${item.overheadType != '3' }">
                                    <li><span class="txt_date">[<fmt:formatDate value="${item.product.dateApply}" pattern="MM-dd" />]
                                    </span><span class="gq">供</span> <a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.product.id}"> ${item.product.productName}</a></li>
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
                    <i class="icon-camera"></i>求购
                </h2>

                <div class="row-fluid">
                    <div class="inner-content">
                        <div class="list_gq">
                            <ul>

                                <c:forEach var="item" items="${overheadPage.list}">
                                <c:if test="${item.overheadType == '3' }">
                                    <li><span class="txt_date">[<fmt:formatDate value="${item.purchase.dateApply}" pattern="MM-dd" />]
                                    </span><span class="gq">供</span> <a href="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.purchase.id}"> ${item.purchase.purchaseName}</a></li>
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
                恒鑫水产品交易平台欢迎您 <strong><a href="#" class="alert-success-link">点击参与</a> </strong>
            </center>
        </div>

    </div>



    <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
