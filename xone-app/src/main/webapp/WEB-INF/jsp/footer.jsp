<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div data-id="myfooter" data-role="footer" data-position="fixed" data-tap-toggle="false">
	<div data-role="navbar" data-iconpos="top">
		<ul>  
			<li><a href="${pageContext.request.contextPath}/product/index.html" data-icon="sale-24" <c:if test="${param.offset == '1'}">class="ui-btn-active ui-state-persist"</c:if>>大家在卖</a></li>  
			<li><a href="${pageContext.request.contextPath}/purchase/index.html" data-icon="buy-24" <c:if test="${param.offset == '2'}">class="ui-btn-active ui-state-persist"</c:if>>大家想买</a></li>
			<li><a href="${pageContext.request.contextPath}/assistant/index.html" data-icon="asst-24" <c:if test="${param.offset == '3'}">class="ui-btn-active ui-state-persist"</c:if>>我的秘书</a></li>
			<li><a href="${pageContext.request.contextPath}/login/main.html" data-icon="user-24" <c:if test="${param.offset == '4'}">class="ui-btn-active ui-state-persist"</c:if>>用户中心</a></li>
		</ul>
	</div>
</div>
