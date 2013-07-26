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
			<h1>Autocomplete</h1>
		</div>
		<div data-role="content" class="jqm-content">
			<h1>Autocomplete <a href="http://api.jquerymobile.com/listview/#option-filter" data-ajax="false" data-role="button" data-inline="true" data-mini="true" data-icon="arrow-r" data-iconpos="right" class="jqm-api-link">API</a></h1>
			<p class="jqm-intro">An autocomplete widget backed by either local or remote data can be created by leveraging the listview filter feature.</p>
			<h2>Remote data</h2>
			<p>To use the listview filter as an autocomplete that taps into remote data sources, you can use the <code>listviewbeforefilter</code> event to dynamically populate a listview as a user types a search query: <a href="${pageContext.request.contextPath}/jsp/autocomplete-remote.jsp" data-ajax="false">Remote autocomplete demo</a></p>
			<h2 id="autocomplete-local">Local data</h2>
			<p>The filter reveal feature makes it easy to build a simple autocomplete with local data. When a filterable list has the <code>data-filter-reveal="true"</code>, it will auto-hide all the list items when the search field is blank. The <code>data-filter-placeholder</code> attribute can be added to specify the placeholder text for the filter.</p>
			<p>Any listview filter with more than 100-200 items may be slow to perform on a mobile device so we recommend using this feature for  autocomplete situations with a relatively small number of items.</p>
			<h4>Full width listview (non-inset)</h4>
			<div data-demo-html="true">
				<ul data-role="listview" data-filter="true" data-filter-reveal="true" data-filter-placeholder="Search cars...">
					<li><a href="#">Acura</a></li>
					<li><a href="#">Audi</a></li>
					<li><a href="#">BMW</a></li>
					<li><a href="#">Cadillac</a></li>
					<li><a href="#">Chrysler</a></li>
					<li><a href="#">Dodge</a></li>
					<li><a href="#">Ferrari</a></li>
					<li><a href="#">Ford</a></li>
					<li><a href="#">GMC</a></li>
					<li><a href="#">Honda</a></li>
					<li><a href="#">Hyundai</a></li>
					<li><a href="#">Infiniti</a></li>
					<li><a href="#">Jeep</a></li>
					<li><a href="#">Kia</a></li>
					<li><a href="#">Lexus</a></li>
					<li><a href="#">Mini</a></li>
					<li><a href="#">Nissan</a></li>
					<li><a href="#">Porsche</a></li>
					<li><a href="#">Subaru</a></li>
					<li><a href="#">Toyota</a></li>
					<li><a href="#">Volkswagen</a></li>
					<li><a href="#">Volvo</a></li>
				</ul>
			</div>
			<h4>Inset listiew</h4>
			<div data-demo-html="true">
				<ul data-role="listview" data-inset="true" data-filter="true" data-filter-reveal="true" data-filter-placeholder="Search cars...">
					<li><a href="#">Acura</a></li>
					<li><a href="#">Audi</a></li>
					<li><a href="#">BMW</a></li>
					<li><a href="#">Cadillac</a></li>
					<li><a href="#">Chrysler</a></li>
					<li><a href="#">Dodge</a></li>
					<li><a href="#">Ferrari</a></li>
					<li><a href="#">Ford</a></li>
					<li><a href="#">GMC</a></li>
					<li><a href="#">Honda</a></li>
					<li><a href="#">Hyundai</a></li>
					<li><a href="#">Infiniti</a></li>
					<li><a href="#">Jeep</a></li>
					<li><a href="#">Kia</a></li>
					<li><a href="#">Lexus</a></li>
					<li><a href="#">Mini</a></li>
					<li><a href="#">Nissan</a></li>
					<li><a href="#">Porsche</a></li>
					<li><a href="#">Subaru</a></li>
					<li><a href="#">Toyota</a></li>
					<li><a href="#">Volkswagen</a></li>
					<li><a href="#">Volvo</a></li>
				</ul>
			</div>
			<h2 id="autocomplete-filtertext">Providing richer search content</h2>
			<p>By default, the listview filter simply searches against the contents of each list item. If you want the filter to search against different content, add the <code>data-filtertext</code>	attribute to the item and populate it with one or many keywords and phrases that should be used to match against. Note that if this attribute is added, the contents of the list item are ignored.</p>
			<p>This attribute is useful for dealing with allowing for ticker symbols and full company names to be searched, or for covering common spellings and abbreviations for countries.</p>
<pre><code>
&lt;li <strong>data-filtertext=&quot;NASDAQ:AAPL Apple Inc.</strong>&quot;&gt;&lt;a href=&quot;#&quot;&gt;Apple&lt;/a&gt;&lt;/li&gt;
&lt;li <strong>data-filtertext=&quot;USA U.S.A. United States of America&quot;</strong>&gt;&lt;a href=&quot;#&quot;&gt;United States&lt;/a&gt;&lt;/li&gt;
</code></pre>
			<ul data-role="listview" data-filter="true" data-filter-placeholder="Search ticker or firm name..." data-inset="true">
				<li data-filtertext="NASDAQ:ADBE Adobe Systems Incorporated"><a href="#">Adobe</a></li>
				<li data-filtertext="NASDAQ:AMZNL Amazon.com, Inc."><a href="#">Amazon</a></li>
				<li data-filtertext="NASDAQ:AAPL Apple Inc."><a href="#">Apple</a></li>
				<li data-filtertext="NASDAQ:GOOG Google Inc."><a href="#">Google</a></li>
				<li data-filtertext="NYSE:IBM Intl. International Business Machines Corp."><a href="#">IBM</a></li>
				<li data-filtertext="NASDAQ:MSFT Microsoft Corporation"><a href="#">Microsoft</a></li>
				<li data-filtertext="NASDAQ:YHOO Yahoo! Inc."><a href="#">Yahoo</a></li>
				<li data-filtertext="USA U.S.A. United States of America"><a href="#">United States</a></li>
			</ul>
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
