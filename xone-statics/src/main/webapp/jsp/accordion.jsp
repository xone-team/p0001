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
	<div data-role="page"  data-add-back-btn="true">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
<%-- 			<a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp" data-transition="turn" data-icon="back">back</a> --%>
			<h1>Accordion</h1>
		</div>
		<div data-role="content">
			<h1>Accordions <a href="http://api.jquerymobile.com/collapsible-set/" data-ajax="false" data-role="button" data-inline="true" data-mini="true" data-icon="arrow-r" data-iconpos="right">API</a></h1>
			<p class="jqm-intro">An accordion is created in jQuery Mobile by grouping a series of individual collapsibles into set.</p>
			<h2 id="accordion-markup">Markup</h2>
			<p>Collapsible sets start with the same markup as <a href="../collapsibles/" data-ajax="false">individual collapsibles</a> which have a heading followed by the collapsible content. By adding a parent wrapper with a <code>data-role="collapsible-set"</code> attribute to the collapsibles they will be visually grouped and they will behave like an accordion so only one section can be open at a time.</p>
			<div data-demo-html="true">
				<div data-role="collapsible-set" data-theme="c" data-content-theme="d">
					<div data-role="collapsible">
						<h3>Section 1</h3>
						<p>I'm the collapsible content for section 1</p>
					</div>
					<div data-role="collapsible">
						<h3>Section 2</h3>
						<p>I'm the collapsible content for section 2</p>

					</div>
					<div data-role="collapsible">
						<h3>Section 3</h3>
						<p>I'm the collapsible content for section 3</p>
					</div>
				</div>
			</div>
			<h2 id="accordion-inline">Inset vs. full width</h2>
			<p>For full width collapsibles without corner styling add the <code>data-inset="false"</code> attribute to the set. This makes the collapsible set look more like an expandable <a href="../listviews/">listview</a>.</p>
			<div data-demo-html="true">
				<div data-role="collapsible-set" data-inset="false">
					<div data-role="collapsible">
						<h3>Animals</h3>
						<ul data-role="listview" data-inset="false">
							<li>Cats</li>
							<li>Dogs</li>
							<li>Lizards</li>
							<li>Snakes</li>
						</ul>
					</div>
					<div data-role="collapsible">
						<h3>Cars</h3>
						<ul data-role="listview" data-inset="false">
							<li>Acura</li>
							<li>Audi</li>
							<li>BMW</li>
							<li>Cadillac</li>
						</ul>
					</div>
					<div data-role="collapsible">
						<h3>Planets</h3>
						<ul data-role="listview" data-inset="false">
							<li>Earth</li>
							<li>Jupiter</li>
							<li>Mars</li>
							<li>Mercury</li>
						</ul>
					</div>
				</div>
			</div>
			<h2 id="accordion-mini">Mini</h2>
			<p>For a more compact version that is useful in tight spaces, add the <code>data-mini="true"</code> attribute to the set. </p>
			<div data-demo-html="true">
				<div data-role="collapsible-set" data-theme="c" data-content-theme="d" data-mini="true">
					<div data-role="collapsible">
						<h3>I'm a mini collapsible</h3>
						<p>This is good for tight spaces.</p>
					</div>
					<div data-role="collapsible">
						<h3>I'm another mini</h3>
						<p>Here's some collapsible content.</p>

					</div>
					<div data-role="collapsible">
						<h3>Last one</h3>
						<p>Final bit of collapsible content.</p>
					</div>
				</div>
			</div>
			<h2 id="accordion-icons">Icons</h2>
			<p>The default icons of collapsible headings can be overridden by using the <code>data-collapsed-icon</code> and <code>data-expanded-icon</code> attributes, either at the <code>collapsible-set</code> level or on any of its collapsibles individually.</p>
			<div data-demo-html="true">
				<div data-role="collapsible-set" data-theme="c" data-content-theme="d" data-collapsed-icon="arrow-r" data-expanded-icon="arrow-d">
					<div data-role="collapsible">
						<h3>Icon set on the set</h3>
						<p>Specify the open and close icons on the set to apply it to all the collapsibles within.</p>
					</div>
					<div data-role="collapsible">
						<h3>Icon set on the set</h3>
						<p>This collapsible also gets the icon from the set.</p>
					</div>
					<div data-role="collapsible" data-collapsed-icon="gear" data-expanded-icon="delete">
						<h3>Icon set on this collapsible</h3>
						<p>The icons here are applied to this collapsible specifically, thus overriding the set icons.</p>
					</div>
				</div>
			</div>
			<h2 id="accordion-icon-position">Icon position</h2>
			<p>The default icon positioning of collapsible headings can be overridden by using the <code>data-iconpos</code> attribute, either at the <code>collapsible-set</code> level or on any of its collapsibles individually.</p>
			<div data-demo-html="true">
				<div data-role="collapsible-set" data-theme="c" data-content-theme="d" data-iconpos="right">
					<div data-role="collapsible">
						<h3>Right</h3>
						<p>Inherits icon positioning from <code>data-iconpos="right"</code> attribute on set.</p>
					</div>
					<div data-role="collapsible" data-iconpos="left">
						<h3>Left</h3>
						<p>Set via <code>data-iconpos="left"</code> attribute on the collapsible</p>
					</div>
					<div data-role="collapsible" data-iconpos="bottom">
						<h3>Bottom</h3>
						<p>Set via <code>data-iconpos="bottom"</code> attribute on the collapsible</p>
					</div>
					<div data-role="collapsible" data-iconpos="top">
						<h3>Top</h3>
						<p>Set via <code>data-iconpos="top"</code> attribute on the collapsible</p>
					</div>
				</div>
			</div>
			<h2 id="accordion-corners">Corners</h2>
			<p>Add the <code>data-corners="false"</code> attribute to get an inset collapsible set without rounded corners.</p>
			<div data-demo-html="true">
				<div data-role="collapsible-set" data-corners="false" data-theme="c" data-content-theme="d">
					<div data-role="collapsible">
						<h3>Section 1</h3>
						<p>Collapsible content</p>
					</div>
					<div data-role="collapsible">
						<h3>Section 2</h3>
						<p>Collapsible content</p>
					</div>
					<div data-role="collapsible">
						<h3>Section 3</h3>
						<p>Collapsible content</p>
					</div>
				</div>
			</div>
			<h2 id="accordion-theme">Theme</h2>
			<p>Add a <code>data-theme</code> attribute to the set to set the color of each collapsible header in a set. Add the <code>data-content-theme</code> attribute to specify the color of the collapsible content. </p>
			<div data-demo-html="true">
				<div data-role="collapsible-set" data-theme="a" data-content-theme="a">
					<div data-role="collapsible">
						<h3>1 - Theme A</h3>
						<p>Content theme A</p>
					</div>
					<div data-role="collapsible">
						<h3>2 - Theme A</h3>
						<p>Content theme A</p>
					</div>
				</div>
			</div>
			<p>To have individual sections in a group styled differently, add <code>data-theme</code> and <code>data-content-theme</code> attributes to specific collapsibles.</p>
			<div data-demo-html="true">
				<div data-role="collapsible-set" data-content-theme="c">
					<div data-role="collapsible" data-theme="b" data-content-theme="b">
						<h3>Section header, swatch B</h3>
						<p>Collapsible content, swatch "b"</p>
					</div>
					<div data-role="collapsible" data-theme="a" data-content-theme="a">
						<h3>Section header, swatch A</h3>
						<p>Collapsible content, swatch "a"</p>
					</div>
					<div data-role="collapsible" data-theme="e" data-content-theme="d">
						<h3>Section header, swatch E</h3>
						<p>Collapsible content, swatch "d"</p>
					</div>
				</div>
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
