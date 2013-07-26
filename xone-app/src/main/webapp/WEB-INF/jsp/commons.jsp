<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${STATIC_ROOT}/css/jquery.mobile-1.3.1.min.css" />
	<link rel="stylesheet" href="${STATIC_ROOT}/css/msg.css" />
<style type="text/css">
.ui-content {
	padding-top: 0px;
	padding-left: 5px;
	padding-right: 5px;
}
.ui-mybanner {
	height: 40px;
	width: 100%;
	border: 1px solid gray;
	text-align: center;
	overflow: hidden;
}
.ui-mybanner ul {
	padding:0px;
	margin:0px;
	width:100%;
}
.ui-mybanner ul li {
	padding:0px;
	margin:0px;
	width:100%;
}
.ui-mybanner-link {
	height: 40px;
	overflow: hidden;
}
.ui-mybanner-link a {
	clear:both;
	top:0px;
	margin:0px;
}
</style>
<script type="text/javascript" src="${STATIC_ROOT}/js/jquery-1.10.0.min.js"></script>
<c:if test="${param.bootstrap == true}">
	<link rel="stylesheet" href="${STATIC_ROOT}/bootstrap/css/bootstrap.min.css" />
	<script type="text/javascript" src="${STATIC_ROOT}/bootstrap/js/bootstrap.min.js"></script>
</c:if>
<script type="text/javascript">
$(document).bind("mobileinit", function() {  
	$.extend($.mobile, {
		defaultPageTransition:'slide',
		defaultDialogTransition:'slideup',
		linkBindingEnabled: true,
		pageLoadErrorMessage: '哇～～网络不给力呀！',
		transitionFallbacks: 'slidedown',
		pushStateEnabled: false,
		loadingMessageTheme: 'e',
		loadingMessage: '系统正在加载请求的数据，请稍候...',
		loadingMessageTextVisible: true,
		hashListeningEnabled: false
	});
});
function console(i) {
	var activePage = $.mobile.activePage;
	var c = activePage.find('div.console');
	if (c.length == 0) {
		activePage.append('<div class="console">&nbsp;</div>');
		c = activePage.find('div.console');
	}
	c.append('<div>' + i + '</div>');
}
function appendImageAttr(t) {
	var activePage = $.mobile.activePage;
    var sw = activePage.width();
    if (parseInt(t.width, 10) > parseInt(sw, 10)) {
    	t.style.width = sw + 'px';
    	t.width = sw + 'px';
    }
    if (parseInt(t.height, 10) > 40) {
    	t.style.height = 40 + 'px';
    	t.height = 40 + 'px';
    }
}
function globalBannerSwitch() {
	var activePage = $.mobile.activePage;
	var activeHeader = activePage.find('div[data-role="header"]');
	var banner = activeHeader.find('div.ui-mybanner');
	var li = banner.find('li.ui-mybanner-link');
	if (li.length <= 1) {
		return;
	}
	var cs = banner.find('li.ui-mybanner-link:visible');
	var next = cs.next('li');
	if (next.length == 0) {
		next = li.first();
	}
	li.hide();
	next.show('slow');
}
</script>
<script type="text/javascript" src="${STATIC_ROOT}/js/jquery.mobile-1.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myadbanner.js"></script>
<<script type="text/javascript">
<!--
	$(document).delegate($.mobile.activePage, 'pageshow', function() {
		var interval = $('body').data('_globalinterval');
		if (interval) {
			clearInterval(interval);
		}
		interval= setInterval('globalBannerSwitch();', 5 * 1000);
		$('body').data('_globalinterval', interval);
	});
// 	$(document).delegate($.mobile.activePage, 'pageload', function() {
// 		if ($('div[data-role="page"']).length <= 3) {
// 			$('div[data-role="page"]:not(.ui-page-active)').stop().hide();
// 		}
// 	});
	globalAdBanner();
	function globalAdBanner() {
		$('body').myadbanner({
			url: '${pageContext.request.contextPath}/adbanner/index.html',
			data: {
				'_': new Date().getTime()
			}
		});
	}
//-->
</script>
