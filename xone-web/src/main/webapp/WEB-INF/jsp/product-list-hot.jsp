<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach var="item" items="${ overheadPage.list }">
    <li><a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.refId}" class="a_zd" target="_blank">${ item.product.productName }</a></li>
</c:forEach>
<c:forEach var="item" items="${productPage.list}">
    <li><a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.id}">${ item.productName }</a></li>
</c:forEach>
