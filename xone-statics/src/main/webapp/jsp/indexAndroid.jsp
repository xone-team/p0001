<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<title>Hello World</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.3.1.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mobile-1.3.1.min.js"></script>
</head>
<body>
	<div id="indexPage" data-role="page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="#" data-icon="back">back</a>
			<h1>Widget reference</h1>
			<a href="#" data-icon="check">Save</a>
		</div>
		<div data-role="content">
			<p>This section is a reference for all widget options.</p>
			<div data-role="controlgroup" data-type="horizontal" data-mini="true" >    
	          <a href="#" data-role="button" data-icon="plus">Add</a>
	          <a href="#" data-role="button" data-icon="delete">Remove</a>
	          <a href="#" data-role="button" data-icon="arrow-u">Up</a>    
	          <a href="#" data-role="button" data-icon="arrow-d">Down</a>    
	        </div>
			<div data-role="controlgroup">  
				<a href="#" data-role="button">Yes</a>  
				<a href="#" data-role="button">No</a>  
				<a href="#" data-role="button">Maybe</a>
			</div>
			<div data-role="controlgroup">
				<select name="foo" data-native-menu="true" data-placeholder="true">  
				  <option value="a" >A</option>  
				  <option value="b" >B</option>  
				  <option value="c" >C</option>  
				</select>
				<input type="checkbox" value="abc"/>
			</div>
		</div>
		<div data-id="myfooter" data-role="footer" data-position="fixed">
			<div data-role="navbar" data-iconpos="left">
				<ul>  
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp?footer=0" data-transition="slide" class="ui-btn-active ui-state-persist" data-icon="gear">Widgets</a></li>  
					<li><a href="${pageContext.request.contextPath}/jsp/listviewAndroid.jsp" data-transition="slide" data-icon="refresh">List</a></li>
					<li><a href="${pageContext.request.contextPath}/product/index.html" data-transition="slide" data-icon="grid">Widgets</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/indexAndroid.jsp?footer=3" data-transition="slide" data-icon="home">Four</a></li>
				</ul>
			</div
		</div>
	</div>
</body>
</html>
