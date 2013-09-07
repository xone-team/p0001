<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li data-role="list-divider">组团信息</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">编　　号:</td>
			<td>${productGroup.id}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">预定数量:</td>
			<td>${productGroup.groupNum}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">预定日期:</td>
			<td><fmt:formatDate value="${productGroup.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">状　　态:</td>
			<td>${productGroup.checkStatusName}</td>
		</tr>
	</table>
</li>
<c:if test="${not empty productGroup.remark}">
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">审核日期:</td>
			<td><fmt:formatDate value="${productGroup.dateCheck}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">审核备注:</td>
			<td>${productGroup.remark}</td>
		</tr>
	</table>
</li>
</c:if>
<c:if test="${productGroup.checkStatus != '1'}">
<li>
	<div>
		<form class="groupitemform" action="${pageContext.request.contextPath}/product/doCancelGroup.html" method="post">
			<input type="hidden" name="productGroup.id" value="${productGroup.id}">
			<a href="#" class="groupitemformbutton" data-role="button" data-icon="delete" data-theme="b" data-iconpos="right">取消组团</a>
		</form>
		<script type="text/javascript">
			$('a.groupitemformbutton').buttonMarkup("refresh").click(function(e) {
				e.preventDefault();
				$.myConfirm('确认取消组团', function() {
					var $form = $('form.groupitemform').first();
					$.ajax({
						type: $form.attr('method'),
						url: $form.attr('action'),
						data: $form.serialize(),
						success: function(html) {
							$('form.groupitemform').closest('li').html(html);
						}
					});
				});
				return false;
			});
		</script>
	</div>
</li>
</c:if>
<li data-role="list-divider">组团产品信息</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品编号:</td>
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
<li data-role="list-divider">组团产品审核历史</li>
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
			<td class="mylabel">产品状态:</td>
			<td>${product.checkStatusName}</td>
		</tr>
	</table>
</li>
<c:if test="${not empty product.productCheckList}">
	<li data-role="list-divider">审核历史</li>
	<c:forEach var="item" items="${product.productCheckList}">
	<li>
		<table style="width:100%">
			<tr>
				<td class="mylabel">审核时间:</td>
				<td><fmt:formatDate value="${item.dateCreated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<td class="mylabel">审核状态:</td>
				<td>${item.checkStatusName}</td>
			</tr>
			<tr>
				<td class="mylabel">审核备注:</td>
				<td>${item.remark}</td>
			</tr>
		</table>
	</li>
	</c:forEach>
</c:if>
<li data-role="list-divider">产品图片</li>
<c:forEach var="item" items="${product.ids}">
<li data-role="none" style="padding:0px;">
	<div class="productimage" >
		<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item}" alt="" width="100%" height="100%"/>
	</div>
</li>
</c:forEach>