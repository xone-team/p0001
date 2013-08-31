<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib" %>
<c:set var="myidentify" value="${identify}" />
<div class="rolesbacklist${myidentify}">
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
table.myroleslisttable {
	width:100%;
	table-layout:fixed;
}
table.myroleslisttable td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
-->
</style>
<form id="myqueryform${myidentify}" action="${pageContext.request.contextPath}/roles/rolesCheck.html" method="get">
	<table class="table table-bordered myqueryform">
		<tr>
			<td class="mytext">名称</td><td><input type="text" name="roles.name"  value="${roles.name}"  maxlength="255" placeholder="名称"></td>
			<td class="mytext">备注</td><td><input type="text" name="roles.remark"  value="${roles.remark}"  maxlength="255" placeholder="备注"></td>
		</tr>
		<tr>
			<td colspan="4" style="padding-top:4px;">
				<p class="text-right">
					<button class="btn btn-small rolescheckselectbutton">
						<span class="icon-filter"></span>选择
					</button>
					<button class="btn btn-small rolesbacklistbutton">
						<span class="icon-search"></span>查询
					</button>
				</p>
			</td>
		</tr>
	</table>
</form>
<div>
	<table class="table table-bordered myroleslisttable">
		<thead>
			<th>编号</th>
			<th>名称</th>
			<th>备注</th>
			<th style="width: 4em;">操作</th>
		</thead>
		<tbody>
		<c:forEach var="item" items="${list}">
		<tr>
			<td title="${item.id}">${item.id}</td>
			<td title="${item.name}">${item.name}</td>
			<td title="${item.remark}">${item.remark}</td>
			<td>
				<input type="checkbox" attr-id="${item.id}" attr-name="${item.name}" class="btn btn-mini rolescheck" />
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$('#myqueryform${myidentify}').find('input').css({
		width: '90%',
		marginBottom: '0px'
	});
	$('button.rolesbacklistbutton').on('click', function(e) {
		$.ajax({
			type: 'get',
			url: $('#myqueryform${myidentify}').attr('action'),
			data: $('#myqueryform${myidentify}').serialize(),
			success: function(html) {
				var parent = $('div.rolesbacklist${myidentify}').parent();
				$('div.rolesbacklist${myidentify}').remove();
				parent.append(html);
			}
		});
		return false;
	});
});
</script>
</div>