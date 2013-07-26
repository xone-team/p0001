<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<jsp:include page="commons.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="purchaseupdateitempage" data-dom-cache="false">
		<link rel="stylesheet" href="${STATIC_ROOT}/mobiscroll/css/mobiscroll.core-2.6.2.css" />
		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2.js"></script>
		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.datetime-2.6.2.js"></script>
		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2-zh.js"></script>
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/purchase/itemForUser.html?_=${identify}&purchase.id=${purchase.id}" data-icon="check" class="btn-banner">返回</a>
			<h1>更新购买发布</h1>
			<a href="#" data-icon="check" data-role="button" class="purchaseupdateclick ui-btn-right">更新</a>
		</div>
		<div class="purchaseupdateitemcontent" data-role="content" data-dom-cache="false">
			<form class="purchaseupdateitemform" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/purchase/update.html?_=${identify}" autocomplete="off">
				<input type="hidden" name="purchase.id" value="${purchase.id}" />
				<ul class="purchaseupdateitemlistview" data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品名称:</td>
				    			<td><input type="text" name="purchase.purchaseName" placeholder="产品名称" data-mini="true" value="${purchase.purchaseName}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品类型:</td>
				    			<td><input type="text" name="purchase.purchaseType" placeholder="产品类型" data-mini="true" value="${purchase.purchaseType}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品产地:</td>
				    			<td><input type="text" name="purchase.purchaseAddress" placeholder="产品产地" data-mini="true" value="${purchase.purchaseAddress}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品属地:</td>
				    			<td><input type="text" name="purchase.purchaseLocation" placeholder="产品属地" data-mini="true" value="${purchase.purchaseLocation}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">数　　量:</td>
				    			<td><input type="text" name="purchase.purchaseNum" placeholder="数量" data-mini="true" value="${purchase.purchaseNum}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">有&nbsp&nbsp效&nbsp&nbsp期:</td>
				    			<td><input type="text" id="purchaseupdatepurchasevalid" name="purchase.purchaseValid" placeholder="有效期" data-mini="true" value="${purchase.purchaseValid}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">描　　述:</td>
				    			<td><input type="text" name="purchase.purchaseDesc" placeholder="描述" data-mini="true" value="${purchase.purchaseDesc}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
					<li>
					 	<input type="file" data-role="none" name="file" id="uploadUpdateItemImageFile" accept="image/*" capture="camera" value="" class="uploadImage ui-hidden-accessible"/>
					 	<input type="button" data-icon="plus" class="uploadImageButtonUpdateItem" value="选择图片"/>
					</li>
					<li class="publishupdateitemformbutton">
					 	<input type="submit" value="确认更新" class="submit${identify}"/>
					</li>
					<c:forEach var="item" items="${purchase.ids}" varStatus="i">
					<li data-role="none" style="padding:0px;">
						<div class="purchaseupdatepage">
							<a href="#" onclick="return removeUpdateItemDynamicImage(this);" class="ui-icon ui-icon-delete image-delete-buttom" style="position:relative;float:right;" title="删除图片">&nbsp;</a>
							<img class="uploadupdateitemdynamicimage" width="100%" height="100%" src="${pageContext.request.contextPath}/assistant/image.html?id=${item}"/>
							<input type="hidden" name="purchase.ids[${i.index}]" value="${item}" />
						</div>
					</li>
					</c:forEach>
				</ul>
			</form>
			<script type="text/javascript" language="javascript">
				$(document).on("pageinit", function() {
					$('div.purchaseupdateitempage').css({
						paddingTop : '0px'
					});
				});
				$('div.purchaseupdateitempage').bind('pageinit', function() {
					var width = $('div.purchaseupdateitempage').width() - 11;
					var css = ['<style type="text/css">div.purchaseupdatepage {text-align:center;height:', width, 'px;width:', width, 'px;}',
					           'div.purchaseupdatepage img {width:', width,'px;height:', width, 'px;max-height:' + width + 'px;}',
					'<\/style>'];
					$('div.purchaseupdateitempage').append(css.join(''));
					$('a.purchaseupdateclick').click(function(e) {
						e.preventDefault();
						$('form.purchaseupdateitemform').submit();
						return false;
					});
					$('#purchaseupdatepurchasevalid').scroller('destroy')
					.scroller($.extend({
						preset : 'date',
						minDate : new Date(2012, 3, 10),
						maxDate : new Date(2020, 7, 30)
					}, {
						theme : 'default',
						mode : 'scroller',
						display : 'modal',
						lang : 'zh'
					}));
					$('input.uploadImageButtonUpdateItem').click(function(e) {
						e.preventDefault();
						$('form li.errorli').remove();
						if ($('img.uploadupdateitemdynamicimage').length >= 3) {
							$('<li class="errorli"><div class="error ui-btn-inner">一个产品最多只能发布3张图片.</div></li>').insertBefore('li.publishupdateitemformbutton');
							$('ul.purchaseupdateitemlistview').listview('refresh');
							return false;
						}
						$('ul.purchaseupdateitemlistview').listview('refresh');
						$('input.uploadImage[type="file"]').click();
						return false;
					});
					$('input.uploadImage[type="file"]').bind('change', handleFileSelect);
				});
				function removeUpdateItemDynamicImage(e) {
					$(e).closest('li').remove();
					$('ul.purchaseupdateitemlistview').listview('refresh');
					$('#uploadUpdateItemImageFile').val('');
					return false;
				}
				function getExt(v) {
					var a = v.split('.');
					return a[a.length - 1];
				}
				function handleFileSelect(evt) {
					var files = evt.target.files; // FileList object
					// Loop through the FileList and render image files as thumbnails.
					for (var i = 0, f; f = files[i]; i++) {
						var reader = new FileReader();
						// Closure to capture the file information.
						reader.onload = (function(theFile) {
							return function(e) {
								var div = document.createElement('div');
								div.className = 'purchaseupdatepage';
								var result = e.target.result.replace(/data:base64,/, 'data:image/' + getExt(theFile.name) + ';base64,');
								div.innerHTML = [
										'<a href="#" onclick="return removeDynamicImage(this);" class="ui-icon ui-icon-delete image-delete-buttom" style="position:relative;float:right;" title="删除图片">&nbsp;</a>',
										'<img class="uploadupdateitemdynamicimage" width="100%" height="100%" src="',
										result, '" title="', escape(theFile.name),
										'"/>',
										'<input type="hidden" name="images" value="', 
									result, '" />' ]
										.join('');
								var listview = $('ul.purchaseupdateitemlistview');
								listview.append('<li data-role="none" style="padding:0px;"></li>');
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
							alert('File read cancelled');
						};
						reader.onloadstart = function(e) {
	
						};
						// Read in the image file as a data URL.
						reader.readAsDataURL(f);
					}
				}
			</script>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
