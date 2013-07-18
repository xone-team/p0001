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
	<div data-role="page" class="subscribe-add-page" data-dom-cache="false">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/assistant/index.html?_=${identify}" data-icon="check">返回</a>
			<h1>筛选订阅</h1>
			<a href="#" rel="external" data-icon="check" data-role="button" class="subscribe-save-button ui-btn-right">发布</a>
		</div>
		<div class="subscribe-add-content" data-role="content" data-dom-cache="false">
			<form class="subscribe-add-form" method="post" action="${pageContext.request.contextPath}/subscribe/create.html?_=${identify}" autocomplete="off">
				<ul data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">市场区域:</td>
				    			<td><input type="text" name="subscribe.marketarea" placeholder="市场区域" data-mini="true" value="市场区域" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品名称:</td>
				    			<td><input type="text" name="subscribe.productNameKey" placeholder="产品名称" data-mini="true" value="产品名称" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">销售方式:</td>
				    			<td><input type="text" name="subscribe.saleType" placeholder="销售方式" data-mini="true" value="1" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">公司信誉:</td>
				    			<td><input type="text" name="subscribe.credit" placeholder="公司信誉" data-mini="true" value="1" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
					<li>
					 	<input type="submit" value="确认发布" class="submit${identify}"/>
					</li>
				</ul>
			</form>
			<script type="text/javascript" language="javascript">
				$(document).on("pageinit", function() {
					$('div.subscribe-add-page').css({
						paddingTop : '0px'
					});
				});
				$('div.subscribe-add-page').bind('pageinit', function() {
					$('a.subscribe-save-button').click(function(e) {
						e.preventDefault();
						$('form.subscribe-add-form').submit();
						return false;
					});
				});
			</script>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="3" name="offset"/></jsp:include>
	</div>
	</body>
</html>
