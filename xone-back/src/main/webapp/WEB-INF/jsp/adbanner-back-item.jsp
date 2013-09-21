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
    <jsp:include page="common-nav.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="row-fluid" id="X_bodyContainer">
            <div class="span2">
                <jsp:include page="common-menu.jsp"></jsp:include>
            </div>
            <div class="span10" id="X_contentContainer">
                <div class="row-fluid">
                    <ul class="breadcrumb" id="X_breadcrumbs_ul">
                        <li>后台 <span class="divider">/</span></li>
                        <li>用户管理 <span class="divider">/</span></li>
                        <li><a href="${pageContext.request.contextPath}/adbanner/adbannerList.html">广告列表</a> <span class="divider">/</span></li>
                        <li class="active">广告详细</li>
                    </ul>
                </div>
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
                            <td style="width: 60px;">广告位置</td>
                            <td>${adbanner.adPositionName}</td>
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
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
</html>
