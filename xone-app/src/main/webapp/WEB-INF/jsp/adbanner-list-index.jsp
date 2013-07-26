<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${!(empty list)}">
<ul>
	<c:forEach var="item" items="${list}">
		<li class="ui-mybanner-link"><a href="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.adRefId}" data-role="none"><img src="${pageContext.request.contextPath}/assistant/image.html?id=${item.refId}" onload="appendImageAttr(this);"/></a></li>
	</c:forEach>
</ul>
</c:if>
