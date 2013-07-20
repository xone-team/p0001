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
	<div data-role="page" class="productaddpage" data-dom-cache="false">
		<link rel="stylesheet" href="${STATIC_ROOT}/mobiscroll/css/mobiscroll.core-2.6.2.css" />
		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2.js"></script>
		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.datetime-2.6.2.js"></script>
		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2-zh.js"></script>
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/assistant/index.html?_=${identify}" data-icon="check">返回</a>
			<h1>发布产品</h1>
			<a href="#" rel="external" data-icon="check" data-role="button" class="productsave ui-btn-right">发布</a>
		</div>
		<div class="productaddcontent" data-role="content" data-dom-cache="false">
			<form class="productform" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/product/create.html?_=${identify}" autocomplete="off">
				<input type="hidden" name="product.saleType" value="${param.type}" autocomplete="off"/>
				<ul class="productlistview" data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品名称:</td>
				    			<td><input type="text" name="product.productName" placeholder="产品名称" data-mini="true"  autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品类型:</td>
				    			<td><input type="text" name="product.productType" placeholder="产品类型" data-mini="true" value="1" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品产地:</td>
				    			<td><input type="text" name="product.productAddress" placeholder="产品产地" data-mini="true"  autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品属地:</td>
				    			<td><input type="text" name="product.productLocation" placeholder="产品属地" data-mini="true"  autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">价　　格:</td>
				    			<td><input type="text" name="product.productPrice" placeholder="产品价格" data-mini="true" value="20" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">数　　量:</td>
				    			<td><input type="text" name="product.productNum" placeholder="数量" data-mini="true" value="2" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">有&nbsp&nbsp效&nbsp&nbsp期:</td>
				    			<td><input type="text" id="productproductValid" name="product.productValid" placeholder="有效期" data-mini="true"  autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">描　　述:</td>
				    			<td><input type="text" name="product.productDesc" placeholder="描述" data-mini="true"  autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
					<li>
					 	<input type="file" data-role="none" name="file" id="uploadImageFileProduct" accept="image/*" capture="camera" value="" class="uploadImageProduct ui-hidden-accessible"/>
					 	<input type="button" data-icon="plus" class="uploadImageProductButton" value="选择图片"/>
					</li>
					<li class="productpublishformbutton">
					 	<input type="submit" value="确认发布" class="submit${identify}"/>
					</li>
				</ul>
				<div class="imagelistdiv" style="padding:5px;"></div>
			</form>
			<div class="debug">&nbsp;</div>
			<script type="text/javascript" language="javascript">
				$(document).on("pageinit", function() {
					$('div.productaddpage').css({
						paddingTop : '0px'
					});
				});
				$('div.productaddpage').bind('pageinit', function() {
					var width = $('div.productaddpage').width() - 11;
					var css = ['<style type="text/css">div.purchaseimage {text-align:center;height:', width, 'px;width:', width, 'px;}',
					           'div.purchaseimage img {width:', width,'px;height:', width, 'px;max-height:' + width + 'px;}',
					'<\/style>'];
					$('div.productaddpage').append(css.join(''));
					$('a.productsave').click(function(e) {
						e.preventDefault();
						$('form.productform').submit();
						return false;
					});
					$('#productproductValid').scroller('destroy')
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
					$('input.uploadImageProductButton').click(function(e) {
						e.preventDefault();
						$('form li.errorli').remove();
						if ($('img.uploadproductdynamicimage').length >= 3) {
							$('<li class="errorli"><div class="error ui-btn-inner">一个产品最多只能发布3张图片.</div></li>').insertBefore('li.productpublishformbutton');
							$('ul.productlistview').listview('refresh');
							return false;
						}
						$('ul.productlistview').listview('refresh');
						$('input.uploadImageProduct[type="file"]').click();
						return false;
					});
					$('input.uploadImageProduct[type="file"]').bind('change', handleFileSelect);
				});
				function removeProductDynamicImage(e) {
					$(e).closest('li').remove();
					$('ul.productlistview').listview('refresh');
					$('#uploadImageFileProduct').val('');
					return false;
				}
				function debug(i) {
					$('div.debug').append('<div>' + i + '</div>');
				}
				function testProperties(o) {
					var i = '';
					for (var n in o) {
						i += '<div>' + n + '</div>';
					}
					return i;
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
								div.className = 'purchaseimage';
								var result = e.target.result.replace(/data:base64,/, 'data:image/' + getExt(theFile.name) + ';base64,');
								div.innerHTML = [
										'<a href="#" onclick="return removeProductDynamicImage(this);" class="ui-icon ui-icon-delete image-delete-buttom" style="position:relative;float:right;" title="删除图片">&nbsp;</a>',
										'<img class="uploadproductdynamicimage" width="100%" height="100%" src="',
										result, '" title="', escape(theFile.name),
										'"/>',
										'<input type="hidden" name="images" value="', 
									result, '" />' ]
										.join('');
								var listview = $('ul.productlistview');
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
							};
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
		<jsp:include page="footer.jsp"><jsp:param value="3" name="offset"/></jsp:include>
	</div>
	</body>
</html>
