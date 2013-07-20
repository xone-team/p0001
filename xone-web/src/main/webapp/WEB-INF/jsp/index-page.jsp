<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>欢迎使用</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="common-header.jsp"></jsp:include>
	</head>
<body>
	<jsp:include page="common-nav.jsp"><jsp:param value="1" name="offset"/></jsp:include>
	<div class="container">
		<div class="hero-unit">
			<h1>恒鑫水产品交易平台</h1>
			<p>这里是关于网站，公司及公司产品的大概介绍.本网站总共分为三个大频道，售卖产品、购买产品和用户中心，
			售卖产品，是用户有产品出售，发布到交易平台上展示，让希望买到对应的产品的商家很容易购买到自己希望的产品和规格;
			购买产品，是用户希望购买到相关产品，可以查看商家发布的求购产品及详细情况。
			用户中心，跟用户相关的操作及信息，是用户在交易平台上对应的操作功能，例如发布产品，
			求购产品，物流配送，产品订阅等都可在用户中心查看、发布和修改信息。</p>
			<p>
				<a href="#" class="btn btn-primary btn-large">更多详情 &raquo;</a>
			</p>
		</div>
		<!-- Example row of columns -->
		<div class="row">
			<div class="span4">
				<h2>售卖产品</h2>
				<p>售卖产品，是用户有产品出售，发布到交易平台上展示，让希望买到对应的产品的商家很容易购买到自己希望的产品和规格</p>
				<p>
					<a class="btn" href="${pageContext.request.contextPath}/product/list.html">更多信息 &raquo;</a>
				</p>
			</div>
			<div class="span4">
				<h2>购买产品</h2>
				<p>购买产品，是用户希望购买到相关产品，可以查看商家发布的求购产品及详细情况。</p>
				<p>
					<a class="btn" href="#">更多信息&raquo;</a>
				</p>
			</div>
			<div class="span4">
				<h2>用户中心</h2>
				<p>用户中心，跟用户相关的操作及信息，是用户在交易平台上对应的操作功能，例如发布产品，求购产品，物流配送，产品订阅等都可在用户中心查看、发布和修改信息。</p>
				<p>
					<a class="btn" href="#">体验一下&raquo;</a>
				</p>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
