<?xml version="1.0" encoding="UTF-8"?><%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="java.security.Principal"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<root>
	<info>
		<title>用户订阅的信息</title>
	</info>
	<date>
		<time>${mapValue['lastSubscribeUpdated']}</time>
	</date>
	<items>
		<c:forEach var="item" items="${list}">
			<item market="${item.marketarea}" key="${item.productNameKey}" saleType="${item.saleTypeName}" credit="${item.creditName}">${item.productNameKey}</item>
		</c:forEach>
	</items>
</root>
