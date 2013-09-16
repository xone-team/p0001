<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${STATIC_ROOT}/css/jquery.mobile-1.3.2.min.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/css/themes-a/my-theme-a.min.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/css/msg.css" />
<script type="text/javascript" src="${STATIC_ROOT}/js/jquery-1.10.0.min.js"></script>
<script type="text/javascript">
$(document).bind("mobileinit", function() {  
	$.extend($.mobile, {
		defaultPageTransition:'none',
		defaultDialogTransition:'none',
		pageLoadErrorMessage: '网络不给力呀',
		loadingMessageTheme: 'a',
		loadingMessage: '系统正在加载请求的数据，请稍候...',
		loadingMessageTextVisible: true
	});
});
function debug(i) {
	var activePage = $.mobile.activePage;
	var c = activePage.find('div.debug');
	if (c.length == 0) {
		activePage.append('<div class="debug">&nbsp;</div>');
		c = activePage.find('div.debug');
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
function checkboxValue(selector) {
	var v = '';
	$(selector).each(function() {
		if (this.value != '') {
			v += ',' + this.value;
		}
	});
	if (v == '') {
		return v;
	}
	v = v.replace(/^,/ig, '');
	return v;
}
function loadScript(src, callback, className) {
	var script = document.createElement("script");
	script.setAttribute('type', 'text/javascript');
	script.className = className;
	if (script.addEventListener) {
		script.addEventListener("load", callback, false);
	} else if (script.attachEvent) {
		script.attachEvent("onreadystatechange", function() {
			loadScript.callbackIE(callback);
		});
	}
	script.src = src;
	document.getElementsByTagName("head")[0].appendChild(script);
}
loadScript.callbackIE = function(callback) {
	var target = window.event.srcElement;
	if (target.readyState == "loaded") {
		callback.call(target);
	}
};
</script>
<script type="text/javascript" src="${STATIC_ROOT}/js/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myadbanner.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mydiffandroidiphone.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myallcheckbox.js"></script>
<script type="text/javascript">
	$(document).delegate($.mobile.activePage, 'pageshow', function() {
		$.iphoneCssFixed();
		var interval = $('body').data('_globalinterval');
		if (interval) {
			clearInterval(interval);
		}
		interval= setInterval('globalBannerSwitch();', 5 * 1000);
		$('body').data('_globalinterval', interval);
	});
	globalAdBanner();
	function globalAdBanner() {
		$('body').myadbanner({
			url: '${pageContext.request.contextPath}/adbanner/index.html',
			data: {
				'_': new Date().getTime()
			}
		});
	}
</script>
