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
	<script>
		$( document ).on( "pageinit", "#myPage", function() {
			$( "#autocomplete" ).on( "listviewbeforefilter", function ( e, data ) {
				var $ul = $( this ),
					$input = $( data.input ),
					value = $input.val(),
					html = "";
				$ul.html( "" );
				if ( value && value.length > 2 ) {
					$ul.html( "<li><div class='ui-loader'><span class='ui-icon ui-icon-loading'></span></div></li>" );
					$ul.listview( "refresh" );
					$.ajax({
						url: "http://gd.geobytes.com/AutoCompleteCity",
						dataType: "jsonp",
						crossDomain: true,
						data: {
							q: $input.val()
						}
					})
					.then( function ( response ) {
						$.each( response, function ( i, val ) {
							html += "<li>" + val + "</li>";
						});
						$ul.html( html );
						$ul.listview( "refresh" );
						$ul.trigger( "updatelayout");
					});
				}
			});
		});
    </script>
	<style>
		.ui-listview-filter-inset {
			margin-top: 0;
		}
    </style>
</head>
<body>
	<div data-role="page" id="myPage">
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-backbtn="false" data-position="fixed">
			<a href="${pageContext.request.contextPath}/jsp/autocomplete.jsp" data-transition="turn" data-icon="back">back</a>
			<h1>Remote autocomplete</h1>
		</div>
		<div data-role="content" class="jqm-content">
			<h1>Remote autocomplete</h1>
			<div data-demo-html="true" data-demo-js="true" data-demo-css="true">
				<h3>Cities worldwide</h3>
            	<p>After you enter <strong>at least three characters</strong> the autocomplete function will show all possible matches.</p>
				<ul id="autocomplete" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Find a city..." data-filter-theme="d"></ul>
			</div>
  			<p class="jqm-intro">To use the listview filter as an autocomplete that taps into remote data sources, you can use the <code>listviewbeforefilter</code> event to dynamically populate a listview as a user types a search query.</p>
			<p>This is useful when you have a very large data set like cities, zip codes, or products that can't be loaded up-front locally. Use the view source button to see the JavaScript that powers this demo.</p>
			<p>If you have a small list of items, you can use the <a href="../listviews/">listview</a> filter reveal option to make an autocomplete with local listview data.</p>
            <a href="${pageContext.request.contextPath}/jsp/autocomplete.jsp" class="jqm-button" data-role="button" data-inline="true" data-mini="true" data-icon="arrow-l" data-iconpos="left">Back to autocomplete</a>
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
