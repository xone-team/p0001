<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${STATIC_ROOT}/css/jquery.mobile-1.3.1.min.css" />
<<style type="text/css">
<!--
.ui-page { -webkit-backface-visibility: hidden; }
-->
</style>
<script type="text/javascript" src="${STATIC_ROOT}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">  
$(document).bind("mobileinit", function() {  
// 	if (navigator.userAgent.indexOf("Android") != -1) {  
// 		$.mobile.defaultPageTransition = 'none';  
// 		$.mobile.defaultDialogTransition = 'none';  
// 	}
	$.extend($.mobile, {
		defaultPageTransition:'none',
		defaultDialogTransition:'none'
	});
});
</script>  
<script type="text/javascript" src="${STATIC_ROOT}/js/jquery.mobile-1.3.1.min.js"></script>
