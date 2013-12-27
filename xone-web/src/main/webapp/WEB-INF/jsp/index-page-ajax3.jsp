<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<ul>
    <c:forEach var="item" items="${productPage.list}">
        <li>
            <p class="sell_pic">
                <a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.id}">
                    <img src="${pageContext.request.contextPath}/image.html?id=${item.ids[0]}" width="100" height="100" border="0">
                </a>
            </p>
            <dl>
                <dt>${item.productName}</dt>
                <dd>
                    发布日期:
                    <fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd" />
                </dd>
                <p>
                    类型：${item.productTypeName}&nbsp;&nbsp;产地：${item.productAddress}&nbsp;&nbsp;<br />属地：${item.productLocation}&nbsp;&nbsp;价格:${item.productPrice}
                </p>
                <a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.id}" class="more" target="_blank">查看详情</a>
            </dl>
            <div class="cl"></div>
        </li>
    </c:forEach>
</ul>
