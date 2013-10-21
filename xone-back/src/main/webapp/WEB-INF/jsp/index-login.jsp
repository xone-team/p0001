<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>后台</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="common-header.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common-nav.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="row-fluid" id="X_bodyContainer">
            <c:if test="${errorType == 1 }">
            <div class="alert alert-fail">
                <center>您没有权限访问该资源</center>
            </div>
            </c:if>
            <div class="hero-unit">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
                    <div class="control-group">
                        <label class="control-label" for="text-username">用户名</label>
                        <div class="controls">
                            <input type="text" name="username" id="text-username" value="" autocomplete="off" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="text-password">密 码</label>
                        <div class="controls">
                            <input type="password" name="password" id="text-password" value="" autocomplete="off" />
                        </div>
                    </div>
	                <div class="control-group">
	                    <label class="control-label" for="validateCode">验证码</label>
	                    <div class="controls">
	                    	<input type="text" name="validateCode" id="validateCode" value="" autocomplete="off" />
	                    </div>
	                </div>
	                <div class="control-group">
	                    <div class="controls">
	                    	<img class="myIdentifyCodeImg" src="${pageContext.request.contextPath}/identifyCode.jpeg?_=${identify}">
	                    	<a class="myIdentifyCodeHref" href="#" class="btn">换一张</a>
	                    </div>
	                </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn">确认登录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
    <script type="text/javascript">
		$(document).ready(function() {
			$('a.myIdentifyCodeHref').click(function(e) {
				e.preventDefault();
				$('img.myIdentifyCodeImg').attr('src', '${pageContext.request.contextPath}/identifyCode.jpeg?_=' + new Date().getTime());
			});
		});
        </script>
</html>
