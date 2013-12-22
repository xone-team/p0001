<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<ul>
    <c:forEach var="item" items="${overheadPage.list}">
        <li><a href="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.purchase.id}" target="_blank">${item.purchase.purchaseName}</a></li>
    </c:forEach>
</ul>