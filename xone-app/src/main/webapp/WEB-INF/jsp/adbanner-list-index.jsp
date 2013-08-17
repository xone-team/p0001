<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${!(empty list)}">
<ul>
	<c:forEach var="item" items="${list}">
		<c:set var="href" value="#" />
		<c:choose>
			<c:when test="${item.adType == '0'}">
				<c:set var="href" value="${pageContext.request.contextPath}/product/item.html?product.id=${item.refId}" />
			</c:when>
			<c:when test="${item.adType == '1'}">
				<c:set var="href" value="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.refId}" />
			</c:when>
			<c:when test="${item.adType == '2'}">
				<c:set var="href" value="${pageContext.request.contextPath}/assisant/companyInfo.html?companyInfo.id=${item.refId}" />
			</c:when>
		</c:choose>
		<li class="ui-mybanner-link"><a href="${href}" data-role="none"><img src="${pageContext.request.contextPath}/assistant/image.html?id=${item.adRefId}" onload="appendImageAttr(this);"/></a></li>
	</c:forEach>
</ul>
</c:if>
