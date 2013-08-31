<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="item" items="${list}">
<li class="adbannerdatecreateditem" timestamp="${item.dateCreated}">
	<a href="${pageContext.request.contextPath}/adbanner/item.html?adbanner.id=${item.id}">
		<img class="adbannerliimage" src="${pageContext.request.contextPath}/assistant/image.html?id=${item.adRefId}" style="max-width:100%;max-height:100%;" alt=""/>
	</a>
</li>
</c:forEach>