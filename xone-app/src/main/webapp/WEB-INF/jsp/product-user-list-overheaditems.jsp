<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="item" items="${listOverhead}">
<li class="productdatecreateditem" timestamp="<fmt:formatDate value="${item.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>">
	<c:set var="type" value="${item.overheadType == '3'}" />
	<c:set var="key" value="${(type ?  'PUR' : 'PRO')}${item.refId}" />
	<c:set var="p" value="${mapValue[key]}" />
	<a href="${pageContext.request.contextPath}/product/overheaditemForUser.html?overhead.id=${item.id}" style="padding-right:10px;padding-top:2px;padding-bottom:3px;padding-left:85px;">
	    <p class="ui-li-aside" style="margin:0px;padding:0px;width:90%;"><fmt:formatDate value="${item.lastUpdated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></p>
	    <img src="${pageContext.request.contextPath}/assistant/image.html?id=${p.ids[0]}" style="margin-right:2px;" class="productliimage"/>
		<div style="margin-top:10px;text-overflow:ellipsis;">${(type ? p.purchaseName : p.productName)}</div>
	    <div style="margin-top:8px;">
		    <p>No.${item.id},类型:${item.overheadTypeName},
		    <span style="font-weight:bold;color:<c:choose><c:when test="${'0'== item.checkStatus}">#FCD102</c:when><c:when test="${'1'== item.checkStatus}">green</c:when><c:otherwise>red</c:otherwise></c:choose>;">状态:${item.checkStatusName}</span>
		    <p>产品编号:${item.refId}<c:if test="${not empty item.remark}">,审核备注:${item.remark}</c:if><c:if test="${not empty (type ? p.purchaseDesc : p.productDesc)}">,描述:${(type ? p.purchaseDesc : p.productDesc)}</c:if></p>
	    </div>
	</a>
</li>
</c:forEach>