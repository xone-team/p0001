<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib" %>
<c:set var="myidentify" value="${identify}" />
<div class="purchasebacklist${myidentify}">
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
table.mypurchaselisttable {
	width:100%;
	table-layout:fixed;
}
table.mypurchaselisttable td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
-->
</style>
<form id="myqueryform${myidentify}" action="${pageContext.request.contextPath}/purchase/purchaseListAjax.html" method="get">
	<table class="table table-bordered myqueryform">
		<tr>
			<td class="mytext">产品编号</td><td><input type="text" name="purchase.id"  value="${purchase.id}"  maxlength="19" placeholder="产品编号"></td>
			<td class="mytext">产品名称</td><td><input type="text" name="purchase.purchaseName"  value="${purchase.purchaseName}"  maxlength="255" placeholder="产品名称"></td>
		</tr>
		<tr>
			<td class="mytext">产品类型</td><td><input type="text" name="purchase.purchaseType"  value="${purchase.purchaseType}"  maxlength="255" placeholder="产品类型"></td>
			<td class="mytext">产品产地</td><td><input type="text" name="purchase.purchaseAddress"  value="${purchase.purchaseAddress}"  maxlength="255" placeholder="产品产地"></td>
		</tr>
		<tr>
			<td class="mytext">产品属地</td><td><input type="text" name="purchase.purchaseLocation"  value="${purchase.purchaseLocation}"  maxlength="255" placeholder="产品属地"></td>
			<td colspan="2" style="padding-top:4px;">
				<p class="text-right">
					<button class="btn btn-small purchasebacklistbutton">
						<span class="icon-search"></span>查询
					</button>
				</p>
			</td>
		</tr>
	</table>
</form>
<div>
	<table class="table table-bordered mypurchaselisttable" style="width:100%">
		<thead>
			<th>编号</th>
			<th>产品名称</th>
			<th>产品类型</th>
			<th>有效期</th>
			<th>产品产地</th>
			<th>产品属地</th>
			<th>更新时间</th>
			<th style="width: 4em;">操作</th>
		</thead>
		<tbody>
		<c:forEach var="item" items="${pagination.list}">
		<tr>
			<td title="${item.id}"><a href="${pageContext.request.contextPath}/purchase/purchaseItem.html?purchase.id=${item.id}" target="_blank">${item.id}</a></td>
			<td title="${item.purchaseName}">${item.purchaseName}</td>
			<td title="${item.purchaseType}">${item.purchaseType}</td>
			<td title="${item.purchaseValid}"><fmt:formatDate value="${item.purchaseValid}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td title="${item.purchaseAddress}">${item.purchaseAddress}</td>
			<td title="${item.purchaseLocation}">${item.purchaseLocation}</td>
			<td title="${item.lastUpdated}"><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td>
				<a href="#" class="btn btn-mini purchaseselectinfo" attr-id="${item.id}">选择</a>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<x:page href="${pageContext.request.contextPath}/purchase/purchaseListAjax.html" pagination="${pagination}"/>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$('#myqueryform${myidentify}').find('input').css({
		width: '90%',
		marginBottom: '0px'
	});
	$('button.purchasebacklistbutton').on('click', function(e) {
		$.ajax({
			type: 'get',
			url: $('#myqueryform${myidentify}').attr('action'),
			data: $('#myqueryform${myidentify}').serialize(),
			success: function(html) {
				var parent = $('div.purchasebacklist${myidentify}').parent();
				$('div.purchasebacklist${myidentify}').remove();
				parent.append(html);
			}
		});
		return false;
	});
	$('div.purchasebacklist${myidentify} .pagination a').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			type: 'get',
			url: $(this).attr('href'),
			success: function(html) {
				var parent = $('div.purchasebacklist${myidentify}').parent();
				$('div.purchasebacklist${myidentify}').remove();
				parent.append(html);
			}
		});
		return false;
	});
});
</script>
