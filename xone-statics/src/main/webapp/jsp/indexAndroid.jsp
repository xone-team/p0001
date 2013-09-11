<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<title>Hello World</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.3.1.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mobile-1.3.1.min.js"></script>
</head>
<body>
	<div data-role="page">
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-backbtn="false" data-position="fixed">
			<h1>Widgets</h1>
		</div>
		<div data-role="content">
			<ul data-role="listview" data-inset="true" data-filter="true" data-theme="d" data-divider-theme="d" data-icon="false" data-filter-placeholder="Search widgets..." data-global-nav="demos">
	            <li data-role="list-divider">Widget reference</li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="accordions collapsible sets content formatting grouped inset mini"><a href="${pageContext.request.contextPath}/jsp/accordion.jsp">Accordion</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="ajax navigation navigate event method"><a href="${pageContext.request.contextPath}/jsp/navigation.jsp" data-ajax="false">AJAX Navigation</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="autocomplete filter reveal listviews remote listviewbeforefilter placeholder"><a href="${pageContext.request.contextPath}/jsp/autocomplete.jsp" data-ajax="false">Autocomplete</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="buttons inputs forms inline theme grouped icons mini disabled"><a href="${pageContext.request.contextPath}/jsp/buttons.jsp">Buttons</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="checkboxes checkboxradio inputs forms mini disabled"><a href="${pageContext.request.contextPath}/jsp/checkboxes.jsp">Checkboxes</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="collapsibles content formatting"><a href="${pageContext.request.contextPath}/jsp/collapsibles.jsp">Collapsibles</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="controlgroups selects checkboxradio buttons horizontal vertical"><a href="widgets/controlgroups/">Controlgroup</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="dialogs modal popups"><a href="widgets/dialog/">Dialogs</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="fixed toolbars headers footers sections fullscreen"><a href="widgets/fixed-toolbars/">Fixed toolbars</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="flip toggle switch binary slider selects forms disabled"><a href="widgets/sliders/switch.html" data-ajax="false">Flip switch toggle</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="footer toolbars footers sections"><a href="widgets/footers/">Footer toolbar</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="forms inputs slider button range toggle switch label disabled accessible fieldcontains elements"><a href="widgets/forms/">Form elements</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="grids columns blocks content formatting rwd responsive"><a href="widgets/grids/">Grids</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="header toolbars fixed fullscreen sections"><a href="widgets/headers/">Header toolbar</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="icons buttons disc position"><a href="widgets/icons/">Icons</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="links navigation ajax prefetch cache"><a href="widgets/links/">Links</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="listviews thumbnails icons nested split button collapsible ul ol"><a href="widgets/listviews/" data-ajax="false">Listviews</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="ajax loader overlay spinner pages"><a href="widgets/loader/" data-ajax="false">Loader overlay</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="navbars navmenu toolbars links icons footer header"><a href="widgets/navbar/" data-ajax="false">Navbar</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="navbars persistent header footer links navmenu"><a href="widgets/fixed-toolbars/footer-persist-a.html">Navbar, persistent</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="pages single multipage templates ajax nav"><a href="widgets/pages/">Pages</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="panels sliding nav modal transition display reveal overlay push rwd responsive"><a href="widgets/panels/">Panels <span class="ui-li-count">New</span></a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="popup dialog modal transition tooltip lightbox form overlay screen flip pop fade transition"><a href="widgets/popup/">Popup</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="radiobuttons checkboxradio inputs forms disabled grouped"><a href="widgets/radiobuttons/">Radio buttons</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="selectmenus custom native multiple optgroup disabled forms"><a href="widgets/selects/">Select</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="slider, single sliders range inputs forms disabled"><a href="widgets/sliders/" data-ajax="false">Slider, single</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="slider, dual range sliders rangesliders inputs forms disabled"><a href="widgets/sliders/rangeslider.html" data-ajax="false">Slider, dual range <span class="ui-li-count">New</span></a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="tables column th td toggle responsive tables rwd hide show tabular"><a href="widgets/table-column-toggle/">Table, column toggle <span class="ui-li-count">New</span></a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="tables reflow th td responsive rwd columns tabular"><a href="widgets/table-reflow/">Table, reflow <span class="ui-li-count">New</span></a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="text inputs textarea numeric email tel file date time month clear pattern placeholder forms"><a href="widgets/textinputs/">Text inputs & textarea</a></li>
				<li data-section="Widgets" data-transition="slide" data-filtertext="page transitions animated pages ajax navigation flip slide fade pop" data-ajax="false"><a href="widgets/transitions/" data-ajax="false">Transitions</a></li>
			</ul>
		</div>
		<div data-id="myfooter" data-role="footer" data-position="fixed">
			<div data-role="navbar" data-iconpos="left">
				<ul>  
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp?footer=0" data-transition="slide" class="ui-btn-active ui-state-persist" data-icon="gear">Widgets</a></li>  
					<li><a href="${pageContext.request.contextPath}/jsp/listviewAndroid.jsp" data-transition="slide" data-ajax="false" data-icon="refresh">List</a></li>
					<li><a href="${pageContext.request.contextPath}/product/index.html" data-transition="slide" data-icon="grid">Products</a></li>
					<li><a href="${pageContext.request.contextPath}/login/index.html" data-transition="slide" data-icon="home">Login</a></li>
				</ul>
			</div
		</div>
	</div>
</body>
</html>
