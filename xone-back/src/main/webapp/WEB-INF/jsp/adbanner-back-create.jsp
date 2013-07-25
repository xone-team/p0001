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
		<link href="${STATIC_ROOT}/bootstrap-datepicker/css/datepicker.css" rel="stylesheet">
		<link href="${STATIC_ROOT}/bootstrap-datepicker/css/bootstrap-select.css" rel="stylesheet">
		<link href="${STATIC_ROOT}/bootstrap-select/bootstrap-select.css" rel="stylesheet">
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
					<form class="form-horizontal" enctype="multipart/form-data" id="adbannerSaveForm${identify}" method="post" action="${pageContext.request.contextPath}/adbanner/adbannerSave.html">
						<div class="control-group">
							<label class="control-label" for="adType">广告类型</label>
							<div class="controls">
								<select class="selectpicker" id="adType" name="adbanner.adType" maxlength="2" placeholder="广告类型">
									<option value="0">售卖产品</option>
									<option value="1">购买产品</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="refId">选择产品</label>
							<div class="controls">
								<input type="text" id="refId" name="adbanner.refId" maxlength="20" placeholder="相关编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userId">选择用户</label>
							<div class="controls">
								<input type="text" id="userId" name="adbanner.userId" maxlength="20" placeholder="用户编号">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adStart">开始时间</label>
							<div class="controls">
								<div class="input-append date datepicker adbanneradstart" data-date="2013-02-14" data-date-format="yyyy-mm-dd">
									<input type="text" id="adStart" name="adbanner.adStart" maxlength="19" placeholder="开始时间" readonly>
									<span class="add-on"><i class="icon-th"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adEnd">结束时间</label>
							<div class="controls">
								<div class="input-append date datepicker adbanneradend" data-date="2013-02-14" data-date-format="yyyy-mm-dd">
									<input type="text" id="adEnd" name="adbanner.adEnd" maxlength="19" placeholder="结束时间" readonly>
									<span class="add-on"><i class="icon-th"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group fileupload">
							<input type="file" id="uploadImageFile" name="uploadFile" value="">
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
		<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
		<script src="${STATIC_ROOT}/js/fileupload.js"></script>
		<script type="text/javascript" language="javascript">
		$(document).ready(function() {
			$('div.fileupload').hide();
			$('#uploadImageFile[type="file"]').fileupload({
				onload:function(it, e) {
					var div = document.createElement('div');
					var result = it.data('base64source');
					div.innerHTML = ['<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeProductDynamicImage();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadproductdynamicimage" src="', result, '"/></div>'].join('');
					$('div.uploadimagesdiv').html('').append(div);
				}
			});
			$('#adbannerSaveForm${identify}').submit(function() {
				var $form = $('#adbannerSaveForm${identify}');
				$form.find('div.alert').remove();
				if ('' == $('#uploadImageFile[type="file"]').val()) {
					$form.append(alertMessage('错误', '请选择图片再提交'));
					return false;
				}
				return true;
			});
			$('.adbanneradstart, .adbanneradend').datepicker();
			$('.selectpicker').selectpicker({style: 'btn-info'});
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
		</script>
	</body>
</html>
