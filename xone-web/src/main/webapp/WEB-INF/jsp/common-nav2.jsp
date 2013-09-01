<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="navbar navbar-fixed-top mynavheaderbar">
	<div class="navbar-inner">
		<div class="container mynavheaderbar">
			<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
			</button>
<!-- 				<a class="brand" href="#">掌畅软件</a> -->
			<div class="nav-collapse collapse navbar">
				<ul class="nav">
					<li class="<c:if test="${param.offset == '1'}">active</c:if> mynav"><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
					<li class="<c:if test="${param.offset == '2'}">active</c:if> mynav"><a href="${pageContext.request.contextPath}/product/list.html">售卖</a></li>
					<li class="<c:if test="${param.offset == '3'}">active</c:if> mynav"><a href="${pageContext.request.contextPath}/purchase/list.html">购买</a></li>
					<li class="<c:if test="${param.offset == '4'}">active</c:if> mynav"><a href="${pageContext.request.contextPath}/about.html">关于</a></li>
					<c:choose>
					<c:when test="${not empty userMap}">
						<li class="<c:if test="${param.offset == '5'}">active</c:if> dropdown mynav">
							<a href="${pageContext.request.contextPath}/admin/welcome.html" class="dropdown-toggle" data-toggle="dropdown">用户中心 <b class="caret"></b></a>
							<ul class="dropdown-menu" style="text-align:left;">
								<li><a href="">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="nav-header">Nav header</li>
								<li><a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a></li>
								<li><a href="#">用户名：${username}</a></li>
								<li><a href="<c:url value="/j_spring_security_logout"/>" style="margin-left:5px;">退出登录</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
					<li class="dropdown mynav">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">用户登录 <b class="caret"></b></a>
						<ul class="dropdown-menu" style="text-align:left;">
							<li class="nav-header">
								<form class="navbar-form form-horizontal navloginform" method="post" action="${pageContext.request.contextPath}/j_spring_security_check">
									<div class="span2">
										<input class="span2" type="text" value="" name="username" placeholder="用户名">
									</div>
									<div class="span2"">
										<input class="span2" type="password" value="h" name="password" placeholder="密码">
									</div>
									<div class="span2" style="text-align:right;">
										<button type="submit" class="btn">登录</button>
									</div>
								</form>
							</li>
						</ul>
					</li>
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>
