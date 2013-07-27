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
	<div data-role="page" class="purchaseaddpage" data-dom-cache="false">
<%-- 		<link rel="stylesheet" href="${STATIC_ROOT}/mobiscroll/css/mobiscroll.core-2.6.2.css" /> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2.js"></script> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.datetime-2.6.2.js"></script> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2-zh.js"></script> --%>
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/assistant/index.html?_=${myid}" data-icon="check" class="btn-banner">返回</a>
			<h1>求购发布</h1>
			<a href="#" rel="external" data-icon="check" data-role="button" class="purchasesave ui-btn-right">发布</a>
		</div>
		<div class="purchaseaddcontent" data-role="content" data-dom-cache="false">
			<form class="purchaseform${myid}" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/purchase/create.html?_=${myid}" autocomplete="off">
				<ul class="purchaselistview${myid}" data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品名称:</td>
				    			<td><input type="text" id="purchasepurchaseName${myid}" name="purchase.purchaseName" placeholder="产品名称" data-mini="true" value="产品名称" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品类型:</td>
				    			<td>
				    				<select name="purchase.purchaseType" placeholder="产品类型" data-mini="true">
				    					<option value="0">冻品</option>
				    					<option value="1">干货</option>
				    					<option value="2">活鲜</option>
				    					<option value="3">水果</option>
				    					<option value="4">调料</option>
				    				</select>
				    			</td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品产地:</td>
				    			<td><input type="text" id="purchasepurchaseAddress${myid}" name="purchase.purchaseAddress" placeholder="产品产地" data-mini="true" value="产品产地" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品属地:</td>
				    			<td><input type="text" id="purchasepurchaseLocation${myid}" name="purchase.purchaseLocation" placeholder="产品属地" data-mini="true" value="产品属地" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">数　　量:</td>
				    			<td><input type="text" id="purchasepurchaseNum${myid}" name="purchase.purchaseNum" placeholder="数量" data-mini="true" value="2" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">描　　述:</td>
				    			<td><input type="text" name="purchase.purchaseDesc" placeholder="描述" data-mini="true" value="描述描述描述描述描述描述描述描述描述描述描述" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
					<li>
					 	<input type="file" data-role="none" name="file" id="uploadImageFile" accept="image/*" capture="camera" value="" class="uploadImage ui-hidden-accessible"/>
					 	<input type="button" data-icon="plus" class="uploadImageButton" value="选择图片"/>
					</li>
					<li class="publishformbutton">
					 	<input type="submit" value="确认发布" id="purchasesavesubmit${myid}" class="submit${myid}"/>
					</li>
				</ul>
				<div class="imagelistdiv" style="padding:5px;"></div>
			</form>
			<div class="debug">&nbsp;</div>
			<script type="text/javascript" language="javascript">
				$(document).on("pageinit", function() {
					$('div.purchaseaddpage').css({
						paddingTop : '0px'
					});
				});
				$('div.purchaseaddpage').bind('pageinit', function() {
					var width = $('div.purchaseaddpage').width() - 11;
					var css = ['<style type="text/css">div.purchaseimage {text-align:center;height:', width, 'px;width:', width, 'px;}',
					           'div.purchaseimage img {width:', width,'px;height:', width, 'px;max-height:' + width + 'px;}',
					'<\/style>'];
					$('div.purchaseaddpage').append(css.join(''));
// 					$('#purchasepurchaseValid').scroller('destroy')
// 					.scroller($.extend({
// 						preset : 'date',
// 						minDate : new Date(2012, 3, 10),
// 						maxDate : new Date(2020, 7, 30)
// 					}, {
// 						theme : 'default',
// 						mode : 'scroller',
// 						display : 'modal',
// 						lang : 'zh'
// 					}));
					$('a.purchasesave').click(function(e) {
						e.preventDefault();
						$('#purchasesavesubmit${myid}').click();
						return false;
					});
					$('form.purchaseform${myid}').submit(function() {
						if ($('form.purchaseform${myid} li.myerror').length > 0) {
							$('li.myerror').remove();
							$('ul.purchaselistview${myid}').listview('refresh');
						}
						var v = [{
							id: 'purchasepurchaseName${myid}',
							msg: '请输入产品名称'
						},{
							id: 'purchasepurchaseAddress${myid}',
							msg: '请输入产品产地'
						},{
							id: 'purchasepurchaseLocation${myid}',
							msg: '请输入产品属地'
						},{
							id: 'purchasepurchaseNum${myid}',
							msg: '请输入产品数量'
						}];
						for (var i = 0; i < v.length; i++) {
							var vi = v[i];
							if ('' == $.trim($('#' + vi.id).val())) {
								$('#' + vi.id).closest('li').before(['<li class="myerror"><div class="error ui-btn-inner">', vi.msg, '</div></li>'].join(''));
							}
						}
						if ($('form.purchaseform${myid} li.myerror').length > 0) {
							$('ul.purchaselistview${myid}').listview('refresh');
							return false;
						}
					});
					$('input.uploadImageButton').click(function(e) {
						e.preventDefault();
						$('form li.errorli').remove();
						if ($('img.uploaddynamicimage').length >= 3) {
							$('<li class="errorli"><div class="error ui-btn-inner">一个产品最多只能发布3张图片.</div></li>').insertBefore('li.publishformbutton');
							$('ul.purchaselistview${myid}').listview('refresh');
							return false;
						}
						$('ul.purchaselistview${myid}').listview('refresh');
						$('input.uploadImage[type="file"]').click();
						return false;
					});
					$('input.uploadImage[type="file"]').bind('change', handleFileSelect);
				});
				function removeDynamicImage(e) {
					$(e).closest('li').remove();
					$('ul.purchaselistview${myid}').listview('refresh');
					$('#uploadImageFile').val('');
					return false;
				}
				function debug(i) {
					$('div.debug').append('<div>' + i + '</div>');
				}
				function getExt(v) {
					var a = v.split('.');
					return a[a.length - 1];
				}
				function handleFileSelect(evt) {
					if ($('li.fileerror').length > 0) {
						$('li.fileerror').remove();
						$('ul.purchaselistview${myid}').listview('refresh');
					}
					var files = evt.target.files; // FileList object
					for (var i = 0, f; f = files[i]; i++) {
						var m = f.name.match(/\.(png|jpeg|jpg|gif)$/i);
						if (null == m) {
							$('#uploadImageFile').closest('li').before('<li class="fileerror"><div class="error ui-btn-inner">请选择图片(png或jpeg或jpg或gif)</div></li>');
							$('ul.purchaselistview${myid}').listview('refresh');
							continue;
						}
						var reader = new FileReader();
						reader.onload = (function(theFile) {
							return function(e) {
								var div = document.createElement('div');
								div.className = 'purchaseaddpage';
								var result = e.target.result.replace(/data:base64,/, 'data:image/' + getExt(theFile.name) + ';base64,');
								div.innerHTML = [
										'<a href="#" onclick="return removeDynamicImage(this);" class="ui-icon ui-icon-delete image-delete-buttom" style="position:relative;float:right;" title="删除图片">&nbsp;</a>',
										'<img class="uploaddynamicimage" width="100%" height="100%" src="',
										result, '" title="', escape(theFile.name),
										'"/>',
										'<input type="hidden" name="images" value="', 
									result, '" />' ]
										.join('');
								var listview = $('ul.purchaselistview${myid}');
								listview.append('<li></li>');
								listview.find('li').last().append(div);
								listview.listview('refresh');
							};
						})(f);
						reader.onerror = function(evt) {
							switch (evt.target.error.code) {
							case evt.target.error.NOT_FOUND_ERR:
								alert('File Not Found!');
								break;
							case evt.target.error.NOT_READABLE_ERR:
								alert('File is not readable');
								break;
							case evt.target.error.ABORT_ERR:
								break; // noop
							default:
								alert('An error occurred reading this file.');
							}
							;
						};
						reader.onabort = function(e) {
						};
						reader.onloadstart = function(e) {
	
						};
						reader.readAsDataURL(f);
					}
				}
			</script>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="3" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
