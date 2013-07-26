<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib" %>
<c:set var="myidentify" value="${identify}" />
<div class="productbacklist${myidentify}">
<style>
<!--
table.myqueryform {
	width:100%;
}
table.myqueryform td {
	padding:0px 3px 0px 3px;
	vertical-align:middle;
}
table.myqueryform td.mytext {
	width:100px;
	text-align:right;
}
table.myproductlisttable {
	width:100%;
	table-layout:fixed;
}
table.myproductlisttable td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
-->
</style>
<form id="myqueryform${myidentify}" action="${pageContext.request.contextPath}/product/productListAjax.html" method="get">
	<table class="table table-bordered myqueryform">
		<tr>
			<td class="mytext">产品编号</td><td><input type="text" name="product.id"  value="${product.id}"  maxlength="19" placeholder="产品编号"></td>
			<td class="mytext">产品名称</td><td><input type="text" name="product.productName"  value="${product.productName}"  maxlength="255" placeholder="产品名称"></td>
		</tr>
		<tr>
			<td class="mytext">产品类型</td><td><input type="text" name="product.productType"  value="${product.productType}"  maxlength="255" placeholder="产品类型"></td>
			<td class="mytext">销售类型</td><td><input type="text" name="product.saleType"  value="${product.saleType}"  maxlength="255" placeholder="销售类型"></td>
		</tr>
		<tr>
			<td class="mytext">产品产地</td><td><input type="text" name="product.productAddress"  value="${product.productAddress}"  maxlength="255" placeholder="产品产地"></td>
			<td class="mytext">产品属地</td><td><input type="text" name="product.productLocation"  value="${product.productLocation}"  maxlength="255" placeholder="产品属地"></td>
		</tr>
		<tr>
			<td colspan="4" style="padding-top:4px;">
				<p class="text-right">
					<button class="btn btn-small productbacklistbutton">
						<span class="icon-search"></span>查询
					</button>
				</p>
			</td>
		</tr>
	</table>
</form>
<div>
	<table class="table table-bordered myproductlisttable" style="width:100%">
		<thead>
			<th>编号</th>
			<th>产品名称</th>
			<th>产品类型</th>
			<th>销售类型</th>
			<th>有效期</th>
			<th>产品产地</th>
			<th>产品属地</th>
			<th>更新时间</th>
			<th>操作</th>
		</thead>
		<tbody>
		<c:forEach var="item" items="${pagination.list}">
		<tr>
			<td title="${item.id}"><a href="${pageContext.request.contextPath}/product/productItem.html?product.id=${item.id}" target="_blank">${item.id}</a></td>
			<td title="${item.productName}">${item.productName}</td>
			<td title="${item.productType}">${item.productType}</td>
			<td title="${item.saleType}">${item.saleType}</td>
			<td title="${item.productValid}"><fmt:formatDate value="${item.productValid}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td title="${item.productAddress}">${item.productAddress}</td>
			<td title="${item.productLocation}">${item.productLocation}</td>
			<td title="${item.lastUpdated}"><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td>
				<a href="#" class="btn btn-mini productselectinfo" attr-id="${item.id}">选择</a>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<x:page href="${pageContext.request.contextPath}/product/productListAjax.html" pagination="${pagination}"/>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$('#myqueryform${myidentify}').find('input').css({
		width: '90%',
		marginBottom: '0px'
	});
	$('button.productbacklistbutton').on('click', function(e) {
		$.ajax({
			type: 'get',
			url: $('#myqueryform${myidentify}').attr('action'),
			data: $('#myqueryform${myidentify}').serialize(),
			success: function(html) {
				var parent = $('div.productbacklist${myidentify}').parent();
				$('div.productbacklist${myidentify}').remove();
				parent.append(html);
			}
		});
		return false;
	});
	$('div.productbacklist${myidentify} .pagination a').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			type: 'get',
			url: $(this).attr('href'),
			success: function(html) {
				var parent = $('div.productbacklist${myidentify}').parent();
				$('div.productbacklist${myidentify}').remove();
				parent.append(html);
			}
		});
		return false;
	});
});
</script>
