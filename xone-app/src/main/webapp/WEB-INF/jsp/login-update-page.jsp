<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="login-update-page" data-dom-cache="false">
		<style type="text/css">
			td.mylabel {
				width:80px;
				text-align:right;
				padding-right:5px;
			}
		</style>
		<div data-id="myheader" data-role="header" data-tap-toggle="false" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/login/index.html?_=${identify}" data-icon="check" class="btn-banner">返回</a>
			<h1>用户更新</h1>
			<a href="${pageContext.request.contextPath}/login/indexUpdate.html?_=${identify}" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content">
			<c:if test="${!(empty mapValue)}">
				<div data-role="popup" class="login-update-popup-page" data-overlay-theme="a" data-shadow="false">
					<a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					<span class="error ui-btn-inner">${mapValue['msg']}</span>
				</div>
				<script type="text/javascript">
					$(document).delegate('div.login-update-page', 'pageinit', function() {
						if (!$('div.login-update-popup-page').data('init')) {
							$('div.login-update-popup-page').popup();
							$('div.login-update-popup-page').data('init', true);
						}
					});
				</script>
			</c:if>
			<form method="POST" action="${pageContext.request.contextPath}/login/update.html?_=${identify}">
				<ul data-role="listview" data-inset="true" data-mini="true">
					<li data-role="list-divider">更新用户信息</li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">用户名:</td>
				    			<td><input type="text" name="person.username" placeholder="用户名，推荐手机号码" readonly data-mini="true" value="${person.username}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">手　机:</td>
				    			<td><input type="text" name="person.cellphone" placeholder="您的手机号码" data-mini="true" value="${person.cellphone}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">昵　称:</td>
				    			<td><input type="text" name="person.nickName" placeholder="昵称" data-mini="true" value="${person.nickName}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">联系人:</td>
				    			<td><input type="text" name="person.contactor" placeholder="联系人称呼" data-mini="true" value="${person.contactor}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">QQ:</td>
				    			<td><input type="text" name="person.qq" placeholder="QQ号码" data-mini="true" value="${person.qq}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">邮　箱:</td>
				    			<td><input type="email" name="person.email" placeholder="E-mail邮箱" data-mini="true" value="${person.email}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">地　址:</td>
				    			<td><input type="text" name="person.address" placeholder="联系地址" data-mini="true" value="${person.address}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">密　码:</td>
				    			<td><input type="password" name="person.password" placeholder="您的密码" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">确认密码:</td>
				    			<td><input type="password" name="person.repassword" placeholder="再次确认一下密码" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li><input type="submit" value="更新用户" data-theme="e"/></li>
				</ul>
			</form>
			<script type="text/javascript">
				$('div.login-update-page').bind('pageshow', function() {
					$('div.login-update-popup-page').css({
						width: ($('div.login-update-page').width() - 30) + 'px'
					}).popup('open');
				});
			</script>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="4" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
