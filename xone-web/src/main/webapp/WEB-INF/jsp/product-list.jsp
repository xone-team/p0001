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
		<link rel="stylesheet" href="${STATIC_ROOT}/css/docs.css" />
		<link rel="stylesheet" href="${STATIC_ROOT}/css/listview.css" />
		<jsp:include page="common-header.jsp"></jsp:include>
	</head>
	<body>
		<jsp:include page="common-nav.jsp"><jsp:param value="2" name="offset"/></jsp:include>
		<div class="container">
			<div class="row">
				<div class="span9 bs-docs-sidebar">
					<form class="form-search">
						<div class="span6 input-prepend" style="text-align: right;">
							<span class="add-on">搜索产品</span> <input type="text" class="span4" />
						</div>
						<div class="input-append">
							<button type="submit" class="btn">搜索</button>
						</div>
					</form>
					<div class="row-fluid">
					    <div class="span12">
							<ul class="listview image" style="width:100%">
								<c:forEach var="item" items="${list}">
								<li>
		                            <div class="icon">
		                                <img src="/xone-app/assistant/image.html?id=${item.ids[0]}">
		                            </div>
		                            <div class="data">
										<h4>${item.productName}</h4>
										<p>${item.dateCreated},${item.productDesc}</p>
		                                <a href="#">查看详情</a>
		                            </div>
		                        </li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="pagination pagination-centered">
					  <ul>
					    <li><a href="#" class="disabled">上一页</a></li>
					    <li><a href="#" class="active">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li><a href="#">下一页</a></li>
					  </ul>
					</div>
				</div>
				<div class="span3" style="margin-left:13px;">
					<ul class="nav nav-list bs-docs-sidenav" style="margin-top:0px;">
						<li><a href="#global" style="padding:15px 15px;"><img class="img-rounded mybigimage"
								src="${STATIC_ROOT}/image/apple.png" style="width:258px;"></a></li>
						<li><a href="#gridSystem" style="padding:15px 15px;"><img class="img-rounded mybigimage"
								src="${STATIC_ROOT}/image/angry.jpg" style="width:258px;"></a></li>
					</ul>
				</div>
			</div>
			<jsp:include page="common-footer.jsp"></jsp:include>
		</div>
		<jsp:include page="common-bottom.jsp"></jsp:include>
	</body>
</html>
