<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div data-id="myfooter" data-role="footer" data-position="fixed" data-tap-toggle="false">
	<div data-role="navbar" data-iconpos="left">
		<ul>  
			<li><a href="${pageContext.request.contextPath}/product/index.html?_=${identify}" data-icon="gear" <c:if test="${param.offset == '1'}">class="ui-btn-active ui-state-persist"</c:if></a>售卖</a></li>  
			<li><a href="${pageContext.request.contextPath}/purchase/index.html?_=${identify}" data-icon="refresh" <c:if test="${param.offset == '2'}">class="ui-btn-active ui-state-persist"</c:if>>购买</a></li>
			<li><a href="${pageContext.request.contextPath}/assistant/index.html?_=${identify}" data-icon="grid" <c:if test="${param.offset == '3'}">class="ui-btn-active ui-state-persist"</c:if>>助手</a></li>
			<li><a href="${pageContext.request.contextPath}/login/index.html?_=${identify}" data-icon="home" <c:if test="${param.offset == '4'}">class="ui-btn-active ui-state-persist"</c:if>>用户</a></li>
		</ul>
	</div
</div>
