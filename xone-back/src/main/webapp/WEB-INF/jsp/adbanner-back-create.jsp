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
		<link href="${STATIC_ROOT}/bootstrap-select/bootstrap-select.css" rel="stylesheet">
	</head>
	<body>
		<c:set  var="myidentify" value="${myidentify}"/>
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
							<li><a href="${pageContext.request.contextPath}/adbanner/adbannerList.html">广告列表</a> <span class="divider">/</span></li>
							<li class="active">发布广告</li>
						</ul>
					</div>
					<form class="form-horizontal" enctype="multipart/form-data" id="adbannerSaveForm${myidentify}" method="post" action="${pageContext.request.contextPath}/adbanner/adbannerSave.html">
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
								<input type="text" id="refId" name="adbanner.refId" maxlength="20" placeholder="产品编号" readonly="readonly">
								<input type="hidden" id="refName" name="" maxlength="20" placeholder="相关编号" readonly="readonly">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userId">选择用户</label>
							<div class="controls">
								<input type="text" id="userId" name="adbanner.userId" maxlength="20" placeholder="用户编号" readonly="readonly">
								<input type="hidden" id="userName" name="" maxlength="20" placeholder="用户名称" readonly="readonly">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adStart">开始时间</label>
							<div class="controls">
								<div class="input-append date datepicker adbanneradstart" data-date-format="yyyy-mm-dd">
									<input type="text" id="adStart" name="adbanner.adStart" maxlength="19" placeholder="开始时间" readonly>
									<span class="add-on"><i class="icon-th"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="adEnd">结束时间</label>
							<div class="controls">
								<div class="input-append date datepicker adbanneradend" data-date-format="yyyy-mm-dd">
									<input type="text" id="adEnd" name="adbanner.adEnd" maxlength="19" placeholder="结束时间" readonly>
									<span class="add-on"><i class="icon-th"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group fileupload" style="display:none;">
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
		<script src="${STATIC_ROOT}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="${STATIC_ROOT}/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script src="${STATIC_ROOT}/bootstrap-select/bootstrap-select.min.js"></script>
		<script src="${STATIC_ROOT}/js/fileupload.js"></script>
		<jsp:include page="common-modal.jsp">
			<jsp:param name="myidentify" value="userinfo"/>
			<jsp:param name="title" value="请选择一个用户"/>
			<jsp:param name="url" value="${pageContext.request.contextPath }/user/userListAjax.html"/>
		</jsp:include>
		<jsp:include page="common-modal.jsp">
			<jsp:param name="myidentify" value="Product"/>
			<jsp:param name="title" value="请选择广告对应的售卖产品"/>
			<jsp:param name="url" value="${pageContext.request.contextPath }/product/productListAjax.html"/>
		</jsp:include>
		<jsp:include page="common-modal.jsp">
			<jsp:param name="myidentify" value="Purchase"/>
			<jsp:param name="title" value="请选择广告对应的购买产品"/>
			<jsp:param name="url" value="${pageContext.request.contextPath }/purchase/purchaseListAjax.html"/>
		</jsp:include>
		<script type="text/javascript">
		$(document).ready(function() {
			$('#windowTitleDialoguserinfo').delegate('a.userinfoselect', 'click', function(e) {
				e.preventDefault();
				var $this = $(this);
				$('#userId').val($this.attr('attr-id'));
				$this.closest('div.modal').modal('hide');
				return false;
			});
			$('#windowTitleDialogProduct').delegate('a.productselectinfo', 'click', function(e) {
				e.preventDefault();
				var $this = $(this);
				$('#refId').val($this.attr('attr-id'));
				$this.closest('div.modal').modal('hide');
				return false;
			});
			$('#windowTitleDialogPurchase').delegate('a.purchaseselectinfo', 'click', function(e) {
				e.preventDefault();
				var $this = $(this);
				$('#refId').val($this.attr('attr-id'));
				$this.closest('div.modal').modal('hide');
				return false;
			});
		});
		</script>
		<script type="text/javascript" language="javascript">
		$(document).ready(function() {
			$("#X_menu_li_adbanner").addClass("active");
			$('#uploadImageFile[type="file"]').fileupload({
				onload:function(it, e) {
					var div = document.createElement('div');
					var result = it.data('base64source');
					div.innerHTML = ['<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeProductDynamicImage();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadproductdynamicimage" src="', result, '"/></div>'].join('');
					$('div.uploadimagesdiv').html('').append(div);
				}
			});
			$('#adbannerSaveForm${myidentify}').submit(function() {
				var $form = $('#adbannerSaveForm${myidentify}');
				$form.find('div.alert').remove();
				if ('' == $('#uploadImageFile[type="file"]').val()) {
					$form.append(alertMessage('错误', '请选择图片再提交'));
					return false;
				}
				var validate = [{
					id: 'userId',
					name: '请选择用户'
				},{
					id: 'refId',
					name: '请选择产品'
				},{
					id: 'adStart',
					name: '请选择开始时间'
				},{
					id: 'adEnd',
					name: '请选择结束时间'
				}];
				for (var i = 0; i < validate.length; i++) {
					var v = validate[i];
					if ($('#' + v.id).val() == '') {
						$('#' + v.id).closest('div.control-group').append(alertMessage('错误', v.name));
					}
				}
				if ($form.find('div.alert').length > 0) {
					return false;
				}
				return true;
			});
			$('.adbanneradstart, .adbanneradend').datepicker();
			$('.selectpicker').selectpicker({style: 'btn-info'});
			$('#userId').click(function() {
				$('#windowTitleDialoguserinfo').modal('show');
			});
			$('#refId').click(function() {
				if ($('#adType').val() == '0') {
					$('#windowTitleDialogProduct').modal('show');
				} else {
					$('#windowTitleDialogPurchase').modal('show');
				}
			});
			$('#adType').bind('change', function() {
				$('#refId').val('');
				$('#refName').val('');
			})
		});
		function alertMessage(title, msg) {
			return ['<div class="alert alert-error" style="margin-bottom:0px;"><button type="button" class="close" data-dismiss="alert">&times;</button>',
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
