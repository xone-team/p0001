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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="24" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的其它服务 <span class="divider">/</span></li>
                    <li><a href="${pageContext.request.contextPath}/companyInfo/companyInfoList.html">我的公司列表</a> <span class="divider">/</span></li>
                    <li class="active">我的公司详细</li>
                </ul>
                <table class="table table-bordered" style="width: 100%">
                    <tbody>
                        <tr>
                            <td style="width: 60px;">编号</td>
                            <td>${companyInfo.id}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">公司名称</td>
                            <td>${companyInfo.name}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">公司地址</td>
                            <td>${companyInfo.address}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">公司电话</td>
                            <td>${companyInfo.tel}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">移动电话</td>
                            <td>${companyInfo.mobile}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">联系人</td>
                            <td>${companyInfo.contact}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">公司传真</td>
                            <td>${companyInfo.fax}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">公司简介</td>
                            <td>${companyInfo.intro}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">创建日期</td>
                            <td><fmt:formatDate value="${companyInfo.dateCreated}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">公司图片</td>
                            <td><c:forEach items="${companyInfo.ids}" var="it" varStatus="status">
                                    <div class="span4">
                                        <div class="control-group uploadimagesdiv${status.index + 1}" style="margin-bottom: 0px;">
                                            <div class="well well-small" style="margin-bottom: 0px;">图片预览</div>
                                            <div class="well well-small">
                                                <img class="uploadcompanyInfodynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach></td>
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
