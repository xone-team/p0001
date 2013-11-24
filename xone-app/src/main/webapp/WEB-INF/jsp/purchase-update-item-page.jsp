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
	<div data-role="page" class="purchaseupdateitempage" data-dom-cache="false">
<%-- 		<link rel="stylesheet" href="${STATIC_ROOT}/mobiscroll/css/mobiscroll.core-2.6.2.css" /> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2.js"></script> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.datetime-2.6.2.js"></script> --%>
<%-- 		<script type="text/javascript" src="${STATIC_ROOT}/mobiscroll/js/mobiscroll.core-2.6.2-zh.js"></script> --%>
		<div data-id="myheader" data-role="header" data-position="fixed">
<%-- 			<a href="${pageContext.request.contextPath}/purchase/itemForUser.html?_=${myid}&purchase.id=${purchase.id}" data-icon="check" class="btn-banner">返回</a> --%>
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>更新购买发布</h1>
			<a href="#" data-icon="check" data-role="button" class="purchaseupdateclick ui-btn-right">更新</a>
		</div>
		<div class="purchaseupdateitemcontent" data-role="content" data-dom-cache="false">
			<form class="purchaseupdateitemform${myid}" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/purchase/update.html?_=${myid}" autocomplete="off">
				<input type="hidden" name="purchase.id" value="${purchase.id}" />
				<ul class="purchaseupdateitemlistview${myid}" data-role="listview" data-inset="true" data-mini="true">
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>产品名称:</td>
				    			<td><input type="text" id="purchasepurchaseName${myid}" name="purchase.purchaseName" placeholder="产品名称" data-mini="true" value="${purchase.purchaseName}" autocomplete="off" maxlength="20"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>产品类型:</td>
				    			<td>
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
				    			<td class="mylabel"><span class="required">*</span>产品产地:</td>
				    			<td><input type="text" id="purchasepurchaseAddress${myid}" name="purchase.purchaseAddress" placeholder="产品产地" data-mini="true" value="${purchase.purchaseAddress}" autocomplete="off" maxlength="20"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>产品属地:</td>
				    			<td><input type="text" id="purchasepurchaseLocation${myid}" name="purchase.purchaseLocation" placeholder="产品属地" data-mini="true" value="${purchase.purchaseLocation}" autocomplete="off" maxlength="20"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel"><span class="required">*</span>数　　量:</td>
				    			<td><input type="text" id="purchasepurchaseNum${myid}" name="purchase.purchaseNum" placeholder="数量" data-mini="true" value="${purchase.purchaseNum}" autocomplete="off" maxlength="10"/></td>
				    		</tr>
				    	</table>
				    </li>
				    <li>
				    	<table style="width:100%">
				    		<tr>
				    			<td class="mylabel">描　　述:</td>
				    			<td><input type="text" name="purchase.purchaseDesc" placeholder="描述" data-mini="true" value="${purchase.purchaseDesc}" autocomplete="off" maxlength="100"/></td>
				    		</tr>
				    	</table>
				    </li>
					<li>
					 	<input type="file" data-role="none" name="file" id="uploadUpdateItemImageFile${myid}" accept="image/*" capture="camera" value="" class="uploadImage ui-hidden-accessible"/>
					 	<input type="button" data-icon="plus" class="uploadImageButtonUpdateItem${myid}" value="选择图片"/>
					</li>
					<li class="publishupdateitemformbutton">
					 	<input type="submit" value="确认更新" id="purchasesaveformsubmit${myid}" class="submit"/>
					</li>
					<c:forEach var="item" items="${purchase.ids}" varStatus="i">
					<li data-role="none" style="padding:0px;">
						<div class="mybuttonarea" data-role="controlgroup" data-type="horizontal" data-mini="true" align="right">
							<a href="#" onclick="return removeUpdatePurchaseItemDynamicImage(this);" data-role="button" data-theme="e" data-icon="delete" title="删除图片">删除图片</a>
						</div>
						<div class="uploadupdateitemdynamicimagepurchasediv">
							<img class="uploadupdateitemdynamicimageserver" width="100%" height="100%" src="${pageContext.request.contextPath}/assistant/image.html?id=${item}"/>
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
					var css = ['<style type="text/css">div.uploadupdateitemdynamicimagepurchasediv {text-align:center;height:', width, 'px;width:', width, 'px;}', '<\/style>'];
					$('div.purchaseupdateitempage').append(css.join(''));
					if ($('script.imagerotate').length == 0) {
						$('head').append('<script type="text/javascript" class="imagerotate" src="${pageContext.request.contextPath}/js/myimagerotate.js"><\/script>');
					}
					if ($('script.fileupload').length == 0) {
						$('head').append('<script type="text/javascript" class="fileupload" src="${STATIC_ROOT}/js/fileupload.js"><\/script>');
					}
					var purchaseType = $('select[name="purchase.purchaseType"] option[value="${purchase.purchaseType}"]').attr('selected', 'selected');
					$('select[name="purchase.purchaseType"]').siblings('span.ui-btn-inner').find('span.ui-btn-text span').text(purchaseType.text());
					$('a.purchaseupdateclick').click(function(e) {
						e.preventDefault();
						$('#purchasesaveformsubmit${myid}').click();
						return false;
					});
					$('form.purchaseupdateitemform${myid}').submit(function() {
						if ($('form.purchaseupdateitemform${myid} li.myerror').length > 0) {
							$('li.myerror').remove();
							$('ul.purchaseupdateitemlistview${myid}').listview('refresh');
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
						if ($('form.purchaseupdateitemform${myid} li.myerror').length > 0) {
							$('ul.purchaseupdateitemlistview${myid}').listview('refresh');
							return false;
						}
					});
// 					$('#purchaseupdatepurchasevalid').scroller('destroy')
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
					$('input.uploadImageButtonUpdateItem${myid}').click(function(e) {
						e.preventDefault();
						$('form li.errorli').remove();
						if ($('div.uploadupdateitemdynamicimagepurchase').length >= 3) {
							$('<li class="errorli"><div class="error ui-btn-inner">一个产品最多只能发布3张图片.</div></li>').insertBefore('li.publishupdateitemformbutton');
							$('ul.purchaseupdateitemlistview${myid}').listview('refresh');
							return false;
						}
						$('ul.purchaseupdateitemlistview${myid}').listview('refresh');
						$('#uploadUpdateItemImageFile${myid}').click();
						return false;
					});
					$('#uploadUpdateItemImageFile${myid}').myImageUploded({
						complete: function() {
							if ($('li.fileerror').length > 0) {
								$('li.fileerror').remove();
								$('ul.purchaseupdateitemlistview${myid}').listview('refresh');
							}
						},
						filenotmatch: function() {
							$('#uploadUpdateItemImageFile').closest('li').before('<li class="fileerror"><div class="error ui-btn-inner">请选择图片(png或jpeg或jpg或gif)</div></li>');
							$('ul.purchaseupdateitemlistview${myid}').listview('refresh');
							return true;
						},
						load: function(base64, imgType) {
							var listview = $('ul.purchaseupdateitemlistview${myid}');
							listview.append('<li style="padding:0px;"></li>');
							listview.find('li').last().append($.myImagePart({
								imgClassName: 'uploadupdateitemdynamicimagepurchase',
								base64: base64,
								removeImage: function(e) {
									e.preventDefault();
									$(e.target).closest('li').remove();
									$('ul.purchaseupdateitemlistview${myid}').listview('refresh');
									$('#uploadUpdateItemImageFile${myid}').val('');
									return false;
								}
							})).trigger('create');
							$('img.uploadupdateitemdynamicimagepurchase').myxoneimage({
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
				});
				function removeUpdatePurchaseItemDynamicImage(e) {
					$(e).closest('li').remove();
					$('ul.purchaseupdateitemlistview${myid}').listview('refresh');
					$('#uploadUpdateItemImageFile').val('');
					return false;
				}
			</script>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="4" name="offset"/></jsp:include>
	</div>
	</body>
</html>
