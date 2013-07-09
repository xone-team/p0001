<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<jsp:include page="commons.jsp">
		</jsp:include>
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
			<form data-role="none" method="post" action="${pageContext.request.contextPath}/delivery/create.html" autocomplete="off">
				<input type="hidden" name="redirect" data-role="none" value="" autocomplete="off"/>
				<input type="submit" value="确认" data-role="none" class="ui-hidden-accessible"/>
				<ul data-role="listview" data-inset="true" data-mini="true">
					<li data-role="list-divider">填写物流信息</li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">市场区域:</td>
				    			<td><input type="text" name="username" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">目&nbsp;&nbsp;的&nbsp;&nbsp;地:</td>
				    			<td><input type="text" name="username" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">上货时间:</td>
				    			<td><input type="text" name="username" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">上货地点:</td>
				    			<td><input type="text" name="username" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li style="padding-right:0px;">
				    	<table style="width:100%">
				    		<tr>
				    			<td rowspan="3" style="border-right:1px solid gray;">货量:</td>
			    				<td style="width:40px;text-align:right;">箱数</td>
				    			<td>
				    				<input type="text" name="username" value="" autocomplete="off"/>
			    				</td>
			    				<td>
				    				<input type="text" name="username" value="" autocomplete="off"/>
			    				</td>
			    				<td style="width:50px;">kg/箱</td>
				    		</tr>
				    		<tr>
			    				<td  style="text-align:right;">总共</td>
			    				<td colspan="2">
				    				<input type="text" name="username" value="" autocomplete="off"/>
				    			</td>
			    				<td>kg</td>
				    		</tr>
				    		<tr>
			    				<td style="border-top:1px solid gray;text-align:right;">或者</td>
				    			<td colspan="2" style="border-top:1px solid gray;">
				    				<input type="text" name="username" value="" autocomplete="off"/>
				    			</td>
			    				<td style="border-top:1px solid gray;">kg</td>
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
