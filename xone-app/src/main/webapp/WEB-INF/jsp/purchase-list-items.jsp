<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${mapValue['ITEM_TOO_LONG'] == 'YES' }">
		<li class="itemtoolong" data-role="list-divider">
			<div style="margin-top:10px;">
				<p style="text-overflow:ellipsis;">列表长度太长，更多详情请前身官方网站上查询</p>
			</div>
		</li>
	</c:when>
	<c:otherwise>
		<c:forEach var="item" items="${list}">
		<li class="purchasedatecreateditem" timestamp="<fmt:formatDate value="${item.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>">
			<a href="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.id}" style="padding-right:10px;padding-top:2px;padding-bottom:3px;padding-left:85px;">
			    <p class="ui-li-aside" style="margin:0px;padding:0px;width:90%;"><fmt:formatDate value="${item.lastUpdated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></p>
				<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item.ids[0]}" style="margin-right:2px;" class="purchaseliimage"/>
				<div style="margin-top:10px;text-overflow:ellipsis;">${item.purchaseName}</div>
			    <div style="margin-top:8px;">
				    <p>No.${item.id},类型：${item.purchaseTypeName},属地：${item.purchaseLocation},发布日期<fmt:formatDate value="${item.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></p>
				    <p>${item.purchaseDesc}</p>
			    </div>
			</a>
		</li>
		</c:forEach>
	</c:otherwise>
</c:choose>