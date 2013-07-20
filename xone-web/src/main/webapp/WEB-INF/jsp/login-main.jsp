<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户中心</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="common-header.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="common-nav.jsp"><jsp:param value="5" name="offset"/></jsp:include>
	<div class="container">
		<div class="row">
			<div class="span3">
				<h2>售卖产品</h2>
				<p>售卖产品，是用户有产品出售，发布到交易平台上展示，让希望买到对应的产品的商家很容易购买到自己希望的产品和规格</p>
				<p>
					<a class="btn" href="${pageContext.request.contextPath}/product/list.html">更多信息 &raquo;</a>
				</p>
			</div>
			<div class="span9">
				<h2>购买产品</h2>
				<p>购买产品，是用户希望购买到相关产品，可以查看商家发布的求购产品及详细情况。</p>
				<p>
					<a class="btn" href="#">更多信息&raquo;</a>
				</p>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
