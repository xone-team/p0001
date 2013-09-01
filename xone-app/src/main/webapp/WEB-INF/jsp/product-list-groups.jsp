<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Hello World</title>
		<jsp:include page="commons.jsp"></jsp:include>
	</head>
	<body><c:set var="myid" value="${myid}" />
	<div data-role="page" class="product-groups-page" data-dom-cache="true">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a href="${pageContext.request.contextPath}/product/index.html?_=${myid}">所有产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html?_=${myid}">促销产品</a></li>
			        <li><a href="#" class="ui-btn-active">组团产品</a></li>
			    </ul>
			</div>
		</div>
		<div data-role="content">
			<div class="searchconditionsgroup" data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d" style="margin-bottom:15px;">
			    <h2>高级搜索</h2>
				<div data-role="controlgroup" data-mini="true" style="margin-bottom:15px;">
					<c:forEach items="${productType}" var="it">
				    <input type="checkbox" name="group-checkbox-type" value="${it.value}" id="group-checkbox-${it.value}a${myid}">
				    <label for="group-checkbox-${it.value}a${myid}">${it.name}</label>
                    </c:forEach>
				</div>
			</div>
			<div class="product-groups-list${myid}" style="width:100%;padding-top:10px;" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
		        <ul class="product-groups-listview${myid}" data-role="listview" data-filter="true" data-filter-placeholder="促销关键字搜索..." data-inset="true">
			        <li data-role="list-divider">数据加载中，请稍候...</li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js?_=${myid}"></script>
		<script type="text/javascript">
			$('div.product-groups-page').bind('pageinit', function(event) {
				$('a.navbartabs').click(function(e) {
					e.preventDefault();
					$('div.salesearchclass').hide();
					$('a.navbartabs').removeClass('ui-btn-active');
					var t = $(this);
					$('div[data-id="' + t.attr('href') + '"]').show();
					t.addClass('ui-btn-active');
				});
				loadcheckboxjsforgroups();
				$('div.product-groups-list${myid}').mypullupdown({
					url:'${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
					onDown: function() {
						var item = $('ul.product-groups-listview${myid}').find('li.productdatecreateditem');
						return $.extend({}, {
							'product.productName': $('ul.product-groups-list${myid}').find('input[data-type="search"]').val(),
							'exIds': exGroupIds(),
							'productTypes': checkTypeForGroups()
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
							'productTypes': checkTypeForGroups()
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
				function loadcheckboxjsforgroups() {
					if ($('head').find('script.checkboxref').length == 0) {
						loadScript('${pageContext.request.contextPath}/js/myallcheckbox.js?_=${myid}', function() {
							$('div.product-groups-page input[type="checkbox"]').myallcheckbox();
						}, 'checkboxref');
					} else {
						$('div.product-groups-page input[type="checkbox"]').myallcheckbox();
					}
				}
				function checkTypeForGroups() {
					return checkboxValue('div.product-groups-page input:checked[name="group-checkbox-type"]');
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
				$('div.product-groups-page input[type="checkbox"]').bind('click', function() {
		            var $this = $(this);
		            var $input = $('div.product-groups-page  input[data-type="search"]').first();
					var q = $.extend({}, {
						'productTypes': checkTypeForGroups()
					}, {
						'product.productName': $input.val(),
						'_': new Date().getTime()
					});
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
				});
			});
		</script>
		<jsp:include page="footer.jsp"><jsp:param value="1" name="offset"/></jsp:include>
	</div>
	</body>
</html>
