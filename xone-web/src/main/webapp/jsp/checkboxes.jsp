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
			<h1>Checkbox</h1>
		</div>
		<div data-role="content" class="jqm-content">
			<h1>Checkboxes <a href="http://api.jquerymobile.com/checkboxradio/" data-ajax="false" data-role="button" data-inline="true" data-mini="true" data-icon="arrow-r" data-iconpos="right" class="jqm-api-link">API</a></h1>
			<p class="jqm-intro">Checkboxes are used to provide a list of options where more than one can be selected.</p>
			<h2 id="check-markup">Basic markup</h2>
			<p>To create a single checkbox, add an <code>input</code> with a <code>type="checkbox"</code> attribute and a corresponding <code>label</code>. If the <code>input</code> isn't wrapped in its corresponding <code>label</code>, be sure to set the <code>for</code> attribute of the <code>label</code> to match the <code>id</code> of the <code>input</code> so they are semantically associated.</p>
			<div data-demo-html="true">
                <form>
	               	<label>
	                	<input type="checkbox" name="checkbox-0 "/>Check me
	                </label>
            	</form>
			</div>
			<h2 id="check-mini">Mini size</h2>
			<p>For a more compact version that is useful in toolbars and tight spaces, add the <code>data-mini="true"</code> attribute to the element to create a mini version. </p>
			<div data-demo-html="true">
                <form>
	               	<input type="checkbox" name="checkbox-mini-0" id="checkbox-mini-0" class="custom" data-mini="true" />
					<label for="checkbox-mini-0">I agree</label>
            	</form>
			</div>
			<h2 id="check-vert">Vertical group</h2>
			<p>Typically, there are multiple checkboxes listed under a question title. To visually integrate multiple checkboxes into a grouped button set, the framework will automatically remove all margins between buttons and round only the top and bottom corners of the set if there is a <code> data-role="controlgroup"</code> attribute on the <code>fieldset</code>.</p>
			<div data-demo-html="true">
                <form>
	               	<fieldset data-role="controlgroup">
						<legend>Vertical:</legend>
						<input type="checkbox" name="checkbox-v-2a" id="checkbox-v-2a">
						<label for="checkbox-v-2a">One</label>
						<input type="checkbox" name="checkbox-v-2b" id="checkbox-v-2b">
						<label for="checkbox-v-2b">Two</label>
						<input type="checkbox" name="checkbox-v-2c" id="checkbox-v-2c">
						<label for="checkbox-v-2c">Three</label>
					</fieldset>
            	</form>
			</div>
			<h2 id="check-horiz">Horizontal group</h2>
			<p>Checkboxes can also be used for grouped button sets where more than one button can be selected at once, such as the bold, italic and underline button group seen in word processors. To make a horizontal button set, add the <code> data-type="horizontal"</code> to the <code>fieldset</code>.</p>
			<div data-demo-html="true">
                <form>
					<fieldset data-role="controlgroup" data-type="horizontal">
						<legend>Horizontal:</legend>
						<input type="checkbox" name="checkbox-h-2a" id="checkbox-h-2a">
						<label for="checkbox-h-2a">One</label>
						<input type="checkbox" name="checkbox-h-2b" id="checkbox-h-2b">
						<label for="checkbox-h-2b">Two</label>
						<input type="checkbox" name="checkbox-h-2c" id="checkbox-h-2c">
						<label for="checkbox-h-2c">Three</label>
					</fieldset>
            	</form>
			</div>
			<h2 id="check-iconpos">Icon position</h2>
			<p>To swap the position of the check icon from the default position on the left, add the <code>data-iconpos="right"</code> attribute to the fieldset to create a mini version. </p>
			<div data-demo-html="true">
				<form>
					<fieldset data-role="controlgroup" data-iconpos="right">
						<legend>Horizontal, mini sized:</legend>
						<input type="checkbox" name="checkbox-h-6a" id="checkbox-h-6a">
						<label for="checkbox-h-6a">One</label>
						<input type="checkbox" name="checkbox-h-6b" id="checkbox-h-6b">
						<label for="checkbox-h-6b">Two</label>
						<input type="checkbox" name="checkbox-h-6c" id="checkbox-h-6c">
						<label for="checkbox-h-6c">Three</label>
					</fieldset>
				</form>
			</div>
			<h2 id="check-theme">Theme</h2>
			<p>To set the theme, add the <code> data-theme</code> attribute on the <code>fieldset</code> to the individual checkbox inputs.</p>
			<div data-demo-html="true">
                <form>
	               	<fieldset data-role="controlgroup">
						<legend>Swatch A:</legend>
						<input type="checkbox" name="checkbox-t-2a" id="checkbox-t-2a" data-theme="a">
						<label for="checkbox-t-2a">One</label>
						<input type="checkbox" name="checkbox-t-2b" id="checkbox-t-2b" data-theme="a">
						<label for="checkbox-t-2b">Two</label>
						<input type="checkbox" name="checkbox-t-2c" id="checkbox-t-2c" data-theme="a">
						<label for="checkbox-t-2c">Three</label>
					</fieldset>
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
