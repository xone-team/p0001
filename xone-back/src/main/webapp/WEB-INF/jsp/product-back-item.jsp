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
                        <li>产品管理 <span class="divider">/</span></li>
                        <li><a href="${pageContext.request.contextPath}/product/productList.html">产品列表</a> <span class="divider">/</span></li>
                        <li class="active">产品详细</li>
                    </ul>
                </div>
                <table class="table table-bordered" style="width: 100%">
                    <tbody>
                        <tr>
                            <td style="width: 60px;">编号</td>
                            <td>${product.id}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品名称</td>
                            <td>${product.productName}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品类型</td>
                            <td><c:forEach items="${commonTypes.productTypeList}" var="it">
                                    <c:if test="${it.value == product.productType}">${it.name}</c:if>
                                </c:forEach></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">销售类型</td>
                            <td><c:forEach items="${commonTypes.saleTypeList}" var="it">
                                    <c:if test="${it.value == product.saleType}">${it.name}</c:if>
                                </c:forEach></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品价格</td>
                            <td>${product.productPrice}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品数量</td>
                            <td>${product.productNum}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">有效期</td>
                            <td><fmt:formatDate value="${product.productValid}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品产地</td>
                            <td>${product.productAddress}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品属地</td>
                            <td>${product.productLocation}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品描述</td>
                            <td>${product.productDesc}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">申请人</td>
                            <td>${product.userApply}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">申请时间</td>
                            <td><fmt:formatDate value="${product.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">审核时间</td>
                            <td><fmt:formatDate value="${product.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品图片</td>
                            <td><c:forEach items="${product.ids}" var="it" varStatus="status">
                                    <div class="span4">
                                        <div class="control-group uploadimagesdiv${status.index + 1}" style="margin-bottom: 0px;">
                                            <div class="well well-small" style="margin-bottom: 0px;">图片预览</div>
                                            <div class="well well-small">
                                                <img class="uploadproductdynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">审核结果</td>
                            <td><c:forEach items="${commonTypes.other1CheckStatusList}" var="it">
                                    <c:if test="${it.value == product.checkStatus}">${ it.name }</c:if>
                                </c:forEach></td>
                        </tr>
                        <tr>
                            <td colspan="2">审核历史</td>
                        </tr>
                        <c:forEach items="${ product.checkList }" var="item" varStatus="status">
                            <tr>
                                <td colspan="2"><div class="well">
                                        <div class="control-group">
                                            <span>审核结果</span>
                                            <div class="inline">
                                                <c:forEach items="${commonTypes.other1CheckStatusList}" var="it">
                                                    <c:if test="${it.value == item.checkStatus}">${ it.name }</c:if>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <span>审核意见</span>
                                            <div class="inline">${ item.remark }</div>
                                        </div>
                                    </div></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_product").addClass("active");
    });
</script>
</html>
