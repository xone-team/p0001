<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib" %>
<c:set var="myidentify" value="${identify}" />
<div class="userbacklist${myidentify}">
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
table.myuserlisttable {
	width:100%;
	table-layout:fixed;
}
table.myuserlisttable td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
-->
</style>
<form id="myqueryform${myidentify}" action="${pageContext.request.contextPath}/user/userListAjax.html" method="get">
	<table class="table table-bordered myqueryform">
		<tr>
			<td class="mytext">用户编号</td><td><input type="text" name="user.id"  value="${user.id}"  maxlength="255" placeholder="用户编号"></td>
			<td class="mytext">用户名</td><td><input type="text" name="user.username"  value="${user.username}"  maxlength="255" placeholder="用户名"></td>
		</tr>
		<tr>
			<td class="mytext">昵称</td><td><input type="text" name="user.nickName"  value="${user.nickName}"  maxlength="255" placeholder="昵称"></td>
			<td class="mytext">用户名</td><td><input type="text" name="user.cellphone"  value="${user.cellphone}"  maxlength="255" placeholder="手机号码"></td>
		</tr>
		<tr>
			<td class="mytext">联系人</td><td><input type="text" name="user.contactor"  value="${user.contactor}"  maxlength="255" placeholder="联系人"></td>
			<td class="mytext">QQ号码</td><td><input type="text" name="user.qq"  value="${user.qq}"  maxlength="255" placeholder="腾讯号码"></td>
		</tr>
		<tr>
			<td class="mytext">电子邮箱</td><td><input type="text" name="user.email"  value="${user.email}"  maxlength="255" placeholder="电子邮箱"></td>
			<td class="mytext">用户级别</td><td><input type="text" name="user.userLevel"  value="${user.userLevel}"  maxlength="2" placeholder="用户级别"></td>
		</tr>
		<tr>
			<td colspan="4" style="padding-top:4px;">
				<p class="text-right">
					<button class="btn btn-small userbacklistbutton">
						<span class="icon-search"></span>查询
					</button>
				</p>
			</td>
		</tr>
	</table>
</form>
<div>
	<table class="table table-bordered myuserlisttable">
		<thead>
			<th>编号</th>
			<th>名称</th>
			<th>昵称</th>
			<th>号码</th>
			<th>联系人</th>
			<th>认证</th>
			<th>级别</th>
			<th style="width: 4em;">操作</th>
		</thead>
		<tbody>
		<c:forEach var="item" items="${pagination.list}">
		<tr>
			<td title="${item.id}">${item.id}</td>
			<td title="${item.username}">${item.username}</td>
			<td title="${item.nickName}">${item.nickName}</td>
			<td title="${item.cellphone}">${item.cellphone}</td>
			<td title="${item.contactor}">${item.contactor}</td>
			<td title="${item.credit}">${item.credit}</td>
			<td title="${item.userLevel}">${item.userLevel}</td>
			<td>
				<a href="#" attr-id="${item.id}" attr-name="${item.username}" class="btn btn-mini userinfoselect">选择</a>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<x:page href="${pageContext.request.contextPath}/user/userListAjax.html" pagination="${pagination}"/>
<script type="text/javascript">
$(document).ready(function() {
	$('#myqueryform${myidentify}').find('input').css({
		width: '90%',
		marginBottom: '0px'
	});
	$('button.userbacklistbutton').on('click', function(e) {
		$.ajax({
			type: 'get',
			url: $('#myqueryform${myidentify}').attr('action'),
			data: $('#myqueryform${myidentify}').serialize(),
			success: function(html) {
				var parent = $('div.userbacklist${myidentify}').parent();
				$('div.userbacklist${myidentify}').remove();
				parent.append(html);
			}
		});
		return false;
	});
	$('div.userbacklist${myidentify} .pagination a').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			type: 'get',
			url: $(this).attr('href'),
			success: function(html) {
				var parent = $('div.userbacklist${myidentify}').parent();
				$('div.userbacklist${myidentify}').remove();
				parent.append(html);
			}
		});
		return false;
	});
});
</script>
</div>