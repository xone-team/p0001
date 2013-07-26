<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li data-role="list-divider">产品详细</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">编　　号:</td>
			<td>${product.id}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品名称:</td>
			<td>${product.productName}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品类型:</td>
			<td>${product.productType}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品产地:</td>
			<td>${product.productAddress}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品属地:</td>
			<td>${product.productLocation}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">价　　格:</td>
			<td>${product.productPrice}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">数　　量:</td>
			<td>${product.productNum}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">有&nbsp&nbsp效&nbsp&nbsp期:</td>
			<td>${product.productValid}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">描　　述:</td>
			<td>${product.productDesc}</td>
		</tr>
	</table>
</li>
<li data-role="list-divider">产品审核</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">审核时间:</td>
			<td>${product.dateApply}</td>
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
<li data-icon="edit">
	<a href="${pageContext.request.contextPath}/product/updateItem.html?product.id=${product.id}" class="productupdatebutton" data-role="button">更新信息</a>
</li>
<li data-icon="plus">
	<a href="#" data-role="button">申请顶置</a>
</li>
<li data-role="list-divider">产品图片</li>
<c:forEach var="item" items="${product.ids}">
<li data-role="none" style="padding:0px;">
	<div class="productimage" >
		<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item}" alt="" width="100%" height="100%"/>
	</div>
</li>
</c:forEach>