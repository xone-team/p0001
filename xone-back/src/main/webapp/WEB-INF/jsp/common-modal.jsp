<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="myidentify" value="${param.myidentify}"/>
<div id="windowTitleDialog${myidentify}" class="modal hide fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-header">
		<a href="#" class="close" data-dismiss="modal">&times;</a>
		<div>${param.title}</div>
	</div>
	<div class="modal-body">
		<div class="divDialogElements" id="windowmodalbody${myidentify}">
			<div class="progress progress-striped active">
			  <div class="bar" style="width: 80%;"></div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" onclick="$('#windowTitleDialog${myidentify}').modal('hide');">取消</a>
		<a href="#" class="btn btn-primary" onclick="$('#windowTitleDialog${myidentify}').modal('hide');">确定</a>
	</div>
	<script type="text/javascript">
	$('#windowTitleDialog${myidentify}').on('shown', function() {
		if (!$('#windowTitleDialog${myidentify}').data('show')) {
			$.ajax({
				type: 'get',
				url: '${param.url}',
				success: function(html) {
					$('#windowmodalbody${myidentify}').html(html);
					$('#windowTitleDialog${myidentify}').data('show', true);
				}
			});
		}
	});
	</script>
</div>
