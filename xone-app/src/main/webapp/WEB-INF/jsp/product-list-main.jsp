<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>产品列表</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<jsp:include page="commons.jsp"></jsp:include>
		<jsp:include page="iscrollheader.jsp"></jsp:include>
	</head>
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="product-main-page" data-dom-cache="true">
		<div data-id="myheader" data-role="header" data-position="fixed">
			<div data-role="navbar" data-theme="e">
			    <ul>
			        <li><a class="allproducts" href="#" class="ui-btn-active">所有产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listSales.html?_=${myid}">促销产品</a></li>
			        <li><a href="${pageContext.request.contextPath}/product/listGroups.html?_=${myid}">组团产品</a></li>
			    </ul>
			</div>
		</div>
		<div class="product-list-main${myid}" data-role="content">
			<div class="searchconditionssales" data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">
			    <h4>高级搜索</h4>
				<div data-role="navbar" data-mini="true" data-theme="e">
				    <ul>
				        <li><a href="#searchtype${myid}" class="navbartabs ui-btn-active">类型</a></li>
				        <li><a href="#searcharea${myid}" class="navbartabs">属地</a></li>
				        <li><a href="#searchcredit${myid}" class="navbartabs">信誉</a></li>
				    </ul>
				</div>
				<div data-id="#searchtype${myid}" data-role="controlgroup" data-mini="true" class="salesearchclass">
					<c:forEach items="${productType}" var="it">
				    <input type="checkbox" name="checkbox-type" value="${it.value}" id="checkbox-${it.value}a${myid}">
				    <label for="checkbox-${it.value}a${myid}">${it.name}</label>
                    </c:forEach>
				</div>
				<div data-id="#searcharea${myid}" data-role="controlgroup" data-mini="true" class="salesearchclass" style="display:none;">
				    <input type="checkbox" name="checkbox-area" id="checkbox-0b${myid}" value="">
				    <label for="checkbox-0b${myid}">全部</label>
				    <input type="checkbox" name="checkbox-area" id="checkbox-1b${myid}" value="上海">
				    <label for="checkbox-1b${myid}">上海</label>
				    <input type="checkbox" name="checkbox-area" id="checkbox-2b${myid}" value="天津">
				    <label for="checkbox-2b${myid}">北京</label>
				    <input type="checkbox" name="checkbox-area" id="checkbox-3b${myid}" value="深圳">
				    <label for="checkbox-3b${myid}">深圳</label>
				</div>
				<div data-id="#searchcredit${myid}" data-role="controlgroup" data-mini="true" class="salesearchclass" style="display:none;">
				    <input type="checkbox" name="checkbox-credit" id="checkbox-0c${myid}" value="">
				    <label for="checkbox-0c${myid}">全部</label>
				    <input type="checkbox" name="checkbox-credit" id="checkbox-1c${myid}" value="1">
				    <label for="checkbox-1c${myid}">信誉好</label>
				    <input type="checkbox" name="checkbox-credit" id="checkbox-2c${myid}" value="0">
				    <label for="checkbox-2c${myid}">信誉一般</label>
				</div>
			</div>
			<div style="width:100%;" class="product-pull-div-list${myid}" data-iscroll>
				<div class="iscroll-pulldown">
			        <span class="iscroll-pull-icon"></span>
			        <span class="iscroll-pull-label"></span>
				</div>
				<div style="height:15px">&nbsp;</div>
				<ul class="ul-product-list${myid}" data-id="listview" data-role="listview" data-filter="true" data-filter-placeholder="产品关键字(至少二个)" data-inset="true">
			        <li data-role="list-divider">数据加载中，请稍候...</li>
		        </ul>
				<div class="iscroll-pullup">
					<span class="iscroll-pull-icon"></span>
					<span class="iscroll-pull-label"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypullupdown.js?_=${myid}"></script>
		<script defer="defer" type="text/javascript">
			$(document).delegate('div.product-main-page', "pageinit", function(event) {
				$('a.allproducts').addClass('ui-btn-active');
			});
			$('div.product-main-page').bind("pageinit", function(event) {
				$('div.product-pull-div-list${myid}').mypullupdown({
					url:'${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
					onDown: function() {
						var item = $('ul.ul-product-list${myid}').find('li.productdatecreateditem');
						return $.extend({}, {
							'product.productName': $('div.product-list-main${myid}').find('input[data-type="search"]').val(),
							'exIds': exIds()
						}, {
							'itemcount': item.length,
							'itemaction': 'down',
							'product.dateCreated': item.first().attr('timestamp')
						});
					},
					onUp: function() {
						var item = $('ul.ul-product-list${myid}').find('li.productdatecreateditem');
						return $.extend({}, {
							'product.productName': $('div.product-list-main${myid}').find('input[data-type="search"]').val(),
							'exIds': exIds()
						}, {
							'itemcount': item.length,
							'itemaction': 'up',
							'product.dateCreated': item.last().attr('timestamp')
						});
					},
					down: function(html) {
						var overheadli = $('ul.ul-product-list${myid} li.productoverheaditem').last();
						var ul = $('ul.ul-product-list${myid}');
						if (overheadli.length == 0) {
							ul.prepend(html);
						} else {
							overheadli.after(html);
						}
						ul.listview('refresh');
						fixedProductImage();
					},
					up: function(html) {
						$('ul.ul-product-list${myid}').append(html).listview('refresh');
						fixedProductImage();
					}
				});
				function checkProductType() {
					return checkboxValue('div.product-sales-page  input:checked[name="checkbox-type"]');
				}
				function checkProductArea() {
					return checkboxValue('div.product-sales-page  input:checked[name="checkbox-area"]');
				}
				function checkProductCredit() {
					return checkboxValue('div.product-sales-page  input:checked[name="checkbox-credit"]');
				}
				doOverheadRequest();
// 	        	doRequest();
				function doRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listItems.html?product.saleType=${product.saleType}',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							$('ul.ul-product-list${myid}').html(html).listview('refresh');
							fixedProductImage();
						}
					});
				}
				function exIds() {
					var a = [];
					$('ul.ul-product-list${myid} li.productoverheaditem').each(function(i) {
						a[i] = $(this).attr('pid');
					});
					return a.join(',');
				}
				function doOverheadRequest() {
					$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/product/listOverheadItems.html?product.saleType=${product.saleType}',
						data: '_=' + new Date().getTime(),
						success: function(html) {
							var ul = $('ul.ul-product-list${myid}');
							ul.html(html);
							if (ul.find('li.productoverheaditem').length == 0) {
								doRequest();
							} else {
								ul.listview('refresh');
								fixedProductImage();
							}
						}
					});
				}
				function fixedProductImage() {
					if ($('style.product').length > 0) {
						return;
					}
					var lis = $('ul.ul-product-list${myid} li:eq(0)');
					if (lis.length > 0) {
						var height = lis.height() - 3;
						var css = ['<style type="text/css" class="product"> img.productliimage {height:', height, 'px;', 'width:', height, 'px;}</style>'];
						$('div.product-main-page').append(css.join(''));
					}
				}
				$('ul.ul-product-list${myid}').listview({
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
// 			                $ul.trigger("updatelayout");
			            });
			        } else if (value.length <= 0) {
// 			        	doRequest();
			        	doOverheadRequest();
			        }
			    });
			});
		</script>
		<jsp:include page="footer.jsp">
			<jsp:param value="1" name="offset"/>
		</jsp:include>
	</div>
	</body>
</html>
