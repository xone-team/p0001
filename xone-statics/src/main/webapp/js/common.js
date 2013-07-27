/**
 * back后台执行js
 */
function alertMessage(title, msg) {
	return ['<div class="alert alert-error" style="margin-bottom:0px;"><button type="button" class="close" data-dismiss="alert">&times;</button>',
	'<strong style="margin-right:10px;">', title, '</strong>', msg,
	'</div>'].join('');
}