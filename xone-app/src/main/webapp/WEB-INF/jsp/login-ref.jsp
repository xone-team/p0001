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
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="login-ref-page" data-dom-cache="false">
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-tap-toggle="false" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/assistant/guide.html" data-icon="check">首页</a>
			<h4>用户登录</h4>
			<a href="#" class="assistant-service${myid} ui-btn-right" data-icon="grid">客服</a>
		</div>
		<div data-role="content" class="login-ref-page-content">
			<c:if test="${!(empty mapValue)}">
				<div data-role="popup" class="login-ref-popup-page" data-overlay-theme="a" data-shadow="false">
					<a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					<span class="error ui-btn-inner">${mapValue['msg']}</span>
				</div>
				<script type="text/javascript">
					$(document).delegate('div.login-ref-page', 'pageinit', function() {
						if (!$('div.login-ref-popup-page').data('init')) {
							$('div.login-ref-popup-page').popup().data('init', true);
						}
					});
				</script>
			</c:if>
			<form method="post" class="loginform${myid}" action="${pageContext.request.contextPath}/login/login.html">
				<input type="hidden" name="redirect" value="" autocomplete="off"/>
				<input type="hidden" name="_m" id="_m${myid}" value="" autocomplete="off"/>
				<ul data-role="listview" data-inset="true" data-mini="true">
<!-- 					<li data-role="list-divider"><h6>用户登录</h6></li> -->
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td style="width:60px;">用户名:</td>
				    			<td><input type="text" name="person.username" data-mini="true" id="text-username" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td style="width:60px;">密　码:</td>
				    			<td><input type="password" name="person.password" data-mini="true" id="text-password" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td><a href="${pageContext.request.contextPath}/login/indexRegister.html" data-role="button" data-theme="e">注册用户</a></td>
				    			<td><input type="submit" value="确认登录" data-theme="e"/></td>
				    		</tr>
				    	</table>
				    </li>
				</ul>
			</form>
			<script type="text/javascript">
				$('div.login-ref-page').bind('pageshow', function() {
					$('div.login-ref-popup-page').css({
						width: ($('div.login-ref-page').width() - 30) + 'px'
					}).popup('open');
					try {
						$.mloginValue(function(v) {
							$('#_m${myid}').val(v);
						});
					} catch (e) {
						$.myAlert('异常：'+ e.message);
					}
					$('form.loginform${myid}').submit(function() {
						return true;
					});
					$('div[data-role="page"]:not(.login-ref-page)').remove();
					$('a.assistant-service${myid}').click(function(e) {
						e.preventDefault();
						$.makeCall('4008979727');
						return false;
					});
				});
				$('div.login-ref-page').bind('pagehide', function(event, ui) {
				    $(event.target).remove();
				});
			</script>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="4" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
