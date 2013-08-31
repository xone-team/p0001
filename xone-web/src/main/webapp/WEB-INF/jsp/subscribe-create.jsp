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
                <jsp:include page="user-center-menu.jsp"><jsp:param value="15" name="menuindex" /></jsp:include>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li>用户中心 <span class="divider">/</span></li>
                    <li>我的其它服务 <span class="divider">/</span></li>
                    <li class="active">创建订阅</li>
                </ul>
                <form class="form-horizontal" id="saveForm" method="post" action="${pageContext.request.contextPath}/subscribe/subscribeSave.html">
                    <div class="control-group">
                        <label class="control-label" for="marketarea">市场区域</label>
                        <div class="controls">
                            <input type="text" id="marketarea" name="subscribe.marketarea" maxlength="20" placeholder="市场区域">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productNameKey">产品名称</label>
                        <div class="controls">
                            <input type="text" id="productNameKey" name="subscribe.productNameKey" maxlength="20" placeholder="产品名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="saleType">销售类型</label>
                        <div class="controls">
                            <select class="selectpicker" id="saleType" name="subscribe.saleType">
                                <option value="">无</option>
                                <c:forEach items="${saleType}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == subscribe.saleType}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="credit">公司信誉</label>
                        <div class="controls">
                            <select class="selectpicker" id="credit" name="subscribe.credit">
                                <option value="">无</option>
                                <c:forEach items="${credit}" var="it">
                                    <option value="${it.value}" <c:if test="${it.value == subscribe.credit}">selected</c:if>>${it.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="refId">相关编号</label>
                        <div class="controls">
                            <input type="text" id="refId" name="subscribe.refId" maxlength="20" placeholder="相关编号">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn">提交创建</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="common-footer.jsp"></jsp:include>
    </div>
    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
