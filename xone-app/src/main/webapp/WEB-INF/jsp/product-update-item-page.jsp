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
	<div data-role="page" class="productupdateitempage" data-dom-cache="false">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/product/itemForUser.html?_=${identify}&product.id=${product.id}" data-icon="check" class="btn-banner">返回</a>
			<h1>更新产品发布</h1>
			<a href="#" data-icon="check" data-role="button" class="productupdateclick ui-btn-right">更新</a>
		</div>
		<div class="productupdateitemcontent" data-role="content" data-dom-cache="false">
			<form class="productupdateitemform" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/product/update.html?_=${identify}" autocomplete="off">
				<input type="hidden" name="product.id" value="${product.id}" />
				<ul class="productupdateitemlistview" data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品名称:</td>
				    			<td><input type="text" name="product.productName" placeholder="产品名称" data-mini="true" value="${product.productName}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品类型:</td>
				    			<td><input type="text" name="product.productType" placeholder="产品类型" data-mini="true" value="${product.productType}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品产地:</td>
				    			<td><input type="text" name="product.productAddress" placeholder="产品产地" data-mini="true" value="${product.productAddress}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品属地:</td>
				    			<td><input type="text" name="product.productLocation" placeholder="产品属地" data-mini="true" value="${product.productLocation}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品价格:</td>
				    			<td><input type="text" name="product.productPrice" placeholder="产品价格" data-mini="true" value="${product.productPrice}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">数　　量:</td>
				    			<td><input type="text" name="product.productNum" placeholder="数量" data-mini="true" value="${product.productNum}" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">有&nbsp&nbsp效&nbsp&nbsp期:</td>
				    			<td><input type="text" name="product.productValid" placeholder="有效期" data-mini="true" value="${product.productValid}" autocomplete="off"/></td>
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
					 	<input type="file" data-role="none" name="file" id="uploadUpdateItemImageFile" accept="image/*" capture="camera" value="" class="uploadImage ui-hidden-accessible"/>
					 	<input type="button" data-icon="plus" class="uploadImageButtonUpdateItem" value="选择图片"/>
					</li>
					<li class="publishupdateitemformbutton">
					 	<input type="submit" value="确认更新" class="submit${identify}"/>
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
					$('a.productupdateclick').click(function(e) {
						e.preventDefault();
						$('form.productupdateitemform').submit();
						return false;
					});
					$('input.uploadImageButtonUpdateItem').click(function(e) {
						e.preventDefault();
						$('form li.errorli').remove();
						if ($('img.uploadupdateitemdynamicimage').length >= 3) {
							$('<li class="errorli"><div class="error ui-btn-inner">一个产品最多只能发布3张图片.</div></li>').insertBefore('li.publishupdateitemformbutton');
							$('ul.productupdateitemlistview').listview('refresh');
							return false;
						}
						$('ul.productupdateitemlistview').listview('refresh');
						$('input.uploadImage[type="file"]').click();
						return false;
					});
					$('input.uploadImage[type="file"]').bind('change', handleFileSelect);
				});
				function removeUpdateItemDynamicImage(e) {
					$(e).closest('li').remove();
					$('ul.productupdateitemlistview').listview('refresh');
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
								var listview = $('ul.productupdateitemlistview');
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
