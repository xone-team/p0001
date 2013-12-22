<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<ul>
    <c:forEach var="item" items="${overheadPage.list}">
        <c:if test="${item.overheadType != '2' }">
            <li><img src="${pageContext.request.contextPath}/image.html?id=${item.product.ids[0]}" width="193" height="109">
                <h3>${item.product.productName}</h3>
                <dd>
                    发布日期：
                    <fmt:formatDate value="${item.product.dateCreated}" pattern="yyyy-MM-dd" />
                </dd>
                <p>
                    类型：${item.product.productType}&nbsp;&nbsp;<br />属地：${item.product.productLocation}&nbsp;&nbsp;产品地址:${item.product.productAddress}<br />产品描述:${item.product.productName}
                </p> <a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.id}" title="详细信息" target="_blank">详细信息</a></li>
        </c:if>
    </c:forEach>
</ul>
