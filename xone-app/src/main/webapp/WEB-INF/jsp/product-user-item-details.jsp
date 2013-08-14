<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li data-role="list-divider">产品详细</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">编　　号:</td>
			<td>${product.id}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品名称:</td>
			<td>${product.productName}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品类型:</td>
			<td>${product.productTypeName}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品产地:</td>
			<td>${product.productAddress}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品属地:</td>
			<td>${product.productLocation}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">价　　格:</td>
			<td>${product.productPrice}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">数　　量:</td>
			<td>${product.productNum}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">描　　述:</td>
			<td>${product.productDesc}</td>
		</tr>
	</table>
</li>
<li data-role="list-divider">产品审核</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">审核时间:</td>
			<td><fmt:formatDate value="${product.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">审核状态:</td>
			<td>${product.checkStatusName}</td>
		</tr>
	</table>
</li>
<c:if test="${login}">
<li>
	<div>
		<a href="${pageContext.request.contextPath}/product/updateItem.html?product.id=${product.id}" class="productupdatebutton" data-role="button" data-theme="b" data-iconpos="right" data-icon="edit">更新信息</a>
	</div>
</li>
<li>
	<div>
		<form class="overheadform" action="${pageContext.request.contextPath}/product/doTopApply.html" method="post">
			<input type="hidden" name="overhead.refId" value="${product.id}">
			<input type="hidden" name="overhead.overheadType" value="1">
			<a href="#" class="overheadformbutton" data-role="button" data-icon="plus" data-theme="b" data-iconpos="right">申请顶置</a>
		</form>
		<script type="text/javascript">
			$('a.productupdatebutton').buttonMarkup("refresh");
			$('a.overheadformbutton').buttonMarkup("refresh").click(function(e) {
				e.preventDefault();
				if (confirm('确认申请顶置')) {
					var $form = $('form.overheadform').first();
					$.ajax({
						type: $form.attr('method'),
						url: $form.attr('action'),
						data: $form.serialize(),
						success: function(html) {
							$('form.overheadform').closest('li').html(html);
						}
					});
				}
				return false;
			});
		</script>
	</div>
</li>
</c:if>
<li data-role="list-divider">产品图片</li>
<c:forEach var="item" items="${product.ids}">
<li data-role="none" style="padding:0px;">
	<div class="productimage" >
		<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item}" alt="" width="100%" height="100%"/>
	</div>
</li>
</c:forEach>