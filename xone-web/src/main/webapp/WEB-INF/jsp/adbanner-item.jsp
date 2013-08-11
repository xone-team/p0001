<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <jsp:include page="common-nav.jsp"><jsp:param value="5" name="offset" /></jsp:include>
    <div class="container">
        <div class="row">
            <div class="span3">
                <jsp:include page="user-center-menu.jsp"><jsp:param value="17" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的广告列表 <span class="divider">/</span></li>
                    <li><a href="${pageContext.request.contextPath}/adbanner/adbannerList.html">我的广告列表</a> <span class="divider">/</span></li>
                    <li class="active">广告详细</li>
                </ul>
                <table class="table table-bordered" style="width: 100%">
                    <tbody>
                        <tr>
                            <td style="width: 60px;">编号</td>
                            <td>${adbanner.id}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品编号</td>
                            <td>${adbanner.refId}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">广告类型</td>
                            <td>${adbanner.adTypeName}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">开始时间</td>
                            <td>${adbanner.adStart}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">结束时间</td>
                            <td>${adbanner.adEnd}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="control-group uploadimagesdiv" style="margin-bottom: 0px;">
                    <div class="well well-small" style="margin-bottom: 0px;">广告图片预览</div>
                    <div class="well well-small">
                        <img src="${pageContext.request.contextPath}/image.html?id=${adbanner.adRefId}" />
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
