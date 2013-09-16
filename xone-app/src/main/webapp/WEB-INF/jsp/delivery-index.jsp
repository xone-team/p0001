<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML><c:set var="myid" value="${identify}" />
<html>
	<head>
		<title>Hello World</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="deliverypage${myid}" data-dom-cache="false">
		<link rel="stylesheet" href="${STATIC_ROOT}/mobiscroll/css/mobiscroll.core-2.6.2.css" />
		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2.js"></script>
		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.datetime-2.6.2.js"></script>
		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2-zh.js"></script>
		<style type="text/css">
			td.mylabel {
				width:80px;
			}
		</style>
		<div data-id="myheader" data-role="header" data-position="fixed">
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>物流配送</h1>
			<a href="#" rel="external" data-icon="check" data-role="button" class="deliverysave${myid} ui-btn-right">保存</a>
		</div>
		<div class="deliverycontent" data-role="content" data-dom-cache="false">
			<div style="text-align:center;"><h3>功能即将推出，敬请期待！</h3></div>
<%-- 			<form class="deliveryform${myid}" method="post" action="${pageContext.request.contextPath}/delivery/create.html?_=${myid}"  data-dom-cache="false" autocomplete="off"> --%>
<!-- 				<input type="hidden" name="redirect" data-role="none" value="" autocomplete="off"/> -->
<%-- 				<ul class="mylistview${myid}" data-role="listview" data-inset="true" data-mini="true"> --%>
<!-- 				    <li> -->
<!-- 				    	<table style="width:100%"> -->
<!-- 				    		<tr> -->
<!-- 				    			<td class="mylabel"><span class="required">*</span>市场区域:</td> -->
<%-- 				    			<td><input type="text" id="deliverymarketarea${myid}" name="delivery.marketarea" data-mini="true" value="" autocomplete="off"/></td> --%>
<!-- 				    		</tr> -->
<!-- 				    	</table> -->
<!-- 				    </li> -->
<!-- 				    <li> -->
<!-- 				    	<table style="width:100%"> -->
<!-- 				    		<tr> -->
<!-- 				    			<td class="mylabel"><span class="required">*</span>目&nbsp;&nbsp;的&nbsp;&nbsp;地:</td> -->
<%-- 				    			<td><input type="text" id="deliverydetermini${myid}" name="delivery.determini" data-mini="true" value="" autocomplete="off"/></td> --%>
<!-- 				    		</tr> -->
<!-- 				    	</table> -->
<!-- 				    </li> -->
<!-- 				    <li> -->
<!-- 				    	<table style="width:100%"> -->
<!-- 				    		<tr> -->
<!-- 				    			<td class="mylabel"><span class="required">*</span>上货时间:</td> -->
<%-- 				    			<td><input type="text" id="deliveryloadtime${myid}" name="delivery.loadtime" data-mini="true" value="" autocomplete="off" readonly="readonly"/></td> --%>
<!-- 				    		</tr> -->
<!-- 				    	</table> -->
<!-- 				    </li> -->
<!-- 				    <li> -->
<!-- 				    	<table style="width:100%"> -->
<!-- 				    		<tr> -->
<!-- 				    			<td class="mylabel"><span class="required">*</span>上货地点:</td> -->
<%-- 				    			<td><input type="text" id="deliveryloadaddress${myid}" name="delivery.loadaddress" data-mini="true" value="" autocomplete="off"/></td> --%>
<!-- 				    		</tr> -->
<!-- 				    	</table> -->
<!-- 				    </li> -->
<!-- 				    <li style="padding-right:0px;"> -->
<!-- 				    	<table style="width:100%"> -->
<!-- 				    		<tr> -->
<!-- 				    			<td rowspan="3" style="border-right:1px solid gray;"><span class="required">*</span><br/>货量:</td> -->
<!-- 			    				<td style="width:40px;text-align:right;">箱数</td> -->
<!-- 				    			<td> -->
<%-- 				    				<input type="text" id="deliveryboxNum${myid}" name="delivery.boxNum" value="" autocomplete="off"/> --%>
<!-- 			    				</td> -->
<!-- 			    				<td> -->
<%-- 				    				<input type="text" id="deliveryunitNum${myid}" name="delivery.unitNum" value="" autocomplete="off"/> --%>
<!-- 			    				</td> -->
<!-- 			    				<td style="width:50px;">kg/箱</td> -->
<!-- 				    		</tr> -->
<!-- 				    		<tr> -->
<!-- 			    				<td  style="text-align:right;">总共</td> -->
<!-- 			    				<td colspan="2"> -->
<%-- 				    				<input type="text" id="deliveryboxTotal${myid}" name="delivery.boxTotal" value="" readonly autocomplete="off"/> --%>
<!-- 				    			</td> -->
<!-- 			    				<td>kg</td> -->
<!-- 				    		</tr> -->
<!-- 				    		<tr> -->
<!-- 			    				<td style="border-top:1px solid gray;text-align:right;">或者</td> -->
<!-- 				    			<td colspan="2" style="border-top:1px solid gray;"> -->
<%-- 				    				<input type="text" id="deliverytotalWeight${myid}" name="delivery.totalWeight" value="" autocomplete="off"/> --%>
<!-- 				    			</td> -->
<!-- 			    				<td style="border-top:1px solid gray;">kg</td> -->
<!-- 				    		</tr> -->
<!-- 				    	</table> -->
<!-- 				    </li> -->
<!-- 					<li> -->
<%-- 					 	<input type="submit" value="确认" id="mydeliverysubmit${myid}" class="submit${myid}"/> --%>
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</form> -->
<!-- 		</div> -->
		<script type="text/javascript" language="javascript">
// 			$('div.deliverypage${myid}').bind("pageinit", function() {
// 				$('div.deliverycontent').css({
// 					paddingTop: '0px'
// 				});
// 				loadnumbercheckfordelivery('deliveryboxNum${myid}', 'deliveryunitNum${myid}', 'deliveryboxTotal${myid}', 'deliverytotalWeight${myid}');
// 				$('#deliveryloadtime${myid}').val('').scroller('destroy')
// 					.scroller($.extend({
// 						preset : 'datetime',
// 						minDate : new Date(2012, 3, 10, 9, 22),
// 						maxDate : new Date(2020, 7, 30, 15, 44),
// 						stepMinute : 5
// 					}, {
// 						theme : 'default',
// 						mode : 'scroller',
// 						display : 'modal',
// 						lang : 'zh'
// 					})).bind('click', function() {
// 						$(this).focus()
// 					});
// 				$('a.deliverysave${myid}').click(function(e) {
// 					e.preventDefault();
// 					$('#mydeliverysubmit${myid}').click();
// 					return false;
// 				});
// 				$('form.deliveryform${myid}').submit(function() {
// 					if ($('form.deliveryform${myid} li.myerror').length > 0) {
// 						$('li.myerror').remove();
// 						$('ul.mylistview${myid}').listview('refresh');
// 					}
// 					var v = [{
// 						id: 'deliverymarketarea${myid}',
// 						msg: '请输入市场区域'
// 					},{
// 						id: 'deliverydetermini${myid}',
// 						msg: '请输入目的地'
// 					},{
// 						id: 'deliveryloadtime${myid}',
// 						msg: '请选择上货时间'
// 					},{
// 						id: 'deliveryloadaddress${myid}',
// 						msg: '请输入上货地点'
// 					}];
// 					for (var i = 0; i < v.length; i++) {
// 						var vi = v[i];
// 						if ('' == $.trim($('#' + vi.id).val())) {
// 							$('#' + vi.id).closest('li').before(['<li class="myerror"><div class="error ui-btn-inner">', vi.msg, '</div></li>'].join(''));
// 						}
// 					}
// 					if (!inputABCDCheck('deliveryboxNum${myid}', 'deliveryunitNum${myid}', 'deliverytotalWeight${myid}')) {
// 						v = [{
// 							id: 'deliveryboxNum${myid}',
// 							msg: '货量或者输入箱数单位数或者输入总重'
// 						}];
// 						for (var i = 0; i < v.length; i++) {
// 							var vi = v[i];
// 							if ('' == $.trim($('#' + vi.id).val())) {
// 								$('#' + vi.id).closest('li').before(['<li class="myerror"><div class="error ui-btn-inner">', vi.msg, '</div></li>'].join(''));
// 							}
// 						}
// 					}
// 					if ($('form.deliveryform${myid} li.myerror').length > 0) {
// 						$('ul.mylistview${myid}').listview('refresh');
// 						return false;
// 					}
// 					return true;
// 				});
// 				function loadnumbercheckfordelivery(A, B, C, D) {
// 					$('#' + A + ', #' + B + '').keyup(function() {
// 						$('#' + A).val($('#' + A).val().replace(/\D/ig, ''));
// 						$('#' + B).val($('#' + B).val().replace(/\D/ig, ''));
// 						var vala = $('#' + A).val();
// 						var valb = $('#' + B).val();
// 						if (vala != '' && valb != '' && !isNaN(vala) && !isNaN(valb)) {
// 							$('#' + C).val(parseInt(vala) * parseInt(valb));
// 						} else {
// 							$('#' + C).val('');
// 						}
// 					});
// 					$('#' + D).keyup(function() {
// 						$('#' + D).val($('#' + D).val().replace(/\D/ig, ''));
// 					});
// 				}
// 				function inputABCDCheck(A, B, D) {
// 					return (($.trim($('#' + A).val()) != '' && $.trim($('#' + B).val()) != '') || $.trim($('#' + D).val()) != '');
// 				}
// 			});
		</script>
		<jsp:include page="footer.jsp">
			<jsp:param value="3" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
