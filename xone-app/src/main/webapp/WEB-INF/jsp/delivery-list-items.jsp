<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="item" items="${list}">
<li class="deliverydatecreateditem" timestamp="${item.dateCreated}">
	<a href="${pageContext.request.contextPath}/delivery/itemPage.html?delivery.id=${item.id}">
		<h2>${item.marketarea}</h2>
	    <p>No.${item.id},目的地：${item.determini},上货地：${item.loadaddress}</p>
	    <p>状态：${item.handleStatus}|创建日期<fmt:formatDate value="${item.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></p>
	    <p class="ui-li-aside">${item.loadtime}</p>
	</a>
</li>
</c:forEach>