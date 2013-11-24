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
	<body><c:set var="myid" value="${identify}" />
	<div data-role="page" class="companyinfoitempage" data-dom-cache="false">
		<style type="text/css">
			td.mylabel {
				width:80px;
			}
		</style>
		<div data-id="myheader" data-role="header" data-tap-toggle="false" data-position="fixed">
<!-- 			<a href="#" data-icon="back" data-rel="back">返回</a> -->
			<a href="#" data-rel="back" data-icon="back">返回</a>
			<h1>公司详情</h1>
			<a href="${pageContext.request.contextPath}/assistant/companyInfo.html?companyInfo.id=${companyInfo.id}" class="companyinfo-item-page-refresh ui-btn-right" data-icon="refresh">刷新</a>
		</div>
		<div data-role="content" data-dom-cache="false">
			<ul class="companyinfo-item-page-view" data-role="listview" data-inset="true" data-mini="true">
				<li class="companyinfoli">
					<table style="width:100%">
						<tr>
							<td class="mylabel">公司名称:</td>
							<td>${companyInfo.name}</td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">公司地址:</td>
							<td>${companyInfo.address}</td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">公司电话:</td>
							<td>${companyInfo.tel}</td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">移动电话:</td>
							<td>${companyInfo.mobile}</td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">联系人:</td>
							<td>${companyInfo.contact}</td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">公司传真:</td>
							<td>${companyInfo.fax}</td>
						</tr>
					</table>
				</li>
				<li>
					<table style="width:100%">
						<tr>
							<td class="mylabel">公司简介:</td>
							<td>${companyInfo.intro}</td>
						</tr>
					</table>
				</li>
				<li data-role="list-divider" data-theme="e">公司产品图片</li>
				<c:forEach var="item" items="${companyInfo.ids}">
				<li data-role="none" style="padding:0px;">
					<div>
						<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item}" alt="" width="100%" height="100%" class="companyinfoimage"/>
					</div>
				</li>
				</c:forEach>
			</ul>
			<script type="text/javascript">
			$('div.companyinfoitempage').bind('pageinit', function(e) {
				(function($) {
					if ($('script.companyinfoimagescript').length > 0) {
						return;
					}
					var width = $.mobile.activePage.width() - 10;
					var css = ['<style type="text/css" class="companyinfoimagescript">.companyinfoimage {height:', width, 'px;', 'width:', width, 'px;}</style>'];
					$('div.companyinfoitempage').append(css.join(''));
				})(jQuery);
			});
			</script>
		</div>
		<jsp:include page="footer.jsp"><jsp:param value="1" name="offset"/></jsp:include>
	</div>
	</body>
</html>
