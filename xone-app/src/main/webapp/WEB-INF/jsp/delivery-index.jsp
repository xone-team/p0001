<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<jsp:include page="commons.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="deliverypage${identify}">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/assistant/index.html?_=${identify}" data-icon="check" class="btn-banner">返回</a>
			<h1>物流配送</h1>
			<a href="#" rel="external" data-icon="check" data-role="button" class="deliverysave ui-btn-right">保存</a>
			<div class="ui-mybanner">此处是广告位</div>
		</div>
		<div class="deliverycontent" data-role="content" data-dom-cache="false">
			<form class="deliveryform" method="post" action="${pageContext.request.contextPath}/delivery/create.html?_=${identify}" autocomplete="off">
				<input type="hidden" name="redirect" data-role="none" value="" autocomplete="off"/>
				<ul data-role="listview" data-inset="true" data-mini="true">
					<li data-role="list-divider"><h4>填写物流信息</h4></li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">市场区域:</td>
				    			<td><input type="text" name="delivery.marketarea" data-mini="true" value="MARKETAREA" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">目&nbsp;&nbsp;的&nbsp;&nbsp;地:</td>
				    			<td><input type="text" name="delivery.determini" data-mini="true" value="DETERMINI" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">上货时间:</td>
				    			<td><input type="text" name="delivery.loadtime" data-mini="true" value="2013-07-09 13:43" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">上货地点:</td>
				    			<td><input type="text" name="delivery.loadaddress" data-mini="true" value="LOADADDRESS" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li style="padding-right:0px;">
				    	<table style="width:100%">
				    		<tr>
				    			<td rowspan="3" style="border-right:1px solid gray;">货量:</td>
			    				<td style="width:40px;text-align:right;">箱数</td>
				    			<td>
				    				<input type="text" name="delivery.boxNum" value="8" autocomplete="off"/>
			    				</td>
			    				<td>
				    				<input type="text" name="delivery.unitNum" value="9" autocomplete="off"/>
			    				</td>
			    				<td style="width:50px;">kg/箱</td>
				    		</tr>
				    		<tr>
			    				<td  style="text-align:right;">总共</td>
			    				<td colspan="2">
				    				<input type="text" name="delivery.boxTotal" value="72" autocomplete="off"/>
				    			</td>
			    				<td>kg</td>
				    		</tr>
				    		<tr>
			    				<td style="border-top:1px solid gray;text-align:right;">或者</td>
				    			<td colspan="2" style="border-top:1px solid gray;">
				    				<input type="text" name="delivery.totalWeight" value="64" autocomplete="off"/>
				    			</td>
			    				<td style="border-top:1px solid gray;">kg</td>
				    		</tr>
				    	</table>
				    </li>
					<li>
					 	<input type="submit" value="确认" class="submit${identify}"/>
					</li>
				</ul>
			</form>
		</div>
		<script type="text/javascript" language="javascript">
// 			$(document).delegate('div.deliverypage${identify}', "pageinit", function() {
			$(document).on("pageinit", function() {
				$('div.ui-mybanner').html('Delivery:' + new Date().getTime());
				$('div.deliverycontent').css({
					paddingTop: '0px'
				});
				$('a.deliverysave').click(function(e) {
					e.preventDefault();
					$('div.ui-mybanner').html('form count:' + $('form.deliveryform${identify}').length);
					$('form.deliveryform').submit();
// 					$('form.deliveryform${identify}').submit(function() {
// 						return true;
// 					});
					return false;
				});
			});
		</script>
		<jsp:include page="footer.jsp">
			<jsp:param value="3" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
