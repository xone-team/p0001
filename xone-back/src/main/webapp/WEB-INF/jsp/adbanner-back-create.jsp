<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户中心</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="common-header.jsp"></jsp:include>
	</head>
	<body>
		<jsp:include page="common-nav.jsp"></jsp:include>
		<div class="container-fluid">
    		<div class="row-fluid">
				<div class="span2">
					<jsp:include page="common-menu.jsp"></jsp:include>
				</div>
				<div class="span10">
					<div class="row-fluid">
						<ul class="breadcrumb">
							<li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li>
							<li class="active">发布广告</li>
						</ul>
					</div>
					<form class="form-horizontal" id="adbannerSaveForm${identify}" method="post" action="${pageContext.request.contextPath}/adbanner/adbannerSave.html">
						<div class="control-group">
							<label class="control-label" for="refId">相关编号</label>
							<div class="controls">
								<input type="text" id="refId" name="adbanner.refId" maxlength="20" placeholder="相关编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adType">广告类型</label>
							<div class="controls">
								<input type="text" id="adType" name="adbanner.adType" maxlength="2" placeholder="广告类型">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adRefId">相关编号</label>
							<div class="controls">
								<input type="text" id="adRefId" name="adbanner.adRefId" maxlength="20" placeholder="相关编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adStart">开始时间</label>
							<div class="controls">
								<input type="text" id="adStart" name="adbanner.adStart" maxlength="19" placeholder="开始时间">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adEnd">结束时间</label>
							<div class="controls">
								<input type="text" id="adEnd" name="adbanner.adEnd" maxlength="19" placeholder="结束时间">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userId">用户编号</label>
							<div class="controls">
								<input type="text" id="userId" name="adbanner.userId" maxlength="20" placeholder="用户编号">
							</div>
						</div>
						<div class="control-group fileupload">
							<input type="file" id="uploadImageFile" name="image" value="">
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">提交创建</button>
								<button type="button" class="btn" onclick="$('#uploadImageFile').click();">上传图片</button>
							</div>
						</div>
						<div class="control-group uploadimagesdiv" style="margin-bottom:0px;"></div>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
		<script type="text/javascript" language="javascript">
		$(document).ready(function() {
			$('div.fileupload').hide();
			$('#uploadImageFile[type="file"]').bind('change', handleFileSelect);
			$('#adbannerSaveForm${identify}').submit(function() {
				var $form = $('#adbannerSaveForm${identify}');
				$form.find('div.alert').remove();
				if ('' == $('#uploadImageFile[type="file"]').val()) {
					$form.append(alertMessage('错误', '请选择图片再提交'));
					return false;
				}
				return true;
			});
		});
		function alertMessage(title, msg) {
			return ['<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">&times;</button>',
			'<strong style="margin-right:10px;">', title, '</strong>', msg,
			'</div>'].join('');
		}
		function removeProductDynamicImage() {
			$('div.uploadimagesdiv').html('');
			$('#uploadImageFile').val('');
			return false;
		}
		function getExt(v) {
			var a = v.split('.');
			return a[a.length - 1];
		}
		function handleFileSelect(evt) {
			var files = evt.target.files;
			for (var i = 0, f; f = files[i]; i++) {
				var reader = new FileReader();
				reader.onload = (function(theFile) {
					return function(e) {
						var div = document.createElement('div');
						var result = e.target.result.replace(/data:base64,/, 'data:image/' + getExt(theFile.name) + ';base64,');
						div.innerHTML = ['<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeProductDynamicImage();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadproductdynamicimage" src="', result, '" title="', escape(theFile.name), '"/></div>'].join('');
						$('div.uploadimagesdiv').html('').append(div);
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
	</body>
</html>
