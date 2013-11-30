<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table class="guide-page-table">
	<tbody>
		<c:forEach var="item" items="${links}" varStatus="status">
			<c:if test="${status.index % 3 == 0}"><tr></c:if>
				<c:choose>
					<c:when test="${item.linkType == 'http'}">
						<td>
							<div>
								<a href="${pageContext.request.contextPath}${item.link}" data-role="none"><img src="${STATIC_ROOT}${item.img}"></a>
							</div>
						</td>
					</c:when>
					<c:when test="${item.linkType == 'js' }">
						<td>
							<div>
								<a href="javascript:void(0)" onclick="${item.link}" data-role="none"><img src="${STATIC_ROOT}${item.img}"></a>
							</div>
						</td>
					</c:when>
					<c:when test="${item.linkType == 'add' }">
						<td>
							<div>
								<a href="${pageContext.request.contextPath}${item.link}" data-role="none"><img src="${STATIC_ROOT}/image/MORE.png"></a>
							<div>
						</td>
					</c:when>
					<c:otherwise><td></td></c:otherwise>
				</c:choose>
			<c:if test="${status.index % 3 == 2 || status.last}"></tr></c:if>
		</c:forEach>
	</tbody>
</table>
