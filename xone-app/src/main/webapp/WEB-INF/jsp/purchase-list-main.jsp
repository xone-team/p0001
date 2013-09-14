<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>购买列表</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="purchase-main-page" data-dom-cache="true">
		<div data-id="myheader" class="ui-bar-b" data-role="header" data-position="fixed">
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>求购列表</h1>
			<a href="#" class="purchase-list-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content">
			<div class="searchconditions${myid}" data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
			    <h4>求购产品高级搜索</h4>
				<div data-role="navbar" data-mini="true" data-theme="e">
				    <ul>
				        <li><a href="#searchtype${myid}" class="navbartabs ui-btn-active">类型</a></li>
				        <li><a href="#searcharea${myid}" class="navbartabs">属地</a></li>
				        <li><a href="#searchcredit${myid}" class="navbartabs">信誉</a></li>
				    </ul>
				</div>
				<div data-id="#searchtype${myid}" data-role="controlgroup" class="groupsearchclass" data-mini="true">
					<c:forEach items="${purchaseType}" var="it">
				    <input type="checkbox" name="checkbox-type" value="${it.value}" id="checkbox-${it.value}a${myid}">
				    <label for="checkbox-${it.value}a${myid}">${it.name}</label>
                    </c:forEach>
				</div>
				<div data-id="#searcharea${myid}" data-role="controlgroup" data-mini="true" class="groupsearchclass" style="display:none;">
				    <input type="checkbox" name="checkbox-area" id="checkbox-0b${myid}" value="">
				    <label for="checkbox-0b${myid}">全部</label>
				    <input type="checkbox" name="checkbox-area" id="checkbox-1b${myid}" value="上海">
				    <label for="checkbox-1b${myid}">上海</label>
				    <input type="checkbox" name="checkbox-area" id="checkbox-2b${myid}" value="北京">
				    <label for="checkbox-2b${myid}">北京</label>
				    <input type="checkbox" name="checkbox-area" id="checkbox-3b${myid}" value="深圳">
				    <label for="checkbox-3b${myid}">深圳</label>
				</div>
				<div data-id="#searchcredit${myid}" data-role="controlgroup" data-mini="true" class="groupsearchclass" style="display:none;">
				    <input type="checkbox" name="checkbox-credit" id="checkbox-0c${myid}" value="">
				    <label for="checkbox-0c${myid}">全部</label>
				    <input type="checkbox" name="checkbox-credit" id="checkbox-1c${myid}" value="1">
				    <label for="checkbox-1c${myid}">信誉好</label>
				    <input type="checkbox" name="checkbox-credit" id="checkbox-2c${myid}" value="0">
				    <label for="checkbox-2c${myid}">信誉一般</label>
				</div>
			</div>
			<div class="purchase-list-main${myid}" style="width:100%;" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
				<div style="height:10px">&nbsp;</div>
				<ul class="ul-purchase-list${myid}" data-role="listview" data-filter="true" data-filter-placeholder="产品搜索..." data-inset="true">
		        	<li data-role="list-divider">数据加载中，请稍候...</li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$('div.purchase-main-page').bind("pageinit", function(event) {
				$('div.searchconditions${myid} input[type="checkbox"]').myallcheckbox();
				$('div.searchconditions${myid} a.navbartabs').click(function(e) {
					e.preventDefault();
					$('div.searchconditions${myid} div.groupsearchclass').hide();
					$('div.searchconditions${myid} a.navbartabs').removeClass('ui-btn-active');
					var t = $(this);
					$('div.searchconditions${myid} div[data-id="' + t.attr('href') + '"]').show();
					t.addClass('ui-btn-active');
				});
				$('div.purchase-list-main${myid}').mypullupdown({
					url:'${pageContext.request.contextPath}/purchase/listItems.html',
					onDown: function() {
						var item = $('li.purchasedatecreateditem');
						return $.extend({}, {
							'purchase.purchaseName': $('div.purchase-list-main${myid}').find('input[data-type="search"]').val(),
							'exIds': exPurchaseIds(),
							'purchaseTypes': checkPurchaseType(),
							'purchaseLocations': checkPurchaseArea(),
							'credits':checkPurchaseCredit()
						}, {
							'itemcount': item.length,
							'itemaction': 'down',
							'purchase.dateCreated': item.first().attr('timestamp')
						});
					},
					onUp: function() {
						var item = $('li.purchasedatecreateditem');
						return $.extend({}, {
							'purchase.purchaseName': $('div.purchase-list-main${myid}').find('input[data-type="search"]').val(),
							'exIds': exPurchaseIds(),
							'purchaseTypes': checkPurchaseType(),
							'purchaseLocations': checkPurchaseArea(),
							'credits':checkPurchaseCredit()
						}, {
							'itemcount': item.length,
							'itemaction': 'up',
							'purchase.dateCreated': item.last().attr('timestamp')
						});
					},
					down: function(html) {
						var overheadli = $('ul.ul-purchase-list${myid} li.purchaseoverheaditem').last();
						var ul = $('ul.ul-purchase-list${myid}');
						if (overheadli.length == 0) {
							ul.prepend(html);
						} else {
							overheadli.after(html);
						}
						ul.listview('refresh');
						ul.find('li.itemtoolong').remove();
						fixedPurchaseImage();
					},
					up: function(html) {
						var ul = $('ul.ul-purchase-list${myid}');
						ul.find('li.itemtoolong').remove();
						ul.append(html).listview('refresh');
						fixedPurchaseImage();
					}
				});
				function checkPurchaseType() {
					return checkboxValue('div.searchconditions${myid} input:checked[name="checkbox-type"]');
				}
				function checkPurchaseArea() {
					return checkboxValue('div.searchconditions${myid} input:checked[name="checkbox-area"]');
				}
				function checkPurchaseCredit() {
					return checkboxValue('div.searchconditions${myid} input:checked[name="checkbox-credit"]');
				}
// 	        	doPurchaseRequest();
	        	doPurchaseOverheadRequest();
				$('a.purchase-list-page-refresh').click(function(e) {
					$('ul.ul-purchase-list${myid}').html('<li data-role="list-divider">数据加载中，请稍候...</li>').listview('refresh');
// 					doPurchaseRequest();
					doPurchaseOverheadRequest();
				});
				$('div.purchase-main-page').data('eventbinding', true);
				function doPurchaseRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/purchase/listItems.html',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.ul-purchase-list${myid}').html(html).listview('refresh');
							fixedPurchaseImage();
						}
					});
				}
				function exPurchaseIds() {
					var a = [];
					$('ul.ul-purchase-list${myid} li.purchaseoverheaditem').each(function(i) {
						a[i] = $(this).attr('pid');
					});
					return a.join(',');
				}
				function fixedPurchaseImage() {
					if ($('style.purchase').length > 0) {
						return;
					}
					var lis = $('ul.ul-purchase-list${myid} li:eq(0)');
					if (lis.length > 0) {
						var height = lis.height() - 3;
						var css = ['<style type="text/css" class="purchase"> img.purchaseliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
						$('div.purchase-main-page').append(css.join(''));
					}
				}
				function doPurchaseOverheadRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/purchase/listOverheadItems.html',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							var ul = $('ul.ul-purchase-list${myid}');
							ul.html(html);
							if (ul.find('li.purchaseoverheaditem').length == 0) {
								doPurchaseRequest();
							} else {
								ul.listview('refresh');
								fixedPurchaseImage();
							}
						}
					});
				}
				$('ul.ul-purchase-list${myid}').listview({
					filterCallback: function() {
					}
				}).on("listviewbeforefilter", function (e, data) {
					var $ul = $(this), $input = $(data.input), value = $.trim($input.val()), html = "";
			        if (value && value.length >= 2) {
			            $ul.html( "<li><div class='ui-loader'><span class='ui-icon ui-icon-loading'></span></div></li>" );
			            $ul.listview("refresh");
			            $.ajax({
			                url: "${pageContext.request.contextPath}/purchase/listItems.html",
			                data: {
			                    'purchase.purchaseName': $input.val(),
			                    '_': new Date().getTime()
			                }
			            }).then(function(html) {
			                $ul.html(html);
			                $ul.listview( "refresh" );
			            });
			        } else if (value.length <= 0) {
// 			        	doPurchaseRequest();
			        	doPurchaseOverheadRequest();
			        }
			    });
				$('div.searchconditions${myid} input[type="checkbox"]').bind('click', function() {
		            var $this = $(this);
		            var $input = $('div.purchase-list-main${myid}  input[data-type="search"]').first();
					var q = $.extend({}, {
						'purchaseTypes': checkPurchaseType(),
						'purchaseLocations': checkPurchaseArea(),
						'credits':checkPurchaseCredit()
					}, {
						'purchase.purchaseName': $input.val(),
						'_': new Date().getTime()
					});
					if (q.purchaseTypes == '' && q.purchaseLocations == '' && q.credits == '' && q['purchase.purchaseName'] == '') {
						doPurchaseOverheadRequest();
					} else {
			            $.ajax({
			            	type: 'GET',
			                url: "${pageContext.request.contextPath}/purchase/listItems.html",
			                data: q,
			                success: function(html) {
			                	var ul = $('ul.ul-purchase-list${myid}');
			                	ul.html(html);
			                	ul.listview( "refresh" );
			                	fixedPurchaseImage();
			                }
			            });
					}
				});
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="2" name="offset"/></jsp:include>
	</div>
	</body>
</html>
