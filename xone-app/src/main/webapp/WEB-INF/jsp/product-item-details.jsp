<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li><c:set var="myid" value="${identify}" />
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
<c:if test="${login}">
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">产品价格:</td>
			<td>${product.productPrice}</td>
		</tr>
	</table>
</li>
</c:if>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">数　　量:</td>
			<td><span class="pnum">${product.productNum}</span></td>
		</tr>
	</table>
</li>
<c:if test="${product.groupSaleType}">
<li>
	<table style="width:100%">
		<tr>
			<td style="width:120px;">组团确认数量:</td>
			<td style="text-align:left;"><span class="pnum">0</span></td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td style="width:120px;">组团待定数量:</td>
			<td style="text-align:left;"><span class="pnum">0</span></td>
		</tr>
	</table>
</li>
</c:if>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">描　　述:</td>
			<td>${product.productDesc}</td>
		</tr>
	</table>
</li>
<c:if test="${login}">
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">手机号码:</td>
			<td>${product.person.cellphone}</td>
		</tr>
	</table>
</li>
<li>
	<table style="width:100%">
		<tr>
			<td class="mylabel">联&nbsp;&nbsp;系&nbsp;&nbsp;人:</td>
			<td>${product.person.contactor}</td>
		</tr>
	</table>
</li>
<c:if test="${product.groupSaleType}">
	<li class="kgroups">
		<form class="kgroupsform" action="${pageContext.request.contextPath}/product/doGroups.html?_=${myid}" method="POST">
			<input type="hidden" name="productGroup.productId" value="${product.id}" data-clear-btn="true"/>
			<table style="width:100%">
				<tr>
					<td style="width:50%;">参与组团数量:</td>
					<td style="width:50%;">
						<input type="text" name="productGroup.groupNum" class="textinput${myid}" value="" data-clear-btn="true"/>
					</td>
				</tr>
			</table>
			<script type="text/javascript" id="textvalueid${myid}">
				$('input.textinput${myid}').textinput();
				$('#textvalueid${myid}').remove();
			</script>
		</form>
	</li>
	<li class="kgroupsopt">
		<div>
		<a href="#" class="productgroupbutton${myid}" data-role="button" data-theme="e" data-iconpos="right" data-icon="plus">参与组团</a>
		<script type="text/javascript" id="scriptid${myid}">
			$('a.productgroupbutton${myid}').buttonMarkup("refresh").click(function() {
				var v = $('input.textinput${myid}').val();
				if ('' == $.trim(v)) {
					$.myAlert('请输入参与组团的数量!');
					return false;
				}
				$.myConfirm('确认参与组团', function() {
					var $form = $('form.kgroupsform').first();
					$.ajax({
						type: $form.attr('method'),
						url: $form.attr('action'),
						data: $form.serialize(),
						success: function(html) {
							$('li.kgroups').remove();
							$('li.kgroupsopt').html(html);
						}
					});
				});
// 				if (confirm('确认参与组团')) {
// 					var $form = $('form.kgroupsform').first();
// 					$.ajax({
// 						type: $form.attr('method'),
// 						url: $form.attr('action'),
// 						data: $form.serialize(),
// 						success: function(html) {
// 							$('li.kgroups').remove();
// 							$('li.kgroupsopt').html(html);
// 						}
// 					});
// 				}
			});
			$('#scriptid${myid}').remove();
		</script>
		</div>
	</li>
</c:if>
</c:if>
<li data-role="list-divider" data-theme="e">产品图片</li>
<c:forEach var="item" items="${product.ids}">
<li data-role="none" style="padding:0px;">
	<div class="productimage">
		<img src="${pageContext.request.contextPath}/assistant/image.html?id=${item}" alt="" width="100%" height="100%"/>
	</div>
</li>
</c:forEach>