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
		<style type="text/css">
		a.navbartabs {
			height:26px;
		}
		</style>
	</head>
	<body>
	<div data-role="page" role-id="sales-page">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<div style="width:100%;height:25px;" id="salesbanner">此处是广告位</div>
<!-- 			<h1>产品列表</h1> -->
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a href="${pageContext.request.contextPath}/product/index.html">所有产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html" class="ui-btn-active">促销产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listGroups.html">组团产品</a></li>
			    </ul>
			</div>
		</div>
		<div data-role="content" style="padding-top:2px;">
			<div data-id="searchconditions" data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
			    <h4>选择附加搜索条件</h4>
				<div data-role="navbar" data-mini="true" data-theme="e">
				    <ul>
				        <li><a href="#searchtype" class="navbartabs ui-btn-active">类型</a></li>
				        <li><a href="#searcharea" class="navbartabs">地区</a></li>
				        <li><a href="#searchcredit" class="navbartabs">信誉</a></li>
				    </ul>
				</div>
				<div data-id="#searchtype" data-role="controlgroup" data-mini="true" class="salesearchclass">
				    <input type="checkbox" name="checkbox-1a" id="checkbox-1a" checked="">
				    <label for="checkbox-1a">冻品</label>
				    <input type="checkbox" name="checkbox-2a" id="checkbox-2a">
				    <label for="checkbox-2a">干货</label>
				    <input type="checkbox" name="checkbox-3a" id="checkbox-3a">
				    <label for="checkbox-3a">活鲜</label>
				    <input type="checkbox" name="checkbox-4a" id="checkbox-4a">
				    <label for="checkbox-4a">水果</label>
				    <input type="checkbox" name="checkbox-5a" id="checkbox-5a">
				    <label for="checkbox-5a">调料</label>
				</div>
				<div data-id="#searcharea" data-role="controlgroup" data-mini="true" class="salesearchclass" style="display:none;">
				    <input type="checkbox" name="checkbox-1a" id="checkbox-1b" checked="">
				    <label for="checkbox-1b">上海</label>
				    <input type="checkbox" name="checkbox-2a" id="checkbox-2b">
				    <label for="checkbox-2b">天津</label>
<!-- 				    <table style="width:100%"> -->
<!-- 				    	<tr> -->
<!-- 				    		<td style="width:65px;">其它地区</td><td><input type="text" name="checkbox-2a" id="checkbox-3b"></td> -->
<!-- 				    	</tr> -->
<!-- 				    </table> -->
<!-- 				    <div data-role="fieldcontain"> -->
<!-- 					    <label for="textinput-fc">其它地区:</label> -->
<!-- 					    <input type="text" name="textinput-fc" id="textinput-fc" placeholder="输入地区关键字" value=""> -->
<!-- 					</div> -->
				</div>
				<div data-id="#searchcredit" data-role="controlgroup" data-mini="true" class="salesearchclass" style="display:none;">
				    <input type="checkbox" name="checkbox-1a" id="checkbox-1c" checked="">
				    <label for="checkbox-1c">信誉好</label>
				    <input type="checkbox" name="checkbox-2a" id="checkbox-2c">
				    <label for="checkbox-2c">信誉一般</label>
				</div>
			</div>
			<div style="width:100%;padding-top:10px;" role-id="sales-list" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
		        <ul role-id="sales-listview" data-role="listview" data-filter="true" data-filter-placeholder="促销关键字搜索..." data-inset="true">
		        	<li><a href="#">
		            	<img src="${STATIC_ROOT}/image/apple.png">
		            	<h2>iOS 6.1</h2>
		                <p>Apple released iOS 6.1</p>
		                <p class="ui-li-aside">iOS</p>
		            </a></li>
		        	<li><a href="#">
		            	<img src="${STATIC_ROOT}/image/blackberry_10.png">
		            	<h2>BlackBerry 10</h2>
		                <p>BlackBerry launched the Z10 and Q10 with the new BB10 OS</p>
		                <p class="ui-li-aside">BlackBerry</p>
		            </a></li>
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
		        	<li><a href="#">
		            	<img src="${STATIC_ROOT}/image/tizen.png">
		            	<h2>Tizen</h2>
		                <p>First Samsung phones with Tizen can be expected in 2013</p>
		                <p class="ui-li-aside">Tizen</p>
		            </a></li>
		        	<li><a href="#">
		            	<h2>Symbian</h2>
		                <p>Nokia confirms the end of Symbian</p>
		                <p class="ui-li-aside">Symbian</p>
		            </a></li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp">
			<jsp:param value="1" name="offset"/>
		</jsp:include>
	</div>
	<script type="text/javascript">
		$(document).bind('pageinit', function() {
			$('a.navbartabs').click(function(e) {
				e.preventDefault();
				$('div.salesearchclass').hide();
				$('a.navbartabs').removeClass('ui-btn-active');
				var t = $(this);
				$('div[data-id="' + t.attr('href') + '"]').show();
				t.addClass('ui-btn-active');
			});
		});
		$(document).delegate('div[role-id="sales-page"]', "pageinit", function(event) {
	        $('div[role-id="sales-list"]', this).bind({
		        "iscroll_onpulldown" : pullDownSales,
		        "iscroll_onpullup"   : pullUpSales,
		        "iscroll_onpulluppulled": pullUpHandle,
		        "iscroll_onpullupreset": pullUpresetHandle
	        });
	        $('.iscroll-scroller').css({
	        	minHeight: '100px'
	        });
		});
		function pullUpHandle() {
			$('div[data-id="searchconditions"]').hide();
		}
		function pullUpresetHandle() {
			$('div[data-id="searchconditions"]').show();
		}
		function pullDownSales() {
			loadDataSales('prepend');
		}
		function pullUpSales() {
			loadDataSales('appand');
		}
		function loadDataSales(insertType) {
			$.ajax({
				type: 'GET',
				url: '${pageContext.request.contextPath}/product/listMobileMore.html',
				data: '_=' + new Date().getTime(),
				insertType: insertType,
				success: function(html) {
					$('#salesbanner').html(new Date().getTime());
					if (this.insertType == 'prepend') {
						$('ul[role-id="sales-listview"]').prepend(html).listview('refresh');
					} else {
						$('ul[role-id="sales-listview"]').append(html).listview('refresh');
					}
				}
			});
		}
	</script>
	</body>
</html>
