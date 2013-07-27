<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="subscribe-item-page" data-dom-cache="false">
		<style type="text/css">
			td.mylabel {
				width:80px;
			}
		</style>
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}<c:choose><c:when test="${param.form == 'items'}">/subscribe/list.html?_=</c:when><c:otherwise>/assistant/index.html?_=</c:otherwise></c:choose>${identify}" data-icon="check">返回</a>
			<h1>订阅详情</h1>
			<a href="${pageContext.request.contextPath}/subscribe/item.html?subscribe.id=${subscribe.id}&_=${identify}" data-icon="check" data-role="button" class="ui-btn-right">刷新</a>
		</div>
		<div class="subscribe-item-content" data-role="content" data-dom-cache="false">
			<ul data-role="listview" data-inset="true" data-mini="true">
			    <li>
			    	<table style="width:100%">
			    		<tr>
			    			<td class="mylabel">市场区域:</td>
			    			<td>${subscribe.marketarea}</td>
			    		</tr>
			    	</table>
			    </li>
			    <li>
			    	<table style="width:100%">
			    		<tr>
			    			<td class="mylabel">产品名称:</td>
			    			<td>${subscribe.productNameKey}</td>
			    		</tr>
			    	</table>
			    </li>
			    <li>
			    	<table style="width:100%">
			    		<tr>
			    			<td class="mylabel">销售方式:</td>
			    			<td>${subscribe.saleTypeName}</td>
			    		</tr>
			    	</table>
			    </li>
			    <li>
			    	<table style="width:100%">
			    		<tr>
			    			<td class="mylabel">公司信誉:</td>
			    			<td>${subscribe.creditName}</td>
			    		</tr>
			    	</table>
			    </li>
			    <li>
			    	<table style="width:100%">
			    		<tr>
			    			<td class="mylabel">创建日期:</td>
			    			<td><fmt:formatDate value="${subscribe.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			    		</tr>
			    	</table>
			    </li>
			    <li>
			    	<table style="width:100%">
			    		<tr>
			    			<td class="mylabel">更新日期:</td>
			    			<td><fmt:formatDate value="${subscribe.lastUpdated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			    		</tr>
			    	</table>
			    </li>
			    <li>
			    	<a href="${pageContext.request.contextPath}/subscribe/edit.html?subscribe.id=${subscribe.id}">编辑订阅信息</a>
			    </li>
			</ul>
			<script type="text/javascript" language="javascript">
				$(document).on("pageinit", function() {
					$('div.subscribe-item-page').css({
						paddingTop : '0px'
					});
				});
				$('div.subscribe-item-page').bind('pageinit', function() {
				});
			</script>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="3" name="offset"/></jsp:include>
	</div>
	</body>
</html>
