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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="19" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的其它服务 <span class="divider">/</span></li>
                    <li><a href="${pageContext.request.contextPath}/overhead/overheadList.html">我的置顶列表</a> <span class="divider">/</span></li>
                    <li class="active">我的置顶详细</li>
                </ul>
                <table class="table table-bordered" style="width: 100%">
                    <tbody>
                        <tr>
                            <td style="width: 60px;">置顶编号</td>
                            <td>${overhead.id}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">置顶类型</td>
                            <td>${overhead.overheadTypeName}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">相关内容</td>
                            <td>${refName}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">备注</td>
                            <td>${overhead.remark}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">申请人</td>
                            <td>${person.username}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">申请日期</td>
                            <td><fmt:formatDate value="${overhead.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">审核状态</td>
                            <td>${overhead.checkStatusName}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">审核日期</td>
                            <td><fmt:formatDate value="${overhead.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
