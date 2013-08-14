<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li data-role="list-divider">产品详细</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">编　　号:</td>
			<td>${purchase.id}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品名称:</td>
			<td>${purchase.purchaseName}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品类型:</td>
			<td>${purchase.purchaseTypeName}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品产地:</td>
			<td>${purchase.purchaseAddress}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品属地:</td>
			<td>${purchase.purchaseLocation}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">数　　量:</td>
			<td>${purchase.purchaseNum}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">描　　述:</td>
			<td>${purchase.purchaseDesc}</td>
		</tr>
	</table>
</li>
<li data-role="list-divider">产品审核</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">审核时间:</td>
			<td><fmt:formatDate value="${purchase.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">审核状态:</td>
			<td>${purchase.checkStatusName}</td>
		</tr>
	</table>
</li>
<c:if test="${login}">
<li>
	<div>
	<a href="${pageContext.request.contextPath}/purchase/updateItem.html?purchase.id=${purchase.id}" class="purchaseupdatebutton" data-role="button" data-theme="b" data-iconpos="right" data-icon="edit">更新信息</a>
	</div>
</li>
<li>
	<div>
		<form class="overheadpurchaseform" action="${pageContext.request.contextPath}/purchase/doTopApply.html" method="post">
			<input type="hidden" name="overhead.refId" value="${purchase.id}">
			<input type="hidden" name="overhead.overheadType" value="2">
			<a href="#" class="overheadformpurchasebutton" data-role="button" data-icon="plus" data-theme="b" data-iconpos="right">申请顶置OK</a>
		</form>
		<script type="text/javascript">
			$('a.purchaseupdatebutton').buttonMarkup("refresh");
			$('a.overheadformpurchasebutton').buttonMarkup("refresh").click(function(e) {
				e.preventDefault();
				if (confirm('确认申请顶置')) {
					var $form = $('form.overheadpurchaseform').first();
					alert($form.attr('action'));
					$.ajax({
						type: $form.attr('method'),
						url: $form.attr('action'),
						data: $form.serialize(),
						success: function(html) {
							$('form.overheadpurchaseform').closest('li').html(html);
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
<c:forEach var="item" items="${purchase.ids}">
<li data-role="none" style="padding:0px;">
	<div class="purchaseimage" >
		<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item}" alt="" width="100%" height="100%"/>
	</div>
</li>
</c:forEach>