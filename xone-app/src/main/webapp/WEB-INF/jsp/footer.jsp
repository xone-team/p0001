<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div data-id="myfooter" data-role="footer" data-position="fixed" data-tap-toggle="false">
	<div data-role="navbar" data-iconpos="top">
		<ul>  
			<li><a data-theme="va" href="${pageContext.request.contextPath}/assistant/guide.html" data-icon="green-24" <c:if test="${param.offset == '2'}">class="ui-btn-active ui-state-persist"</c:if>>绿色通道</a></li>
			<li><a data-theme="va" href="${pageContext.request.contextPath}/assistant/market.html" data-icon="sale-24" <c:if test="${param.offset == '1'}">class="ui-btn-active ui-state-persist"</c:if>>逛逛市场</a></li>  
			<li><a data-theme="va" href="${pageContext.request.contextPath}/assistant/index.html" data-icon="parter-24" <c:if test="${param.offset == '3'}">class="ui-btn-active ui-state-persist"</c:if>>我的伙计</a></li>
			<li><a data-theme="va" href="${pageContext.request.contextPath}/login/main.html" data-icon="user-24" <c:if test="${param.offset == '4'}">class="ui-btn-active ui-state-persist"</c:if>>用户中心</a></li>
		</ul>
	</div>
</div>
