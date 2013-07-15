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
	<div data-role="page" class="purchaseaddpage" data-dom-cache="false">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/assistant/index.html?_=${identify}" data-icon="check" class="btn-banner">返回</a>
			<h1>求购发布</h1>
			<a href="#" rel="external" data-icon="check" data-role="button" class="purchasesave ui-btn-right">发布</a>
		</div>
		<div class="purchaseaddcontent" data-role="content" data-dom-cache="false">
			<form class="purchaseform" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/purchase/create.html?_=${identify}" autocomplete="off">
				<input type="hidden" class="imageUploadedImage" name="imageUploaded.image" value="" autocomplete="off"/>
				<ul class="purchaselistview" data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品名称:</td>
				    			<td><input type="text" name="purchase.purchaseName" placeholder="产品名称" data-mini="true" value="产品名称" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品类型:</td>
				    			<td><input type="text" name="purchase.purchaseType" placeholder="产品类型" data-mini="true" value="1" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品产地:</td>
				    			<td><input type="text" name="purchase.purchaseAddress" placeholder="产品产地" data-mini="true" value="产品产地" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">产品属地:</td>
				    			<td><input type="text" name="purchase.purchaseLocation" placeholder="产品属地" data-mini="true" value="产品属地" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">数　　量:</td>
				    			<td><input type="text" name="purchase.purchaseNum" placeholder="数量" data-mini="true" value="2" autocomplete="off"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">有&nbsp&nbsp效&nbsp&nbsp期:</td>
				    			<td><input type="text" name="purchase.purchaseValid" placeholder="有效期" data-mini="true" value="2013-07-15 12:23:04" autocomplete="off"/></td>
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
					 	<input type="file" name="file" id="uploadImage" accept="image/*" capture="camera" value=""/>
					</li>
					<li>
					 	<input type="submit" value="确认发布" class="submit${identify}"/>
					</li>
				</ul>
			</form>
			<div id="list"></div>
			<div class="debug">&nbsp;</div>
			<div id="progress_bar"><div class="percent">0%</div></div>
		</div>
		<script type="text/javascript" language="javascript">
// 	 	<input type="file" name="file" id="uploadImage" value="" onchange="loadImageFile();">
// 			var oFReader = new FileReader();
// 			var rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;
// 			oFReader.onload = function(e) {
// 				var result = e.target.result;
// 				debug(result);
// 				document.getElementById("uploadPreview").src = result;
// 			};
// 			function loadImageFile() {
// 				if (document.getElementById("uploadImage").files.length === 0) {
// 					return;
// 				}
// 				debug('loadImageFile');
// 				var oFile = document.getElementById("uploadImage").files[0];
// // 				if (!rFilter.test(oFile.type)) {
// // 					alert("You must select a valid image file!");
// // 					return;
// // 				}
// 				oFReader.readAsDataURL(oFile);
// 			}
			$(document).on("pageinit", function() {
				$('div.purchaseaddpage').css({
					paddingTop : '0px'
				});
				$('a.purchasesave').click(function(e) {
					e.preventDefault();
					$('form.purchaseform').submit();
					return false;
				});
				$('a.purchasechooseimg').click(function(e) {
					e.preventDefault();
					var url = $('#file').val();
					$('img.purchaseaddimg').attr('src', url);
					debug(url);
					// 					window.main.makeGallery('1');
					return false;
				});
			});
			function setImgGallery(url) {
// 				$('.debug').html(url + ' at ' + new Date().getTime());
// 				$('img.purchaseaddimg').attr('src', url);
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
				debug('Response handleFileSelect at:' + new Date());
				var files = evt.target.files; // FileList object
				// Loop through the FileList and render image files as thumbnails.
				for ( var i = 0, f; f = files[i]; i++) {
					debug('Response file type:|' + f.type + '|');
					debug('Response file properties:|' + testProperties(f) + '|');
					// Only process image files.
					// 					if (!f.type.match('image.*')) {
					// 						debug('Response file type not match.');
					// 						continue;
					// 					}
					debug('Response file ready to read at:' + new Date());
					var reader = new FileReader();
					// Closure to capture the file information.
					reader.onload = (function(theFile) {
						return function(e) {
							// Render thumbnail.
							var span = document.createElement('span');
							var result = e.target.result.replace(/data:base64,/, 'data:image/' + getExt(theFile.name) + ';base64,');
							span.innerHTML = [ '<img class="thumb" style="width:100%;height:100%" src="',
							        result, '" title="',
									escape(theFile.name), '"/>' ].join('');
							document.getElementById('list').insertBefore(span,
									null);
							debug('onload file result:|' + e.target.result + '|');
							$('input.imageUploadedImage').val(result);
						};
					})(f);
					reader.onerror = function (evt) {
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
				      document.getElementById('progress_bar').innerHTML = 'loading';
				    };
					// Read in the image file as a data URL.
					reader.readAsDataURL(f);
					debug('Response file read over at:' + new Date());
				}
			}
			document.getElementById('uploadImage').addEventListener('change', handleFileSelect, false);
		</script>
		<jsp:include page="footer.jsp">
			<jsp:param value="3" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
