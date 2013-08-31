<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib" %>
<c:set var="myidentify" value="${identify}" />
<div class="companyInfobacklist${myidentify}">
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
table.mycompanyInfolisttable {
	width:100%;
	table-layout:fixed;
}
table.mycompanyInfolisttable td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
-->
</style>
<form id="myqueryform${myidentify}" action="${pageContext.request.contextPath}/companyinfo/companyInfoListAjax.html" method="get">
	<table class="table table-bordered myqueryform">
		<tr>
			<td class="mytext">公司编号</td><td><input type="text" name="companyInfo.id"  value="${companyInfo.id}"  maxlength="19" placeholder="产品编号"></td>
			<td class="mytext">公司名称</td><td><input type="text" name="companyInfo.name"  value="${companyInfo.name}"  maxlength="255" placeholder="产品名称"></td>
		</tr>
		<tr>
			<td class="mytext">联系电话</td><td><input type="text" name="companyInfo.tel"  value="${companyInfo.tel}"  maxlength="255" placeholder="产品类型"></td>
			<td class="mytext">移动电话</td><td><input type="text" name="companyInfo.mobile"  value="${companyInfo.mobile}"  maxlength="255" placeholder="产品产地"></td>
		</tr>
		<tr>
			<td class="mytext">联系人</td><td><input type="text" name="companyInfo.contact"  value="${companyInfo.contact}"  maxlength="255" placeholder="产品属地"></td>
			<td colspan="2" style="padding-top:4px;">
				<p class="text-right">
					<button class="btn btn-small companyInfobacklistbutton">
						<span class="icon-search"></span>查询
					</button>
				</p>
			</td>
		</tr>
	</table>
</form>
<div>
	<table class="table table-bordered mycompanyInfolisttable" style="width:100%">
		<thead>
			<th>编号</th>
			<th>公司名称</th>
			<th>联系电话</th>
			<th>移动电话</th>
			<th>联系人</th>
			<th>更新时间</th>
			<th style="width: 4em;">操作</th>
		</thead>
		<tbody>
		<c:forEach var="item" items="${pagination.list}">
		<tr>
			<td title="${item.id}"><a href="${pageContext.request.contextPath}/companyinfo/companyInfoItem.html?companyInfo.id=${item.id}" target="_blank">${item.id}</a></td>
			<td title="${item.name}">${item.name}</td>
			<td title="${item.tel}">${item.tel}</td>
			<td title="${item.mobile}">${item.mobile}</td>
			<td title="${item.contact}">${item.contact}</td>
			<td title="${item.lastUpdated}"><fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td>
				<a href="#" class="btn btn-mini companyInfoselectinfo" attr-id="${item.id}">选择</a>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<x:page href="${pageContext.request.contextPath}/companyinfo/companyInfoListAjax.html" pagination="${pagination}"/>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$('#myqueryform${myidentify}').find('input').css({
		width: '90%',
		marginBottom: '0px'
	});
	$('button.companyInfobacklistbutton').on('click', function(e) {
		$.ajax({
			type: 'get',
			url: $('#myqueryform${myidentify}').attr('action'),
			data: $('#myqueryform${myidentify}').serialize(),
			success: function(html) {
				var parent = $('div.companyInfobacklist${myidentify}').parent();
				$('div.companyInfobacklist${myidentify}').remove();
				parent.append(html);
			}
		});
		return false;
	});
	$('div.companyInfobacklist${myidentify} .pagination a').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			type: 'get',
			url: $(this).attr('href'),
			success: function(html) {
				var parent = $('div.companyInfobacklist${myidentify}').parent();
				$('div.companyInfobacklist${myidentify}').remove();
				parent.append(html);
			}
		});
		return false;
	});
});
</script>
