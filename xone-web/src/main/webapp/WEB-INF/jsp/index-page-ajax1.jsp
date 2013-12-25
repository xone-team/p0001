<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<ul class="home-list" style="padding: 10px; width: 480px;">
    <c:forEach var="item" items="${productPage.list}">
        <c:if test="${item.saleType == '1' }">
            <li><span><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd" /></span> <a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.id}" target="_blank">${item.productName}</a></li>
        </c:if>
    </c:forEach>
</ul>
