<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="item" items="${list}">
<li class="subscribedatecreateditem" timestamp="${item.dateCreated}">
	<a href="${pageContext.request.contextPath}/subscribe/item.html?subscribe.id=${item.id}&from=items">
		<h4>${item.productNameKey}</h4>
		<p>${item.marketarea},${item.saleType},${item.credit},${item.dateCreated}</p>
	</a>
</li>
</c:forEach>