<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="brand" href="#">导航 »</a>
            <div class="nav-collapse collapse in" style="height: 40px;">
                <p class="navbar-text pull-right">
                    <c:choose>
                        <c:when test="${ not empty userMap}">
                            欢迎您！ <a href="#" class="navbar-link">${username}</a>
                            <a href="<c:url value="/j_spring_security_logout"/>">退出</a>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value="/console/login.html"/>">登录</a>
                        </c:otherwise>
                    </c:choose>

                </p>
                <ul class="nav">
                    <li><a href="/xone-web">首页</a></li>
                    <li class="active"><a href="<c:url value="/console/index.html"/>">后台</a></li>
                    <li><a href="/xone-web/about.html">关于</a></li>
                    <li><a href="#contact">联系</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>