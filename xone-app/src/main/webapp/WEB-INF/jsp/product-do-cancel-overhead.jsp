<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${null != overhead && overhead.flagDeleted == '1' }">
		<div>成功执行你的顶置取消请求.</div>
		<script type="text/javascript">
			$.mobile.back();
		</script>
	</c:when>
	<c:when test="${null == productGroup}">
		<div>记录已经删除。</div>
		<script type="text/javascript">
			$.mobile.back();
		</script>
	</c:when>
	<c:otherwise>
		<div>顶置申请审核通过的记录不能被取消.</div>
	</c:otherwise>
</c:choose>