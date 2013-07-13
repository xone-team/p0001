<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body>
	<div data-role="page" class="purchase-main-page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<h1>求购列表</h1>
		</div>
		<div data-role="content">
			<div style="height:10px">&nbsp;</div>
			<div class="purchase-list-main" style="width:100%;padding-top:10px;" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
				<ul class="ul-purchase-list" data-role="listview" data-filter="true" data-filter-placeholder="产品搜索..." data-inset="true">
		        	<li><a href="#">
		            	<img src="${STATIC_ROOT}/image/lumia_800.png">
		            	<h2>WP 7.8</h2>
		                <p>Nokia rolls out WP 7.8 to Lumia 800</p>
		                <p class="ui-li-aside">Windows Phone</p>
		            </a></li>
		        	<li><a href="#">
		            	<img src="${STATIC_ROOT}/image/galaxy_express.png">
		            	<h2>Galaxy</h2>
		                <p>New Samsung Galaxy Express</p>
		                <p class="ui-li-aside">Samsung</p>
		            </a></li>
		        	<li><a href="#">
		            	<img src="${STATIC_ROOT}/image/nexus_7.png">
		            	<h2>Nexus 7</h2>
		                <p>Rumours about new full HD Nexus 7</p>
		                <p class="ui-li-aside">Android</p>
		            </a></li>
		        	<li><a href="#">
		            	<img src="${STATIC_ROOT}/image/firefox_os.png">
		            	<h2>Firefox OS</h2>
		                <p>ZTE to launch Firefox OS smartphone at MWC</p>
		                <p class="ui-li-aside">Firefox</p>
		            </a></li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="2" name="offset"/>
		</jsp:include>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js?_=${identify}"></script>
	<script type="text/javascript">
		$(document).delegate('div.purchase-main-page', "pageinit", function(event) {
			$('div.purchase-list-main').mypullupdown({
				url:'${pageContext.request.contextPath}/product/listMobileMore.html',
				down: function(html) {
					$('ul.ul-purchase-list').prepend(html).listview('refresh');
				},
				up: function(html) {
					$('ul.ul-purchase-list').append(html).listview('refresh');
				}
			});
		});
	</script>>
	</body>
</html>
