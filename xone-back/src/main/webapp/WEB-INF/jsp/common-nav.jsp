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
<c:if test="${!supportBrowser}">
<div class="well well-sm">
	<div class="well well-sm" style="color:red;font-weight: bold;">您正在使用的浏览器不符合业界标准规范，继续使用可能会给本系统带来不可预料的系统错误，建议你使用以下浏览器(任选一种)</div>
	<div class="well well-sm">
		<span style="padding-right:10px;">|<a href="http://www.google.com/chrome/eula.html?hl=zh-CN" target="_blank">谷歌(Chrome)浏览器在线安装</a>|</span>
		<span style="padding-right:10px;">|<a href="http://www.google.com/chrome/eula.html?hl=zh-CN&standalone=1" target="_blank">谷歌(Chrome)离线安装包(仅 Windows可用)</a>|</span>
		<span style="padding-right:10px;">|<a href="http://www.mozilla.org/en-US/firefox/all/" target="_blank">火狐(Firefox)浏览器下载安装</a>|</span>
		<span style="padding-right:10px;">|<a href="http://safari.softonic.cn/" target="_blank">Safari浏览器(Windows)下载安装</a>|</span>
		<span style="padding-right:10px;">|<a href="http://www.opera.com/zh-cn" target="_blank">Opera浏览器下载安装</a>|</span>
	</div>
</div>
</c:if>