<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML><c:set var="myid" value="${identify }" />
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
<%-- 		<link rel="stylesheet" href="${STATIC_ROOT}/mobiscroll/css/mobiscroll.core-2.6.2.css" /> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2.js"></script> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.datetime-2.6.2.js"></script> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2-zh.js"></script> --%>
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/assistant/index.html?_=${myid}" class="mybackpagebtn" data-icon="check">返回</a>
			<h1>发布产品</h1>
			<a href="#" rel="external" data-icon="check" data-role="button" class="productsave${myid} ui-btn-right">发布</a>
		</div>
		<div class="productaddcontent" data-role="content" data-dom-cache="false">
			<form class="productform${myid}" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/product/create.html?_=${myid}" autocomplete="off">
				<input type="hidden" name="product.saleType" value="${product.saleType}" autocomplete="off"/>
				<ul class="productlistview${myid}" data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>产品名称:</td>
				    			<td><input type="text" id="productproductName${myid}" name="product.productName" placeholder="产品名称" data-mini="true"  autocomplete="off" maxlength="20"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>产品类型:</td>
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
				    			<td class="mylabel"><span class="required">*</span>产品产地:</td>
				    			<td><input type="text" id="productproductAddress${myid}" name="product.productAddress" placeholder="产品产地" data-mini="true"  autocomplete="off" maxlength="20"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>产品属地:</td>
				    			<td><input type="text" id="productproductLocation${myid}" name="product.productLocation" placeholder="产品属地" data-mini="true"  autocomplete="off" maxlength="20"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>价　　格:</td>
				    			<td><input type="text" id="productproductPrice${myid }" name="product.productPrice" placeholder="产品价格" data-mini="true" value="" autocomplete="off" maxlength="10"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>数　　量:</td>
				    			<td><input type="text" id="productproductNum${myid}" name="product.productNum" placeholder="数量" data-mini="true" value="" autocomplete="off" maxlength="10"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">描　　述:</td>
				    			<td><input type="text" name="product.productDesc" placeholder="描述" data-mini="true"  autocomplete="off" maxlength="100"/></td>
				    		</tr>
				    	</table>
				    </li>
					<li>
					 	<input type="file" data-role="none" name="file" id="uploadImageFileProduct" accept="image/*" capture="camera" value="" class="uploadImageProduct ui-hidden-accessible"/>
					 	<input type="button" data-icon="plus" class="uploadImageProductButton" value="选择图片"/>
					</li>
					<li class="productpublishformbutton">
					 	<input type="submit" value="确认发布" id="productsaveformsubmit${myid}" class="submit"/>
					</li>
				</ul>
				<div class="imagelistdiv" style="padding:5px;"></div>
			</form>
			<script type="text/javascript" language="javascript">
				$(document).on("pageinit", function() {
					$('div.productaddpage').css({
						paddingTop : '0px'
					});
				});
				$('div.productaddpage').bind('pageinit', function() {
					var width = $('div.productaddpage').width() - 11;
					var css = ['<style type="text/css">div.uploadproductdynamicimagediv {text-align:center;height:', width, 'px;width:', width, 'px;}', '<\/style>'];
					$('div.productaddpage').append(css.join(''));
					$('a.productsave${myid}').click(function(e) {
						e.preventDefault();
						$('#productsaveformsubmit${myid}').click();
						return false;
					});
					if ($('script.imagerotate').length == 0) {
						$('head').append('<script type="text/javascript" class="imagerotate" src="${pageContext.request.contextPath}/js/myimagerotate.js"><\/script>');
					}
					if ($('script.fileupload').length == 0) {
						$('head').append('<script type="text/javascript" class="fileupload" src="${STATIC_ROOT}/js/fileupload.js"><\/script>');
					}
// 					$('#productproductValid').scroller('destroy')
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
					$('input.uploadImageProductButton').click(function(e) {
						e.preventDefault();
						$('form li.errorli').remove();
						if ($('div.uploadproductdynamicimagediv').length >= 3) {
							$('<li class="errorli"><div class="error ui-btn-inner">一个产品最多只能发布3张图片.</div></li>').insertBefore('li.productpublishformbutton');
							$('ul.productlistview').listview('refresh');
							return false;
						}
						$('ul.productlistview').listview('refresh');
						$('input.uploadImageProduct[type="file"]').click();
						return false;
					});
					$('form.productform${myid}').submit(function() {
						if ($('form.productform${myid} li.myerror').length > 0) {
							$('li.myerror').remove();
							$('ul.productlistview${myid}').listview('refresh');
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
						if ($('form.productform${myid} input[name="images"]').length == 0) {
							$('.uploadImageProductButton').closest('li').before(['<li class="myerror"><div class="error ui-btn-inner">', '请至少选择一张产品图片', '</div></li>'].join(''));
						}
						if ($('form.productform${myid} li.myerror').length > 0) {
							$('ul.productlistview${myid}').listview('refresh');
							return false;
						}
					});
					$('input.uploadImageProduct[type="file"]').myImageUploded({
						complete: function() {
							if ($('li.fileerror').length > 0) {
								$('li.fileerror').remove();
								$('ul.productlistview${myid}').listview('refresh');
							}
						},
						filenotmatch: function() {
							$('#uploadImageFileProduct').closest('li').before('<li class="fileerror"><div class="error ui-btn-inner">请选择图片(png或jpeg或jpg或gif)</div></li>');
							$('ul.productlistview${myid}').listview('refresh');
							return true;
						},
						load: function(base64, imgType) {
							var listview = $('ul.productlistview${myid}');
							listview.append('<li style="padding:0px;"></li>');
							listview.find('li').last().append($.myImagePart({
								imgClassName: 'uploadproductdynamicimage',
								base64: base64,
								removeImage: function(e) {
									e.preventDefault();
									$(e.target).closest('li').remove();
									$('ul.productlistview${myid}').listview('refresh');
									$('#uploadImageFileProduct').val('');
									return false;
								}
							})).trigger('create');
							$('img.uploadproductdynamicimage').myxoneimage({
								init: true,
								maxHeight: width,
								maxWidth: width,
								canvascomplete: function(event, image, canvas) {
									var $this = $(image);
									var imageType = $.getImageTypeByHtmlImage(image);
									var base64 = canvas.toDataURL(imageType);
									var imgid = $this.data('imageid');
									img = document.getElementById(imgid);
									if (null == img) {
										img = $this.data('image');
										img.setAttribute('width', '100%');
										img.setAttribute('height', '100%');
										image.parentNode.appendChild(img);
										$this.hide();
									}
									$this.closest('li').find('input[name="images"]').val(base64);
									img.src = base64;
								}
							});
							listview.listview('refresh');
						}
					});
					$('a.mybackpagebtn').click(function(e) {
						e.preventDefault();
						myBackPage();
						return false;
					});
				});
			</script>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="3" name="offset"/></jsp:include>
	</div>
	</body>
</html>
