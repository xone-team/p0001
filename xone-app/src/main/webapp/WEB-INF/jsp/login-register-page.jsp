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
	<div data-role="page" class="login-register-page">
		<link rel="stylesheet" href="${STATIC_ROOT}/bootstrap/css/bootstrap.min.css" />
		<style type="text/css">
			td.mylabel {
				width:80px;
				text-align:right;
				padding-right:5px;
			}
		</style>
		<div data-id="myheader" data-role="header" data-tap-toggle="false" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/login/index.html?_=${identify}" data-icon="check" class="btn-banner">返回</a>
			<h1>用户注册</h1>
			<a href="${pageContext.request.contextPath}/login/indexRegister.html?_=${identify}" data-icon="refresh">刷新</a>
			<div class="ui-mybanner">此处是广告位</div>
		</div>
		<div data-role="content">
			<div class="alert alert-error">shit!</div>
			<div class="alert alert-success">Well done.</div>
			<form method="post" action="${pageContext.request.contextPath}/login/register.html?_=${identify}">
				<ul data-role="listview" data-inset="true" data-mini="true">
					<li data-role="list-divider">注册用户信息</li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">用户名:</td>
				    			<td><input type="text" name="person.username" placeholder="用户名，推荐手机号码" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">手　机:</td>
				    			<td><input type="text" name="person.cellphone" placeholder="您的手机号码" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">联系人:</td>
				    			<td><input type="text" name="person.contactor" placeholder="联系人称呼" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">QQ:</td>
				    			<td><input type="text" name="person.qq" placeholder="QQ号码" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">邮　箱:</td>
				    			<td><input type="text" name="person.email" placeholder="E-mail邮箱" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">地　址:</td>
				    			<td><input type="text" name="person.address" placeholder="联系地址" data-mini="true" value="" autocomplete="off"/></td>
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
				    			<td><input type="text" name="person.repassword" placeholder="再次确认一下密码" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<label for="flip-5">我已经阅读条款，对于以上条款我选择</label>
					    <select name="flip-5" id="flip-5" data-role="slider">
					        <option value="off">不同意</option>
					        <option value="on">同意</option>
					    </select>
				    </li>
				    <li><input type="submit" value="注册用户" data-theme="e"/></li>
				</ul>
			</form>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="4" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
