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
			<h1>Collapsibles</h1>
		</div>
		<div data-role="content" class="jqm-content">
			<h1>Collapsibles <a href="http://api.jquerymobile.com/collapsible/" data-ajax="false" data-role="button" data-inline="true" data-mini="true" data-icon="arrow-r" data-iconpos="right" class="jqm-api-link">API</a></h1>
            <p class="jqm-intro">Collapsibles are simple widgets that allow you to expand or collapse content when tapped and are useful in mobile to provide a compact presentation of content.</p>
	        <h2>Basic collapsible</h2>
	        <p>To create a collapsible block of content, create a container and add the <code> data-role="collapsible"</code> attribute. Directly inside this container, add any header (H1-H6) or legend element. The framework will style the header to look like a clickable button and add a "+" icon to the left to indicate it's expandable. After the header, add any HTML markup you want to be collapsible. The framework will wrap this markup in a container that will be hidden/shown when the heading is clicked.</p>
	        <div data-demo-html="true">
	            <div data-role="collapsible">
	                <h4>Heading</h4>
	                <p>I'm the collapsible content. By default I'm closed, but you can click the header to open me.</p>
	            </div>
	        </div>
	        <h2>Theme</h2>
	        <p>Add the <code>data-content-theme</code> attribute to set a theme for the content of the collapsible. To provide a stronger visual connection between the collapsible header and content, add the <code>data-content-theme</code> attribute to the wrapper and specify a theme swatch letter. This applies the swatch's border and <em>flat</em> background color (not the gradient) to the content block, removes the rounded corners from the bottom of the header, and gives the bottom of the content block rounded corners to visually group these elements.</p>
	        <div data-demo-html="true">
	            <div data-role="collapsible" data-theme="b" data-content-theme="d">
	                <h4>Heading</h4>
	                <p>I'm the collapsible content with a themed content block set to "d".</p>
	            </div>
	        </div>
	        <h2>Expanded</h2>
	        <p>To expand the content when the page loads, add the <code>data-collapsed="false"</code> attribute to the wrapper.</p>
	        <div data-demo-html="true">
	            <div data-role="collapsible" data-collapsed="false" data-theme="b" data-content-theme="d">
	                <h4>Heading</h4>
	                <ul data-role="listview">
	                    <li><a href="#">List item 1</a></li>
	                    <li><a href="#">List item 2</a></li>
	                    <li><a href="#">List item 3</a></li>
	                </ul>
	            </div>
	        </div>
	        <h2>Mini sized</h2>
	        <p>For a more compact version that is useful in toolbars and tight spaces, add the <code>data-mini="true"</code> attribute to the element to create a mini version. </p>
	        <div data-demo-html="true">
	            <div data-role="collapsible" data-mini="true" data-theme="b" data-content-theme="a">
	                <h4>Heading</h4>
	                <ul data-role="listview">
	                    <li><a href="#">List item 1</a></li>
	                    <li><a href="#">List item 2</a></li>
	                    <li><a href="#">List item 3</a></li>
	                </ul>
	            </div>
	        </div>
            <h2>Icons</h2>
            <p>The default icons of collapsible headings can be overridden by using the <code>data-collapsed-icon</code> and <code>data-expanded-icon</code> attributes. In the example below, <code>data-collapsed-icon="arrow-d"</code> and <code>data-expanded-icon="arrow-u"</code>.</p>
            <div data-demo-html="true">
                <div data-role="collapsible" data-theme="b" data-content-theme="d" data-collapsed-icon="arrow-d" data-expanded-icon="arrow-u">
                    <h4>Heading</h4>
                    <ul data-role="listview" data-inset="false">
                        <li>Read-only list item 1</li>
                        <li>Read-only list item 2</li>
                        <li>Read-only list item 3</li>
                    </ul>
                </div>
            </div>
            <h2>Icon positioning</h2>
            <p>The default icon positioning of collapsible headings can be overridden by using the <code>data-iconpos</code> attribute. In the below case, <code>data-iconpos="right"</code>.</p>
            <div data-role="collapsible" data-iconpos="right" data-theme="b" data-content-theme="d">
                <h3>I'm a header</h3>
                <p><code>data-iconpos="right"</code></p>
            </div>
	        <h2>Legend</h2>
	        <p>For forms, use a <code>fieldset</code> and <code>legend</code> for the collapsible.</p>
	        <div data-demo-html="true">
	            <form>
	                <fieldset data-role="collapsible" data-theme="a" data-content-theme="d">
	                    <legend>Legend</legend>
	
	                    <label for="textinput-f">Text Input:</label>
	                    <input type="text" name="textinput-f" id="textinput-f" placeholder="Text input" value="">
	
	                    <div data-role="controlgroup">
	                        <input type="checkbox" name="checkbox-1-a" id="checkbox-1-a" />
	                        <label for="checkbox-1-a">One</label>
	                        <input type="checkbox" name="checkbox-2-a" id="checkbox-2-a" />
	                        <label for="checkbox-2-a">Two</label>
	                        <input type="checkbox" name="checkbox-3-a" id="checkbox-3-a" />
	                        <label for="checkbox-3-a">Three</label>
	                    </div>
	                </fieldset>
	            </form>
	        </div>
	        <h2>Non-inset collapsible</h2>
	        <p>By default collapsibles have an inset appearance. To make them full width without corner styling add the <code>data-inset="false"</code> attribute to the element.</p>
	        <div data-demo-html="true">
	            <div data-role="collapsible" data-inset="false" data-theme="c" data-content-theme="d">
	                <h4>Heading</h4>
	                <p>I'm the collapsible content. By default I'm closed, but you can click the header to open me.</p>
	            </div>
	        </div>
	        <h2>Set of individual collapsibles</h2>
	        <p>This is an example of a series of individual collapsibles. The difference with a "Collapsible Set" is that multiple collapsible rows can be open at once.</p>
	        <div data-demo-html="true">
	            <div data-role="collapsible" data-theme="b" data-content-theme="d" data-inset="false">
	                <h3>Pets</h3>
	                <ul data-role="listview">
	                    <li><a href="#">Canary</a></li>
	                    <li><a href="#">Cat</a></li>
	                    <li><a href="#">Dog</a></li>
	                    <li><a href="#">Gerbil</a></li>
	                    <li><a href="#">Iguana</a></li>
	                    <li><a href="#">Mouse</a></li>
	                </ul>
	            </div><!-- /collapsible -->
	            <div data-role="collapsible" data-theme="b" data-content-theme="d" data-inset="false">
	                <h3>Farm animals</h3>
	                <ul data-role="listview">
	                    <li><a href="#">Chicken</a></li>
	                    <li><a href="#">Cow</a></li>
	                    <li><a href="#">Duck</a></li>
	                    <li><a href="#">Horse</a></li>
	                    <li><a href="#">Pig</a></li>
	                    <li><a href="#">Sheep</a></li>
	                </ul>
	            </div><!-- /collapsible -->
	            <div data-role="collapsible" data-theme="b" data-content-theme="d" data-inset="false">
	                <h3>Wild Animals</h3>
	                <ul data-role="listview">
	                    <li><a href="#">Aardvark</a></li>
	                    <li><a href="#">Alligator</a></li>
	                    <li><a href="#">Ant</a></li>
	                    <li><a href="#">Bear</a></li>
	                    <li><a href="#">Beaver</a></li>
	                    <li><a href="#">Cougar</a></li>
	                    <li><a href="#">Dingo</a></li>
	                </ul>
	            </div><!-- /collapsible -->
	        </div>
	        <p>To avoid "double" borders the framework removes the top border of collapsibles that are immediately preceded by another collapsible. Here we show how to negate this with custom CSS.</p>
	        <div data-demo-html="true" data-demo-css="#negateDoubleBorder">
	            <div id="demo-borders">
	                <div data-role="collapsible" data-theme="e" data-content-theme="d" data-inset="false">
	                    <h3>Pets</h3>
	                    <ul data-role="listview">
	                        <li><a href="#">Canary</a></li>
	                        <li><a href="#">Cat</a></li>
	                        <li><a href="#">Dog</a></li>
	                        <li><a href="#">Gerbil</a></li>
	                        <li><a href="#">Iguana</a></li>
	                        <li><a href="#">Mouse</a></li>
	                    </ul>
	                </div><!-- /collapsible -->
	                <div data-role="collapsible" data-theme="e" data-content-theme="d" data-inset="false">
	                    <h3>Farm animals</h3>
	                    <ul data-role="listview">
	                        <li><a href="#">Chicken</a></li>
	                        <li><a href="#">Cow</a></li>
	                        <li><a href="#">Duck</a></li>
	                        <li><a href="#">Horse</a></li>
	                        <li><a href="#">Pig</a></li>
	                        <li><a href="#">Sheep</a></li>
	                    </ul>
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
