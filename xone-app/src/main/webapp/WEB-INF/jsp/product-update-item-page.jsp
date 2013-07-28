<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML><c:set var="myid" value="${identify}" />
<html>
	<head>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<jsp:include page="commons.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="productupdateitempage" data-dom-cache="false">
<%-- 		<link rel="stylesheet" href="${STATIC_ROOT}/mobiscroll/css/mobiscroll.core-2.6.2.css" /> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2.js"></script> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.datetime-2.6.2.js"></script> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2-zh.js"></script> --%>
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/product/itemForUser.html?_=${myid}&product.id=${product.id}" data-icon="check" class="btn-banner">返回</a>
			<h1>更新产品发布</h1>
			<a href="#" data-icon="check" data-role="button" class="productupdateclick ui-btn-right">更新</a>
		</div>
		<div class="productupdateitemcontent" data-role="content" data-dom-cache="false">
			<form class="productupdateitemform${myid}" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/product/update.html?_=${myid}" autocomplete="off">
				<input type="hidden" name="product.id" value="${product.id}" />
				<ul class="productupdateitemlistview${myid}" data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品名称:</td>
				    			<td><input type="text" id="productproductName${myid}" name="product.productName" placeholder="产品名称" data-mini="true" value="${product.productName}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品类型:</td>
				    			<td>
				    				<select name="product.productType" placeholder="产品类型" data-mini="true">
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
				    			<td><input type="text" id="productproductAddress${myid}" name="product.productAddress" placeholder="产品产地" data-mini="true" value="${product.productAddress}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品属地:</td>
				    			<td><input type="text" id="productproductLocation${myid}" name="product.productLocation" placeholder="产品属地" data-mini="true" value="${product.productLocation}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品价格:</td>
				    			<td><input type="text" id="productproductPrice${myid}" name="product.productPrice" placeholder="产品价格" data-mini="true" value="${product.productPrice}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">数　　量:</td>
				    			<td><input type="text" id="productproductNum${myid}" name="product.productNum" placeholder="数量" data-mini="true" value="${product.productNum}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">描　　述:</td>
				    			<td><input type="text" name="product.productDesc" placeholder="描述" data-mini="true" value="${product.productDesc}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
					<li>
					 	<input type="file" data-role="none" name="file" id="uploadUpdateItemImageFile${myid}" accept="image/*" capture="camera" value="" class="uploadImage ui-hidden-accessible"/>
					 	<input type="button" data-icon="plus" class="uploadImageButtonUpdateItem" value="选择图片"/>
					</li>
					<li class="publishupdateitemformbutton">
					 	<input type="submit" value="确认更新" id="productupdatesubmit${myid}" class="submit"/>
					</li>
					<c:forEach var="item" items="${product.ids}" varStatus="i">
					<li data-role="none" style="padding:0px;">
						<div class="productupdatepage">
							<a href="#" onclick="return removeUpdateItemDynamicImage(this);" class="ui-icon ui-icon-delete image-delete-buttom" style="position:relative;float:right;" title="删除图片">&nbsp;</a>
							<img class="uploadupdateitemdynamicimage" width="100%" height="100%" src="${pageContext.request.contextPath}/assistant/image.html?id=${item}"/>
							<input type="hidden" name="product.ids[${i.index}]" value="${item}" />
						</div>
					</li>
					</c:forEach>
				</ul>
			</form>
			<script type="text/javascript" language="javascript">
				$(document).on("pageinit", function() {
					$('div.productupdateitempage').css({
						paddingTop : '0px'
					});
				});
				$('div.productupdateitempage').bind('pageinit', function() {
					var width = $('div.productupdateitempage').width() - 11;
					var css = ['<style type="text/css">div.productupdatepage {text-align:center;height:', width, 'px;width:', width, 'px;}',
					           'div.productupdatepage img {width:', width,'px;height:', width, 'px;max-height:' + width + 'px;}',
					'<\/style>'];
					$('div.productupdateitempage').append(css.join(''));
					var productType = $('select[name="product.productType"] option[value="${product.productType}"]').attr('selected', 'selected');
					$('select[name="product.productType"]').siblings('span.ui-btn-inner').find('span.ui-btn-text span').text(productType.text());
					$('a.productupdateclick').click(function(e) {
						e.preventDefault();
						$('#productupdatesubmit${myid}').click();
						return false;
					});
					$('form.productupdateitemform${myid}').submit(function() {
						if ($('form.productupdateitemform${myid} li.myerror').length > 0) {
							$('li.myerror').remove();
							$('ul.productupdateitemlistview${myid}').listview('refresh');
						}
						var v = [{
							id: 'productproductName${myid}',
							msg: '请输入产品名称'
						},{
							id: 'productproductAddress${myid}',
							msg: '请输入产品产地'
						},{
							id: 'productproductLocation${myid}',
							msg: '请输入产品属地'
						},{
							id: 'productproductPrice${myid }',
							msg: '请输入产品价格'
						},{
							id: 'productproductNum${myid}',
							msg: '请输入产品数量'
						}];
						for (var i = 0; i < v.length; i++) {
							var vi = v[i];
							if ('' == $.trim($('#' + vi.id).val())) {
								$('#' + vi.id).closest('li').before(['<li class="myerror"><div class="error ui-btn-inner">', vi.msg, '</div></li>'].join(''));
							}
						}
						if ($('form.productupdateitemform${myid} li.myerror').length > 0) {
							$('ul.productupdateitemlistview${myid}').listview('refresh');
							return false;
						}
					});
// 					$('#productupdateproductvalid').scroller('destroy')
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
					$('input.uploadImageButtonUpdateItem').click(function(e) {
						e.preventDefault();
						$('form li.errorli').remove();
						if ($('img.uploadupdateitemdynamicimage').length >= 3) {
							$('<li class="errorli"><div class="error ui-btn-inner">一个产品最多只能发布3张图片.</div></li>').insertBefore('li.publishupdateitemformbutton');
							$('ul.productupdateitemlistview${myid}').listview('refresh');
							return false;
						}
						$('ul.productupdateitemlistview${myid}').listview('refresh');
						$('input.uploadImage[type="file"]').click();
						return false;
					});
					$('input.uploadImage[type="file"]').bind('change', handleFileSelect);
				});
				function removeUpdateItemDynamicImage(e) {
					$(e).closest('li').remove();
					$('ul.productupdateitemlistview${myid}').listview('refresh');
					$('#uploadUpdateItemImageFile${myid}').val('');
					return false;
				}
				function getExt(v) {
					var a = v.split('.');
					return a[a.length - 1];
				}
				function handleFileSelect(evt) {
					if ($('li.fileerror').length > 0) {
						$('li.fileerror').remove();
						$('ul.productupdateitemlistview${myid}').listview('refresh');
					}
					var files = evt.target.files; // FileList object
					// Loop through the FileList and render image files as thumbnails.
					for (var i = 0, f; f = files[i]; i++) {
						var m = f.name.match(/\.(png|jpeg|jpg|gif)$/i);
						if (null == m) {
							$('#uploadUpdateItemImageFile${myid}').closest('li').before('<li class="fileerror"><div class="error ui-btn-inner">请选择图片(png或jpeg或jpg或gif)</div></li>');
							$('ul.productupdateitemlistview${myid}').listview('refresh');
							continue;
						}
						var reader = new FileReader();
						// Closure to capture the file information.
						reader.onload = (function(theFile) {
							return function(e) {
								var div = document.createElement('div');
								div.className = 'productupdatepage';
								var result = e.target.result.replace(/data:base64,/, 'data:image/' + getExt(theFile.name) + ';base64,');
								div.innerHTML = [
										'<a href="#" onclick="return removeDynamicImage(this);" class="ui-icon ui-icon-delete image-delete-buttom" style="position:relative;float:right;" title="删除图片">&nbsp;</a>',
										'<img class="uploadupdateitemdynamicimage" width="100%" height="100%" src="',
										result, '" title="', escape(theFile.name),
										'"/>',
										'<input type="hidden" name="images" value="', 
									result, '" />' ]
										.join('');
								var listview = $('ul.productupdateitemlistview${myid}');
								listview.append('<li data-role="none" style="padding:0px;"></li>');
								listview.find('li').last().append(div);
								listview.listview('refresh');
							};
						})(f);
						reader.onerror = function(evt) {
							switch (evt.target.error.code) {
							case evt.target.error.NOT_FOUND_ERR:
								break;
							case evt.target.error.NOT_READABLE_ERR:
								break;
							case evt.target.error.ABORT_ERR:
								break; // noop
							default:
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
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
