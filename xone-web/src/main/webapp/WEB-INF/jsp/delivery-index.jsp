<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<jsp:include page="commons.jsp"></jsp:include>
		<style type="text/css">
			.mylabel {
				width:80px;
			}
		</style>
	</head>
	<body>
	<div data-role="page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<div style="width:100%;height:25px;border:1px white solid;">此处是广告位</div>
			<a href="#" data-rel="back" data-icon="check" class="btn-banner">返回</a>
			<h1>物流配送</h1>
			<a href="#" data-icon="check" class="btn-banner ui-btn-right">保存</a>
		</div>
		<div data-id="delivery${identify}" data-role="content" data-dom-cache="true">
			<form method="post" action="${pageContext.request.contextPath}/delivery/create.html" autocomplete="off">
				<input type="hidden" name="redirect" value="" autocomplete="off"/>
				<input type="submit" value="确认" data-role="none" class="ui-hidden-accessible"/>
				<ul data-role="listview" data-inset="true" data-mini="true">
					<li data-role="list-divider">填写物流信息</li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">市场区域:</td>
				    			<td><input type="text" name="username" data-mini="true" value="admin" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">目&nbsp;的&nbsp;地:</td>
				    			<td><input type="password" name="password" data-mini="true" value="hunny@admin" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">上货时间:</td>
				    			<td><input type="text" name="username" data-mini="true" value="admin" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">上货地点:</td>
				    			<td><input type="text" name="username" data-mini="true" value="admin" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">货　　量:</td>
				    			<td>
				    				<input type="text" data-role="none" name="username" style="width:40px;" value="admin" class="ui-input-text ui-body-c" autocomplete="off"/>箱
				    				<input type="text" data-role="none" name="username" style="width:40px;" value="admin" class="ui-input-text ui-body-c" autocomplete="off"/>kg/箱
				    				共<input type="text" data-role="none" name="username" style="width:40px;" value="admin" class="ui-input-text ui-body-c" autocomplete="off"/>kg　
				    				或<input type="text" data-role="none" name="username" style="width:40px;" value="admin" class="ui-input-text ui-body-c" autocomplete="off"/>kg
				    			</td>
				    		</tr>
				    	</table>
				    </li>
				</ul>
			</form>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="3" name="offset"/>
		</jsp:include>
		<script type="text/javascript">
			$(document).bind('pageinit', function() {
				$('div[data-id="delivery${identify}"]').css({
					paddingTop: '0px'
				});
				$('a.btn-banner').css({
					marginTop: '28px'
				});
			});
		</script>
	</div>
	</body>
</html>
