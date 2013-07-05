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
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp" data-transition="turn" data-icon="back">back</a>
			<h1>Buttons</h1>
		</div>
		<div data-role="content" class="jqm-content">
			<h1>Buttons <a href="http://api.jquerymobile.com/button/" data-ajax="false" data-role="button" data-inline="true" data-mini="true" data-icon="arrow-r" data-iconpos="right" class="jqm-api-link">API</a></h1>
			<p class="jqm-intro">Buttons are core widgets in jQuery Mobile and are used within a wide range of other plugins. The button markup is flexible and can be created from links or form buttons.</p>
			<h2 id="button-markup">Basic markup</h2>
			<p>Use anchor links (<code>a</code> elements) to mark up navigation buttons, and <code>input</code> or <code>button</code> elements for form submission. By default, all buttons in the body content are styled as block-level elements so they fill the width of the screen:</p>
			<div data-demo-html="true">
				<a href="#" data-role="button">Anchor</a>
				<form>
					<button>Button</button>
					<input type="button" value="Input">
					<input type="submit" value="Submit">
					<input type="reset" value="Reset">
				</form>
			</div>
			<h2 id="button-inline">Inline</h2>
			<p>If you have multiple buttons that should sit side-by-side on the same line, add the <code>data-inline="true"</code> attribute to each button. This will style the buttons to be the width of their content so the buttons sit on the same line. </p>
			<div data-demo-html="true">
				<p>
					<a href="#" data-role="button" data-inline="true">True</a>
					<a href="#" data-role="button" data-inline="true">False</a>
				</p>
			</div>
			<h2 id="button-theme">Theme</h2>
			<p>Buttons can be manually assigned any of the button color swatches from the theme to add visual contrast with their container by adding the <code> data-theme</code> attribute on the button markup and specifying a swatch letter. When a link is added to a container, it is automatically assigned a theme swatch letter that matches its parent bar or content box to visually integrate the button into the parent container, like a chameleon.</p>
			<div data-demo-html="true">
				<p>
					<a href="#" data-role="button" data-theme="a" data-inline="true">A</a>
					<a href="#" data-role="button" data-theme="b" data-inline="true">B</a>
					<a href="#" data-role="button" data-theme="c" data-inline="true">C</a>
					<a href="#" data-role="button" data-theme="d" data-inline="true">D</a>
					<a href="#" data-role="button" data-theme="e" data-inline="true">E</a>
				</p>
			</div>
			<h2 id="button-mini">Mini</h2>
			<p>For a more compact version that is useful in toolbars and tight spaces, add the <code>data-mini="true"</code> attribute to the button to create a mini version</a>. </p>
			<div data-demo-html="true">
				<p>
					<a href="#" data-role="button" data-mini="true" data-inline="true">Cancel</a>
					<a href="#" data-role="button" data-mini="true" data-inline="true" data-icon="check" data-theme="b">Place order</a>
				</p>
			</div>
			<h2 id="button-icons">Icons</h2>
			<p>An <a href="../icons/">icon</a> can be added to a button by adding a <code> data-icon</code> attribute on the anchor specifying the icon to display.</p>
			<div data-demo-html="true">
				<a href="#" data-role="button" data-icon="plus" data-iconpos="notext" data-theme="c" data-inline="true">Plus</a>
				<a href="#" data-role="button" data-icon="minus" data-iconpos="notext" data-theme="c" data-inline="true">Minus</a>
				<a href="#" data-role="button" data-icon="delete" data-iconpos="notext" data-theme="c" data-inline="true">Delete</a>
				<a href="#" data-role="button" data-icon="arrow-l" data-iconpos="notext" data-theme="c" data-inline="true">Arrow left</a>
				<a href="#" data-role="button" data-icon="arrow-r" data-iconpos="notext" data-theme="c" data-inline="true">Arrow right</a>
				<a href="#" data-role="button" data-icon="arrow-u" data-iconpos="notext" data-theme="c" data-inline="true">Arrow up</a>
				<a href="#" data-role="button" data-icon="arrow-d" data-iconpos="notext" data-theme="c" data-inline="true">Arrow down</a>
				<a href="#" data-role="button" data-icon="check" data-iconpos="notext" data-theme="c" data-inline="true">Check</a>
				<a href="#" data-role="button" data-icon="gear" data-iconpos="notext" data-theme="c" data-inline="true">Gear</a>
				<a href="#" data-role="button" data-icon="refresh" data-iconpos="notext" data-theme="c" data-inline="true">Refresh</a>
				<a href="#" data-role="button" data-icon="forward" data-iconpos="notext" data-theme="c" data-inline="true">Forward</a>
				<a href="#" data-role="button" data-icon="back" data-iconpos="notext" data-theme="c" data-inline="true">Back</a>
				<a href="#" data-role="button" data-icon="grid" data-iconpos="notext" data-theme="c" data-inline="true">Grid</a>
				<a href="#" data-role="button" data-icon="star" data-iconpos="notext" data-theme="c" data-inline="true">Star</a>
				<a href="#" data-role="button" data-icon="alert" data-iconpos="notext" data-theme="c" data-inline="true">Alert</a>
				<a href="#" data-role="button" data-icon="info" data-iconpos="notext" data-theme="c" data-inline="true">Info</a>
		        <a href="#" data-role="button" data-icon="home" data-iconpos="notext" data-theme="c" data-inline="true">Home</a>
		        <a href="#" data-role="button" data-icon="search" data-iconpos="notext" data-theme="c" data-inline="true">Search</a>
				<a href="#" data-role="button" data-icon="bars" data-iconpos="notext" data-theme="c" data-inline="true">Bars</a>
				<a href="#" data-role="button" data-icon="edit" data-iconpos="notext" data-theme="c" data-inline="true">Edit</a>
			</div>
			<h2 id="button-icon-position">Icon position</h2>
			<p>By default, all icons in buttons are placed to the left of the button text. This default may be overridden using the <code> data-iconpos</code> attribute to set the icon to the right, above (top) or below (bottom) the text. You can also create an icon-only button, by setting the <code> data-iconpos</code> attribute to <code>notext</code>. The button plugin will hide the text on-screen, but add it as a <code>title</code> attribute on the link to provide context for screen readers and devices that support tooltips.</p>
			<div data-demo-html="true">
				<a href="#" data-role="button" data-inline="true">Text only</a>
				<a href="#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-inline="true">Left</a>
				<a href="#" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="true">Right</a>
				<a href="#" data-role="button" data-icon="arrow-u" data-iconpos="top" data-inline="true">Top</a>
				<a href="#" data-role="button" data-icon="arrow-d" data-iconpos="bottom" data-inline="true">Bottom</a>
				<a href="#" data-role="button" data-icon="delete" data-iconpos="notext" data-inline="true">Icon only</a>
			</div>
			<h2 id="button-vertical-group">Vertical group</h2>
			<p>To visually group a set of buttons to form a single block, wrap a set of buttons in a container with the <code> data-role="controlgroup"</code> attribute &mdash; the framework will create a vertical button group, remove all margins and drop shadows between the buttons, and only round the first and last buttons of the set to create the effect that they are grouped together. </p>
			<div data-demo-html="true">
				<div data-role="controlgroup">
					<a href="#" data-role="button">Timeline</a>
					<a href="#" data-role="button">Mentions</a>
					<a href="#" data-role="button">Retweets</a>
				</div>
			</div>
			<h2 id="button-horizontal-group">Horizontal group</h2>
			<p>By adding the <code>data-type="horizontal"</code> attribute to the <code>controlgroup</code> container, you can swap to a horizontal-style group that floats the buttons side-by-side and sets the width to only be large enough to fit the content.</p>
			<div data-demo-html="true">
				<div data-role="controlgroup" data-type="horizontal">
					<a href="#" data-role="button">Yes</a>
					<a href="#" data-role="button">No</a>
					<a href="#" data-role="button">Maybe</a>
				</div>
			</div>
			<p>Mini horizontal grouped buttons, icon-only:</p>
			<div data-demo-html="true">
				<div data-role="controlgroup" data-type="horizontal" data-mini="true">
				    <a href="#" data-role="button" data-iconpos="notext" data-icon="plus" data-theme="b">Add</a>
				    <a href="#" data-role="button" data-iconpos="notext" data-icon="delete" data-theme="b">Delete</a>
				    <a href="#" data-role="button" data-iconpos="notext" data-icon="grid" data-theme="b">More</a>
				</div>
			</div>
			<h2 id="button-corners-shadows">Corners & shadows</h2>
			<p>There are options for controlling the rounded corners (<code>data-corners</code>), drop shadow (<code>data-shadow</code>), and icon  shadow for the highlight under the icon disc (<code>data-iconshadow</code>).</p>
			<div data-demo-html="true">
				<a href="#" data-role="button" data-icon="gear" data-theme="b">Default</a>
				<a href="#" data-role="button" data-icon="gear" data-corners="false" data-theme="b">No rounded corners</a>
				<a href="#" data-role="button" data-icon="gear" data-shadow="false" data-theme="b">No button shadow</a>
				<a href="#" data-role="button" data-icon="gear" data-iconshadow="false" data-theme="b">No icon disc shadow</a>
			</div>
			<h2>Disabled</h2>
			<p>Form input or buttons can be disabled via the <code>disabled</code> attribute. Links styled like buttons have all the same visual options as true form-based buttons, but aren't part of the <code>button</code> plugin so the form button methods (enable, disable, refresh) aren't supported. If you need to disable a link-based button (or any element), apply the disabled class ui-disabled yourself with JavaScript to achieve the same effect.</p>
			<div data-demo-html="true">
				<a href="#" data-role="button" class="ui-disabled">Disabled anchor via class</a>
				<form>
					<button disabled>Button with disabled attribute</button>
					<input type="button" value="Input with disabled attribute" disabled>
				</form>
			</div>
		</div>
		<div data-id="myfooter" data-role="footer" data-position="fixed">
			<div data-role="navbar" data-iconpos="left">
				<ul>  
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp?footer=0" data-transition="slide" class="ui-btn-active ui-state-persist" data-icon="gear">Widgets</a></li>  
					<li><a href="${pageContext.request.contextPath}/jsp/listviewAndroid.jsp" data-transition="slide" data-icon="refresh">List</a></li>
					<li><a href="/hunny-statics/mobilehtml/demos/widgets/index.html" data-transition="slide" data-icon="grid">Widgets</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp?footer=3" data-transition="slide" data-icon="home">Four</a></li>
				</ul>
			</div
		</div>
	</div>
</body>
</html>
