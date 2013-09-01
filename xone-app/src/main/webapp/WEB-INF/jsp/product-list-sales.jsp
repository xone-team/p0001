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
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="product-sales-page" data-dom-cache="false">
		<div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a href="${pageContext.request.contextPath}/product/index.html?_=${myid}">所有产品</a></li>
			        <li><a href="#" class="ui-btn-active">促销产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listGroups.html?_=${myid}">组团产品</a></li>
			    </ul>
			</div>
		</div>
		<div data-role="content" style="padding-top:2px;">
			<form name="querychoiseform" action="#">
				<div class="searchconditionssales" data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
					    <h4>高级搜索</h4>
						<div data-role="navbar" data-mini="true" data-theme="e">
						    <ul>
						        <li><a href="#searchtype" class="navbartabs ui-btn-active">类型</a></li>
						        <li><a href="#searcharea" class="navbartabs">地区</a></li>
						        <li><a href="#searchcredit" class="navbartabs">信誉</a></li>
						    </ul>
						</div>
						<div data-id="#searchtype" data-role="controlgroup" data-mini="true" class="salesearchclass">
							<c:forEach items="${productType}" var="it">
						    <input type="checkbox" name="checkbox-type" value="${it.value}" id="checkbox-${it.value}a${myid}" checked="">
						    <label for="checkbox-${it.value}a${myid}">${it.name}</label>
                            </c:forEach>
						</div>
						<div data-id="#searcharea" data-role="controlgroup" data-mini="true" class="salesearchclass" style="display:none;">
						    <input type="checkbox" name="checkbox-1a" id="checkbox-0b${myid}" value="" checked="">
						    <label for="checkbox-0b${myid}">全部</label>
						    <input type="checkbox" name="checkbox-1a" id="checkbox-1b${myid}" value="上海">
						    <label for="checkbox-1b${myid}">上海</label>
						    <input type="checkbox" name="checkbox-1a" id="checkbox-2b${myid}" value="天津">
						    <label for="checkbox-2b${myid}">天津</label>
						</div>
						<div data-id="#searchcredit" data-role="controlgroup" data-mini="true" class="salesearchclass" style="display:none;">
						    <input type="checkbox" name="checkbox-2a" id="checkbox-0c${myid}" value="" checked="">
						    <label for="checkbox-0c${myid}">全部</label>
						    <input type="checkbox" name="checkbox-2a" id="checkbox-1c${myid}" value="1">
						    <label for="checkbox-1c${myid}">信誉好</label>
						    <input type="checkbox" name="checkbox-2a" id="checkbox-2c${myid}" value="0">
						    <label for="checkbox-2c${myid}">信誉一般</label>
						</div>
				</div>
			</form>
			<div style="width:100%;padding-top:10px;" class="product-sales-list${myid}" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
		        <ul class="product-sales-listview${myid}" data-role="listview" data-filter="true" data-filter-placeholder="促销关键字搜索..." data-inset="true">
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js?_=${myid}"></script>
		<script type="text/javascript">
			$('div.product-sales-page').bind('pageinit', function(event) {
				$('a.navbartabs').click(function(e) {
					e.preventDefault();
					$('div.salesearchclass').hide();
					$('a.navbartabs').removeClass('ui-btn-active');
					var t = $(this);
					$('div[data-id="' + t.attr('href') + '"]').show();
					t.addClass('ui-btn-active');
				});
				$('div.product-sales-list${myid}').mypullupdown({
					url:'${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
					onDown: function() {
						var item = $('ul.product-sales-listview${myid}').find('li.productdatecreateditem');
						return $.extend({}, {
							'product.productName': $('div.product-sales-list${myid}').find('input[data-type="search"]').val(),
							'exIds': exSaleIds(),
							'productTypes': checkType()
						}, {
							'itemcount': item.length,
							'itemaction': 'down',
							'product.dateCreated': item.first().attr('timestamp')
						});
					},
					onUp: function() {
						var item = $('ul.product-sales-listview${myid}').find('li.productdatecreateditem');
						return $.extend({}, {
							'product.productName': $('div.product-sales-list${myid}').find('input[data-type="search"]').val(),
							'exIds': exSaleIds(),
							'productTypes': checkType()
						}, {
							'itemcount': item.length,
							'itemaction': 'up',
							'product.dateCreated': item.last().attr('timestamp')
						});
					},
					down: function(html) {
						var overheadli = $('ul.product-sales-listview${myid} li.productoverheaditem').last();
						var ul = $('ul.product-sales-listview${myid}');
						if (overheadli.length == 0) {
							ul.prepend(html);
						} else {
							overheadli.after(html);
						}
						ul.listview('refresh');
						fixedProductSaleImage();
					},
					up: function(html) {
						$('ul.product-sales-listview${myid}').append(html).listview('refresh');
						fixedProductSaleImage();
					}
				});
				function checkType() {
					var v = '';
					$('div.product-sales-page  input:checked[name="checkbox-type"]').each(function() {
						if (this.value != '') {
							v += ',' + this.value;
						}
					});
					if (v == '') {
						return v;
					}
					v = v.replace(/^,/ig, '');
					return v;
				}
				doOverheadSaleRequest();
// 	        	doSaleRequest();
				function doSaleRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.product-sales-listview${myid}').html(html).listview('refresh');
							fixedProductSaleImage();
						}
					});
				}
				function exSaleIds() {
					var a = [];
					$('ul.product-sales-listview${myid} li.productoverheaditem').each(function(i) {
						a[i] = $(this).attr('pid');
					});
					return a.join(',');
				}
				function doOverheadSaleRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listOverheadItems.html?product.saleType=${product.saleType}',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							var ul = $('ul.product-sales-listview${myid}');
							ul.html(html);
							if (ul.find('li.productoverheaditem').length == 0) {
								doSaleRequest();
							} else {
								ul.listview('refresh');
								fixedProductSaleImage();
							}
						}
					});
				}
				function fixedProductSaleImage() {
					if ($('style.productsale').length > 0) {
						return;
					}
					var lis = $('ul.product-sales-listview${myid}').find('li.productdatecreateditem:eq(0)');
					if (lis.length > 0) {
						var height = lis.height() - 3;
						var css = ['<style type="text/css" class="productsale"> img.productliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
						$('div.product-sales-page').append(css.join(''));
					}
				}
				$('ul.product-sales-listview${myid}').listview({
					filterCallback: function() {
					}
				}).on("listviewbeforefilter", function (e, data) {
					var $ul = $(this), $input = $(data.input), value = $.trim($input.val()), html = "";
			        if (value && value.length >= 2) {
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
// 			        	doSaleRequest();
			        	doOverheadSaleRequest();
			        }
			    });
				$('div.searchconditionssales input[type="checkbox"]').bind('click', function() {
		            var $this = $(this);
		            $this.attr("checked", !$this.attr('checked'));
		            var $input = $('div.product-sales-page  input[data-type="search"]').first();
					var q = $.extend({}, {
						'productTypes': checkType()
					}, {
						'product.productName': $input.val(),
						'_': new Date().getTime()
					});
		            $.ajax({
		            	type: 'GET',
		                url: "${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}",
		                data: q,
		                success: function(html) {
		                	var ul = $('ul.product-sales-listview${myid}');
		                	ul.html(html);
		                	ul.listview( "refresh" );
		                }
		            });
				});
			});
		</script>
		<jsp:include page="footer.jsp">
			<jsp:param value="1" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
