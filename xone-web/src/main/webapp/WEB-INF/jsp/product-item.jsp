<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>欢迎使用</title>
<jsp:include page="common-header-no-bootstrap.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common-nav.jsp"><jsp:param value="2" name="offset" /></jsp:include>

    <!--主体-->
    <div id="container">

        <!--位置导航-->
        <div class="wzdh">首页&nbsp;&gt;&nbsp;信息展示</div>
        <!--位置导航 end-->

        <!--左侧-->
        <div class="detail">

            <div class="detail-title">
                <h2>${product.productName}</h2>
            </div>
            <div class="detail-info">发布日期：${product.dateCreated}</div>
            <div>
                <table width="100%" border="0" cellspacing="1" cellpadding="6" class="tab">
                    <tr>
                        <td width="20%" class="t1">产品类型</td>
                        <td width="30%" class="t2">${product.productTypeName}</td>
                        <td width="20%" class="t1">产品产地</td>
                        <td class="t2">${product.productAddress}</td>
                    </tr>
                    <tr>
                        <td class="t1">产品属地</td>
                        <td class="t2">${product.productLocation}</td>
                        <td class="t1">产品价格</td>
                        <td class="t2">${product.productPrice}</td>
                    </tr>
                    <tr>
                        <td class="t1">数 量</td>
                        <td class="t2" colspan="3">${product.productNum}</td>
                    </tr>
                </table>

            </div>
            <div class="wen">
                <p>
                    <span class="b f14">描述：</span><br /> ${product.productDesc}
                </p>

            </div>
            <c:forEach var="item" items="${product.ids}">
                <div class="img_pic">
                    <img src="${pageContext.request.contextPath}/image.html?id=${item}" width="775" height="454" />
                </div>
            </c:forEach>
        </div>
        <!--左侧 end-->

    </div>
    <!--主体结束-->

    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
