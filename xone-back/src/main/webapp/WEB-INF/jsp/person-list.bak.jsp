<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Hello World</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${STATIC_ROOT}/css/jquery.mobile-1.3.1.min.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/css/msg.css" />
<script type="text/javascript" src="${STATIC_ROOT}/js/jquery-1.10.0.min.js"></script>
<c:if test="${param.bootstrap == true}">
  <link rel="stylesheet" href="${STATIC_ROOT}/bootstrap/css/bootstrap.min.css" />
  <script type="text/javascript" src="${STATIC_ROOT}/bootstrap/js/bootstrap.min.js"></script>
</c:if>
<script type="text/javascript" src="${STATIC_ROOT}/js/jquery.mobile-1.3.1.min.js"></script>
</head>
<body>
  <div data-role="page" class="product-main-page" data-dom-cache="true">
    <div data-id="myheader" data-role="header" data-backbtn="false" data-position="fixed">
      <div data-role="navbar" data-theme="e">
        <ul>
          <li><a class="allproducts" data-prefetch="true" href="${pageContext.request.contextPath}/product/index.html?_=${identify}" class="ui-btn-active">所有产品</a></li>
          <li><a href="${pageContext.request.contextPath}/product/listSales.html?_=${identify}">促销产品</a></li>
          <li><a href="${pageContext.request.contextPath}/product/listGroups.html?_=${identify}">组团产品</a></li>
        </ul>
      </div>
    </div>
    <div class="product-list-main" data-role="content" data-iscroll>
      <div class="iscroll-pulldown">
        <span class="iscroll-pull-icon"></span> <span class="iscroll-pull-label"></span>
      </div>
      <div style="height: 15px">&nbsp;</div>
      <ul class="ul-product-list" data-id="listview" data-role="listview" data-filter="true" data-filter-placeholder="产品搜索..." data-inset="true">
        <li data-role="list-divider">数据加载中，请稍候...</li>
      </ul>
      <div class="iscroll-pullup">
        <span class="iscroll-pull-icon"></span> <span class="iscroll-pull-label"></span>
      </div>
    </div>
  </div>
</body>
</html>
