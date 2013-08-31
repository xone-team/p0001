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
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="purchase-main-page" data-dom-cache="false">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<h1>求购列表</h1>
			<a href="#" class="purchase-list-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content">
			<div style="height:10px">&nbsp;</div>
			<div class="purchase-list-main${myid}" style="width:100%;padding-top:10px;" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
				<ul class="ul-purchase-list${myid}" data-role="listview" data-filter="true" data-filter-placeholder="产品搜索..." data-inset="true">
		        	<li data-role="list-divider">数据加载中，请稍候...</li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js"></script>
		<script type="text/javascript">
			$('div.purchase-main-page').bind("pageinit", function(event) {
				$('div.purchase-list-main${myid}').mypullupdown({
					url:'${pageContext.request.contextPath}/purchase/listItems.html',
					onDown: function() {
						var item = $('li.purchasedatecreateditem');
						return $.extend({}, {
							'purchase.purchaseName': $('div.purchase-list-main${myid}').find('input[data-type="search"]').val(),
							'exIds': exPurchaseIds()
						}, {
							'itemcount': item.length,
							'itemaction': 'down',
							'purchase.dateCreated': item.first().attr('timestamp')
						});
					},
					onUp: function() {
						var item = $('li.purchasedatecreateditem');
						return $.extend({}, {
							'purchase.purchaseName': $('div.purchase-list-main${myid}').find('input[data-type="search"]').val()
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
					var lis = $('li.purchasedatecreateditem:eq(0)');
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
							}
							fixedPurchaseImage();
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
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="2" name="offset"/></jsp:include>
	</div>
	</body>
</html>
