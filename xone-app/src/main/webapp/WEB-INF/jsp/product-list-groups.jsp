<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="product-groups-page" data-dom-cache="true">
		<div data-id="myheader" data-role="header" data-position="fixed">
			<%-- <div data-role="navbar" data-theme="va" class="ui-vanavbar">
			    <ul>
			        <li><a href="${pageContext.request.contextPath}/product/index.html?_=${myid}">普通产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html?_=${myid}">促销产品</a></li>
			        <li><a href="#" class="ui-btn-active ui-state-persist">组团产品</a></li>
			    </ul>
			</div> --%>
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>组团产品</h1>
			<a href="${pageContext.request.contextPath}/product/addGroups.html?_=${myid}" class="ui-btn-right" data-icon="edit">发布</a>
		</div>
		<div data-role="content" class="product-list-groups${myid}">
			<div class="searchconditionsgroup" data-role="collapsible" data-collapsed="true">
			    <h4>组团产品高级搜索</h4>
				<div data-role="navbar" data-mini="true">
				    <ul>
				        <li><a href="#searchtype${myid}" class="navbartabs ui-btn-active">类型</a></li>
				        <li><a href="#searcharea${myid}" class="navbartabs">属地</a></li>
				        <li><a href="#searchcredit${myid}" class="navbartabs">信誉</a></li>
				    </ul>
				</div>
				<div data-id="#searchtype${myid}" data-role="controlgroup" data-mini="true" class="groupsearchclass">
					<c:forEach items="${productType}" var="it">
				    <input type="checkbox" name="group-checkbox-type" value="${it.value}" id="group-checkbox-${it.value}a${myid}">
				    <label for="group-checkbox-${it.value}a${myid}">${it.name}</label>
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
			<div style="width:100%;" class="product-groups-list${myid}" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
				<div style="height:10px">&nbsp;</div>
		        <ul class="product-groups-listview${myid}" data-role="listview" data-filter="true" data-divider-theme="d" data-filter-placeholder="组团关键字(至少二个)" data-inset="true">
			        <li data-role="list-divider" data-theme="e">组团产品数据加载中，请稍候...</li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$('div.product-groups-page').bind('pageinit', function(event) {
				$('div.product-groups-page input[type="checkbox"]').myallcheckbox();
				$('div.product-list-groups${myid} a.navbartabs').click(function(e) {
					e.preventDefault();
					$('div.product-list-groups${myid} div.groupsearchclass').hide();
					$('div.product-list-groups${myid} a.navbartabs').removeClass('ui-btn-active');
					var t = $(this);
					$('div.product-list-groups${myid} div[data-id="' + t.attr('href') + '"]').show();
					t.addClass('ui-btn-active');
				});
				$('div.product-groups-list${myid}').mypullupdown({
					url:'${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
					onDown: function() {
						var item = $('ul.product-groups-listview${myid}').find('li.productdatecreateditem');
						return $.extend({}, {
							'product.productName': $('ul.product-groups-list${myid}').find('input[data-type="search"]').val(),
							'exIds': exGroupIds(),
							'productTypes': checkTypeForGroups(),
							'productLocations': checkAreaForGroups(),
							'credits':checkCreditForGroups()
						}, {
							'itemcount': item.length,
							'itemaction': 'down',
							'product.dateCreated': item.first().attr('timestamp')
						});
					},
					onUp: function() {
						var item = $('ul.product-groups-listview${myid}').find('li.productdatecreateditem');
						return $.extend({}, {
							'product.productName': $('ul.product-groups-list${myid}').find('input[data-type="search"]').val(),
							'exIds': exGroupIds(),
							'productTypes': checkTypeForGroups(),
							'productLocations': checkAreaForGroups(),
							'credits':checkCreditForGroups()
						}, {
							'itemcount': item.length,
							'itemaction': 'up',
							'product.dateCreated': item.last().attr('timestamp')
						});
					},
					down: function(html) {
						var overheadli = $('ul.product-groups-listview${myid} li.productoverheaditem').last();
						var ul = $('ul.product-groups-listview${myid}');
						if (overheadli.length == 0) {
							ul.prepend(html);
						} else {
							overheadli.after(html);
						}
						ul.listview('refresh');
						fixedProductGroupsImage();
					},
					up: function(html) {
						$('ul.product-groups-listview${myid}').append(html).listview('refresh');
						fixedProductGroupsImage();
					}
				});
				doOverheadGroupRequest();
// 	        	doGroupsRequest();
				function doGroupsRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.product-groups-listview${myid}').html(html).listview('refresh');
							fixedProductGroupsImage();
						}
					});
				}
				function checkTypeForGroups() {
					return checkboxValue('div.product-list-groups${myid} input:checked[name="group-checkbox-type"]');
				}
				function checkAreaForGroups() {
					return checkboxValue('div.product-list-groups${myid} input:checked[name="checkbox-area"]');
				}
				function checkCreditForGroups() {
					return checkboxValue('div.product-list-groups${myid} input:checked[name="checkbox-credit"]');
				}
				function exGroupIds() {
					var a = [];
					$('ul.product-groups-listview${myid} li.productoverheaditem').each(function(i) {
						a[i] = $(this).attr('pid');
					});
					return a.join(',');
				}
				function doOverheadGroupRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listOverheadItems.html?product.saleType=${product.saleType}',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							var ul = $('ul.product-groups-listview${myid}');
							ul.html(html);
							if (ul.find('li.productoverheaditem').length == 0) {
								doGroupsRequest();
							} else {
								ul.listview('refresh');
								fixedPurchaseImage();
							}
						}
					});
				}
				function fixedProductGroupsImage() {
					if ($('style.productGroups').length > 0) {
						return;
					}
					var lis = $('ul.product-groups-listview${myid}').find('li.productdatecreateditem:eq(0)');
					if (lis.length > 0) {
						var height = lis.height() - 3;
						var css = ['<style type="text/css" class="productGroups"> img.productliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
						$('div.product-groups-page').append(css.join(''));
					}
				}
				$('ul.product-groups-listview${myid}').listview({
					filterCallback: function() {
					}
				}).on("listviewbeforefilter", function (e, data) {
					var $ul = $(this), $input = $(data.input), value = $.trim($input.val()), html = "";
			        if (value && value.length > 2) {
			            $ul.html( "<li><div class='ui-loader'><span class='ui-icon ui-icon-loading'></span></div></li>" );
			            $ul.listview("refresh");
			            $.ajax({
			                url: "${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}",
			                data: {
			                    'product.productName': $input.val(),
			                    '_': new Date().getTime()
			                }
			            }).then(function(html) {
			                $ul.html(html);
			                $ul.listview( "refresh" );
			            });
			        } else if (value.length <= 0) {
// 			        	doGroupsRequest();
						doOverheadGroupRequest();
			        }
			    });
				$('div.product-list-groups${myid} input[type="checkbox"]').bind('click', function() {
		            var $this = $(this);
		            var $input = $('div.product-list-groups${myid}  input[data-type="search"]').first();
					var q = $.extend({}, {
						'productTypes': checkTypeForGroups(),
						'productLocations': checkAreaForGroups(),
						'credits':checkCreditForGroups()
					}, {
						'product.productName': $input.val(),
						'_': new Date().getTime()
					});
					if (q.productTypes == '' && q.productLocations == '' && q.credits == '' && q['product.productName'] == '') {
						doOverheadGroupRequest();
					} else {
			            $.ajax({
			            	type: 'GET',
			                url: "${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}",
			                data: q,
			                success: function(html) {
			                	var ul = $('ul.product-groups-listview${myid}');
			                	ul.html(html);
			                	ul.listview( "refresh" );
			                	fixedProductGroupsImage();
			                }
			            });
					}
				});
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="1" name="offset"/></jsp:include>
	</div>
	</body>
</html>
