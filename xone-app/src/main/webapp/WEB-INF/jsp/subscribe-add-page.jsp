<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML><c:set var="myid" value="${identify}"/>
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
		<div data-id="myheader" data-role="header" data-position="fixed">
<!-- 			<a href="#" data-icon="check" data-rel="back">返回</a> -->
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>筛选订阅</h1>
			<a href="#" rel="external" data-icon="check" data-role="button" class="subscribe-save-button ui-btn-right">发布</a>
		</div>
		<div class="subscribe-add-content" data-role="content" data-dom-cache="false">
			<form class="subscribe-add-form${myid}" method="post" action="${pageContext.request.contextPath}/subscribe/create.html?_=${myid}" autocomplete="off">
				<ul class="mylistview${myid}" data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">市场区域:</td>
				    			<td><input type="text" id="subscribemarketarea${myid}" name="subscribe.marketarea" placeholder="市场区域" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>产品名称:</td>
				    			<td><input type="text" id="subscribeproductNameKey${myid}" name="subscribe.productNameKey" placeholder="产品名称" data-mini="true" value="" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">销售方式:</td>
				    			<td>
				    				<select name="subscribe.saleType" placeholder="销售方式" data-mini="true">
					    				<c:forEach items="${saleType}" var="it">
		                                    <option value="${it.value}">${it.name}</option>
		                                </c:forEach>
				    				</select>
				    			</td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">公司信誉:</td>
				    			<td>
				    				<select name="subscribe.credit" placeholder="公司信誉" data-mini="true">
				    					<option value="">全部</option>
				    					<option value="1">信誉好</option>
				    					<option value="0">信誉一般</option>
				    				</select>
				    			</td>
				    		</tr>
				    	</table>
				    </li>
					<li>
					 	<input type="submit" value="确认订阅" id="mysubscribesubmit${myid}" class="submit"/>
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
						$('#mysubscribesubmit${myid}').click();
						return false;
					});
					$('form.subscribe-add-form${myid}').submit(function() {
						if ($('form.subscribe-add-form${myid} li.myerror').length > 0) {
							$('li.myerror').remove();
							$('ul.mylistview${myid}').listview('refresh');
						}
						var v = [{
							id: 'subscribeproductNameKey${myid}',
							msg: '请输入产品名称'
						}];
						for (var i = 0; i < v.length; i++) {
							var vi = v[i];
							if ('' == $.trim($('#' + vi.id).val())) {
								$('#' + vi.id).closest('li').before(['<li class="myerror"><div class="error ui-btn-inner">', vi.msg, '</div></li>'].join(''));
							}
						}
						if ($('form.subscribe-add-form${myid} li.myerror').length > 0) {
							$('ul.mylistview${myid}').listview('refresh');
							return false;
						}
						return true;
					});
				});
			</script>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="3" name="offset"/></jsp:include>
	</div>
	</body>
</html>
