<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>用户中心</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="common-header.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common-nav.jsp"><jsp:param value="5" name="offset" /></jsp:include>
    <!--主体-->
    <div id="container">
        <c:if test="${errorType == 1 }">
            <div class="alert alert-fail">
                <center>您没有权限访问该资源</center>
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/j_spring_security_check" class="form" method="post">
            <div class="login">
                <div style="left: 675px; top: 70px; position: relative; width: 280px;">
                    <label>用户名</label><br />
                    <input name="username" type="text" class="input" style="width: 250px;" />
                    <br />
                    <label>密码</label><br />
                    <input name="password" type="password" class="input" style="width: 250px;" />
                    <br />
                    <label>验证码</label><br />
                    <input name="validateCode" id="validateCode" type="text" class="input" style="width: 80px;" />
                    <label style="padding-left: 5px;"><img class="myIdentifyCodeImg" src="${pageContext.request.contextPath}/identifyCode.jpeg?_=${identify}" /></label>
                    <a href="javascript:void(0);" class="myIdentifyCodeHref" style="padding-left: 5px;">刷新</a>
                    <div style="margin: 20px 0 10px 0;">
                        <input type="submit" value="登&nbsp;&nbsp;录" class="input2" style="width: 250px;" />
                    </div>
                    <div style="text-align: center;">
                        <a href="${pageContext.request.contextPath}/user/register.html">新会员免费注册</a>
                        &nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/user/register.html">忘记密码？</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--主体结束-->
    <jsp:include page="common-bottom.jsp"></jsp:include>
    <script type="text/javascript">
                    $(document).ready(function() {
                        $('form.navloginform').hide();
                        $('a.myIdentifyCodeHref').click(function(e) {
                            e.preventDefault();
                            $('img.myIdentifyCodeImg').attr('src', '${pageContext.request.contextPath}/identifyCode.jpeg?_=' + new Date().getTime());
                        });
                    });
                </script>
</body>
</html>

