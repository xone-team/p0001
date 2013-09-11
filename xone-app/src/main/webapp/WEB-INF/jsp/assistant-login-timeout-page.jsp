<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head><c:set var="myid" value="${identify}" />
		<title>Login Timeout</title>
		<script type="text/javascript" language="javascript">
			var divelem = document.getElementById('login-timeout-page${myid}');
			divelem.parentElement.removeChild(divelem);
			window.location.href = '${pageContext.request.contextPath}/login/index.html';
		</script>
	</head>
	<body>
		<div data-role="page" id="login-timeout-page${myid}" class="login-timeout-page" data-dom-cache="false">
			<div data-id="myheader" class="ui-bar-b" data-role="header" data-position="fixed">
				<a href="${pageContext.request.contextPath}/login/index.html" data-icon="check">登录</a>
				<h1>请求登录</h1>
				<a href="#" class="ui-btn-right" onclick="$.makeCall('4008979727');" data-icon="grid">客服</a>
			</div>
			<div data-role="content">
				<div data-role="collapsible-set" data-theme="b" data-content-theme="c">
				    <div data-role="collapsible" data-collapsed="false">
				        <h3>请求登录</h3>
				        <p>您好，您没有登录或者您的登录超时，即将为你跳转到登录界面。</p>
				    </div>
			    </div>
				<script type="text/javascript" language="javascript">
					setTimeout(function() {
						$.mobile.changePage('${pageContext.request.contextPath}/login/index.html', {
							transition: 'slideup'
						});
					}, 2000);
				</script>
			</div>
			<jsp:include page="footer.jsp">
				<jsp:param value="4" name="offset"/>
			</jsp:include>
		</div>
	</body>
</html>
