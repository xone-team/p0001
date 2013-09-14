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
	<div data-role="page" class="loginmainpage${myid}" data-dom-cache="true">
		<style type="text/css">
			span.myspanstyle {
				padding-left:5px;
			}
		</style>
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-backbtn="false" data-position="fixed">
<%-- 			<a href="${pageContext.request.contextPath}/login/indexUpdate.html?_=${myid}" data-icon="check">更新</a> --%>
			<a href="${pageContext.request.contextPath}/assistant/guide.html" data-icon="home">首页</a>
			<h1>用户中心</h1>
			<a href="${pageContext.request.contextPath}/login/logout.html?_=${myid}" data-icon="check" class="login-logout${myid} ui-btn-right">注销</a>
		</div>
		<div data-role="content">
		    <div data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
		        <h3>用户信息</h3>
				<ul data-role="listview" data-inset="true">
				    <li data-icon="false"><a href="#">用户名:<span class="myspanstyle">${userMap.username}</span></a></li>
				    <li data-icon="false"><a href="#">昵　称:<span class="myspanstyle">${userMap.nickName}</span></a></li>
				    <li data-icon="false"><a href="#">手　机:<span class="myspanstyle">${userMap.cellphone}</span></a></li>
				    <li data-icon="false"><a href="#">联系人:<span class="myspanstyle">${userMap.contactor}</span></a></li>
				    <li data-icon="false"><a href="#">信　誉:<span class="myspanstyle"><c:choose><c:when test="${userMap.credit == '1'}">${userMap.creditName}</c:when><c:otherwise>未认证</c:otherwise></c:choose></span></a></li>
				    <li data-icon="false"><a href="#">级　别:<span class="myspanstyle">${userMap.userLevelName}</span></a></li>
				    <li data-icon="false"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ:<span class="myspanstyle">${userMap.qq}</span></a></li>
				    <li data-icon="false"><a href="#">邮　箱:<span class="myspanstyle">${userMap.email}</span></a></li>
				    <li data-icon="false"><a href="#">地　址:<span class="myspanstyle">${userMap.address}</span></a></li>
				    <li data-icon="false" style="padding-top:0px;padding-bottom:2px;"><div><a href="${pageContext.request.contextPath}/login/indexUpdate.html?_=${myid}" data-role="button" data-icon="edit">用户更新</a></div></li>
<%-- 				    <li data-icon="false" style="padding-top:0px;padding-bottom:2px;"><div><a href="${pageContext.request.contextPath}/login/main.html?_=${myid}" data-role="button" data-icon="refresh">信息刷新</a></div></li> --%>
				    <li data-icon="false" style="padding-top:0px;padding-bottom:2px;"><div><a href="#" onclick="window.main.loadGuideIndex();" rel="external" data-role="button" data-icon="home">软件首页</a></div></li>
<!-- 				    <li><a href="#" onclick="window.main.loadGuideIndex();" rel="external" data-icon="home">软件首页</a></li> -->
				    <li><a href="#" onclick="window.main.debug('0');" rel="external" data-icon="home">重置订阅</a></li>
				</ul>
		    </div>
			<c:set var="A_L" value="${alevelUser}"/>
			<c:set var="B_L" value="${blevelUser}"/>
			<c:set var="C_L" value="${clevelUser}"/>
			<c:if test="${A_L || B_L}">
		    <div data-role="collapsible" data-collapsed="false" data-theme="b" data-content-theme="d">
		        <h3>我的售卖发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/Accounting-Purchase-order-icon_32.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/product/listAllForUser.html?product.saleType=0&_=${myid}">查看产品发布列表</a></li>
				    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/corbeille-box-sale-v-icon_32.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/product/listAllForUser.html?product.saleType=1&_=${myid}">查看促销发布列表</a></li>
				    <c:if test="${A_L}">
				    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/blue-internet-icon_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/product/listAllForUser.html?product.saleType=2&_=${myid}">查看组团发布列表</a></li>
				    </c:if>
				</ul>
		    </div>
		    </c:if>
		    <c:if test="${C_L || B_L}">
		    <div data-role="collapsible" data-collapsed="false" data-theme="b" data-content-theme="d">
		        <h3>我的购买发布</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
				    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/3-fish-icon_32.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/purchase/listAllForUser.html?_=${myid}">查看求购发布列表</a></li>
				</ul>
		    </div>
		    </c:if>
		    <div data-role="collapsible" data-collapsed="false" data-theme="b" data-content-theme="d">
		        <h3>我的配套服务</h3>
				<ul data-role="listview" data-inset="true" data-divider-theme="d">
					<c:if test="${A_L || B_L}">
				    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/Global-Network-icon_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/delivery/listIndex.html?_=${myid}">查看物流配送列表</a></li>
				    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/Advertisements-icon_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/adbanner/list.html?_=${myid}">查看我的广告列表</a></li>
				    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/MindNode-icon_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/product/listOverheadForUser.html?_=${myid}">查看顶置申请列表</a></li>
				    </c:if>
				    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/people-rss-icon_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/subscribe/list.html?_=${myid}">查看我的订阅列表</a></li>
				    <c:if test="${C_L || B_L}">
				    <li class="ui-li-has-icon"><img src="${STATIC_ROOT}/image/shopping-icon_24.png" class="ui-li-icon ui-li-thumb"><a href="${pageContext.request.contextPath}/product/listGroupForUser.html?_=${myid}">查看组团预定列表</a></li>
				    </c:if>
				</ul>
		    </div>
		    <script type="text/javascript">
		    $('div.loginmainpage${myid}').bind('pageinit', function(e, ui) {
		    	try {
			    	$.rockRoll('${userMap.id}');
		    	} catch (e) {
		    		$.myAlert('异常：' + e.message);
		    	}
		    	$('a.login-logout${myid}').click(function(e) {
			    	try {
			    		$.rockRoll('');
			    	} catch (e) {
			    	}
			    	return true;
		    	});
		    });
		    </script>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="4" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
