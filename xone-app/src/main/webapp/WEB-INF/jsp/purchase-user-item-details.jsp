<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li data-role="list-divider">产品详细</li>
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
			<td>${purchase.purchaseType}</td>
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
			<td class="mylabel">有&nbsp&nbsp效&nbsp&nbsp期:</td>
			<td>${purchase.purchaseValid}</td>
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
<li data-role="list-divider">产品审核</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">审核时间:</td>
			<td>${purchase.dateApply}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">审核状态:</td>
			<td>审核通过</td>
		</tr>
	</table>
</li>
<li>
	<input type="button" data-icon="edit" value="更新信息" disabled="disabled"/>
</li>
<li>
	<a href="#" data-role="button" data-icon="edit" disabled="disabled">更新信息</a>
</li>
<li>
	<input type="button" data-icon="star" value="申请顶置"/>
</li>
<li data-role="list-divider">产品图片</li>
<c:forEach var="item" items="${purchase.ids}">
<li data-role="none" style="padding:0px;">
	<div class="purchaseimage" >
		<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item}" alt="" width="100%" height="100%"/>
	</div>
</li>
</c:forEach>