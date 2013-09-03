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
                        <li><a href="${pageContext.request.contextPath}/purchase/purchaseList.html">求购列表</a> <span class="divider">/</span></li>
                        <li class="active">求购详细</li>
                    </ul>
                </div>
                <table class="table table-bordered" style="width: 100%">
                    <tbody>
                        <tr>
                            <td style="width: 60px;">编号</td>
                            <td>${purchase.id}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品名称</td>
                            <td>${purchase.purchaseName}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">求购类型</td>
                            <td>${purchase.purchaseTypeName }</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">求购数量</td>
                            <td>${purchase.purchaseNum}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品产地</td>
                            <td>${purchase.purchaseAddress}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">产品属地</td>
                            <td>${purchase.purchaseLocation}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">求购描述</td>
                            <td>${purchase.purchaseDesc}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">求购图片</td>
                            <td><c:forEach items="${purchase.ids}" var="it" varStatus="status">
                                    <div class="span4">
                                        <div class="control-group row-fluid uploadimagesdiv${status.index + 1}" style="margin-bottom: 0px;">
                                            <div class="well well-small" style="margin-bottom: 0px;">图片预览</div>
                                            <div class="well well-small">
                                                <img class="uploadpurchasedynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">手机号码:</td>
                            <td>${purchase.person.cellphone}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">联&nbsp;&nbsp;系&nbsp;&nbsp;人:</td>
                            <td>${purchase.person.contactor}</td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">申请时间</td>
                            <td><fmt:formatDate value="${purchase.dateApply}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td style="width: 60px;">审核结果</td>
                            <td>${purchase.checkStatusName }</td>
                        </tr>
                        <tr>
                            <td colspan="2">审核历史</td>
                        </tr>
                        <c:forEach items="${ purchase.purchaseCheckList }" var="item" varStatus="status">
                            <tr>
                                <td colspan="2"><div class="well">
                                        <div class="control-group">
                                            <span>审核结果</span>
                                            <div class="inline">${item.checkStatusName }</div>
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
        jQuery("#X_menu_li_purchase").addClass("active");
    });
</script>
</html>
