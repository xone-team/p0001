<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品名称:</td>
			<td>${purchase.purchaseName}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品类型:</td>
			<td>${purchase.purchaseTypeName}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品产地:</td>
			<td>${purchase.purchaseAddress}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品属地:</td>
			<td>${purchase.purchaseLocation}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">数　　量:</td>
			<td>${purchase.purchaseNum}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">描　　述:</td>
			<td>${purchase.purchaseDesc}</td>
		</tr>
	</table>
</li>
<c:if test="${login}">
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">手机号码:</td>
			<td>${purchase.person.cellphone}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">联&nbsp;&nbsp;系&nbsp;&nbsp;人:</td>
			<td>${purchase.person.contactor}</td>
		</tr>
	</table>
</li>
</c:if>
<li data-role="list-divider" data-theme="e">产品图片</li>
<c:forEach var="item" items="${purchase.ids}">
<li data-role="none" style="padding:0px;">
	<div class="purchaseimage" >
		<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item}" alt="" width="100%" height="100%"/>
	</div>
</li>
</c:forEach>