<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="item" items="${list}">
<li class="purchasedatecreateditem" timestamp="${item.dateCreated}">
	<a href="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.id}" style="padding-right:10px;padding-top:1px;padding-bottom:1px;padding-left:85px;">
	    <p class="ui-li-aside" style="margin:0px;padding:0px;width:90%;"><fmt:formatDate value="${item.lastUpdated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item.ids[0]}" style="margin-right:2px;" class="purchaseliimage"/>
		<div style="margin-top:10px;text-overflow:ellipsis;">No.${item.id},${item.purchaseName}</div>
	    <div style="margin-top:8px;">
		    <p>发布日期<fmt:formatDate value="${item.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>类型：${item.purchaseType},属地：${item.purchaseLocation}</p>
		    <p>${item.purchaseDesc}</p>
	    </div>
	</a>
</li>
</c:forEach>