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
                        <li><a href="${pageContext.request.contextPath}/person/personList.html">用户列表</a> <span class="divider">/</span></li>
                        <li class="active">用户详细</li>
                    </ul>
                </div>
                <table class="table table-bordered" style="width: 100%">
                    <tbody>
                        <tr>
                            <td style="width: 60px;">用户编号</td>
                            <td>${person.id}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">用户名</td>
                            <td>${person.username}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">申请时间</td>
                            <td><fmt:formatDate value="${person.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">审核时间</td>
                            <td><fmt:formatDate value="${person.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">昵称</td>
                            <td>${person.nickName}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">手机号码</td>
                            <td>${person.cellphone}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">联系人</td>
                            <td>${person.contactor}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">腾讯号码</td>
                            <td>${person.qq}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">电子邮箱</td>
                            <td>${person.email}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">联系地址</td>
                            <td>${person.address}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">认证标识</td>
                            <td>${person.creditName }</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">用户级别</td>
                            <td>${ person.userLevelName }</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">角色</td>
                            <td><c:forEach items="${rolesList}" var="role">
                                    <span class="label label-default">${role.name}</span>
                                </c:forEach></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_person").addClass("active");
    });
</script>
</html>
