<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
.clearmarginbottom {
    margin-bottom: 2px;
}
</style>
<div class="accordion">
    <sec:authorize access="hasAnyRole('ADMINISTRATOR', 'MEMBER')">
        <div class="accordion-group">
            <div class="accordion-heading">
                <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#${identify}_1">用户中心</div>
            </div>
            <div id="${identify}_1" class="accordion-body collapse">
                <div class="accordion-inner">
                    <ul class="nav nav-list">
                        <li id="menu_user" <c:if test="${param.menuindex == '1'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/user/userItem.html" class="well well-small clearmarginbottom">我的资料</a></li>
                        <sec:authorize access="hasAnyRole('ADMINISTRATOR', 'MEMBER-CREDIT')">
                            <li id="menu_user_update" <c:if test="${param.menuindex == '2'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/user/userEdit.html" class="well well-small clearmarginbottom">更新资料</a></li>
                        </sec:authorize>
                        <%-- <li id="menu_user_list" <c:if test="${param.menuindex == '3'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/user/userList.html" class="well well-small clearmarginbottom">用户列表</a></li>
					<li id="menu_resources_list" <c:if test="${param.menuindex == '4'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/resources/resourcesList.html" class="well well-small clearmarginbottom">资源列表</a></li>
					<li id="menu_roles_list" <c:if test="${param.menuindex == '5'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/admin/rolesList.html" class="well well-small clearmarginbottom">角色列表</a></li> --%>
                    </ul>
                </div>
            </div>
        </div>
    </sec:authorize>
    <c:set var="A_L" value="${not empty userMap && userMap.userLevel == 'A'}" />
    <c:set var="B_L" value="${not empty userMap && userMap.userLevel == 'B'}" />
    <c:set var="C_L" value="${not empty userMap && userMap.userLevel == 'C'}" />
    <div class="accordion-heading">
        <div class="accordion-toggle nav-header">我的伙计</div>
    </div>
    <c:if test="${A_L || B_L}">
        <div class="accordion-group">
            <div class="accordion-heading">
                <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#${identify}_2">售卖发布</div>
            </div>
            <div id="${identify}_2" class="accordion-body collapse">
                <div class="accordion-inner">
                    <ul class="nav nav-list">
                        <li <c:if test="${param.menuindex == '6'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/product/productNormalCreate.html" class="well well-small clearmarginbottom">产品发布</a></li>
                        <li <c:if test="${param.menuindex == '7'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/product/productSalesCreate.html" class="well well-small clearmarginbottom">促销发布</a></li>
                        <c:if test="${A_L}">
                            <li <c:if test="${param.menuindex == '8'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/product/productGroupsCreate.html" class="well well-small clearmarginbottom">组团发布</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${C_L || B_L}">
        <div class="accordion-group">
            <div class="accordion-heading">
                <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#${identify}_3">购买发布</div>
            </div>
            <div id="${identify}_3" class="accordion-body collapse">
                <div class="accordion-inner">
                    <ul class="nav nav-list">
                        <li <c:if test="${param.menuindex == '12'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/purchase/purchaseCreate.html" class="well well-small clearmarginbottom">求购发布</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
    <div class="accordion-group">
        <div class="accordion-heading">
            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#${identify}_4">配套服务</div>
        </div>
        <div id="${identify}_4" class="accordion-body collapse">
            <div class="accordion-inner">
                <ul class="nav nav-list">
                    <c:if test="${A_L || B_L}">
                        <li <c:if test="${param.menuindex == '14'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/delivery/deliveryCreate.html" class="well well-small clearmarginbottom">物流配送</a></li>
                    </c:if>
                    <li <c:if test="${param.menuindex == '15'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/subscribe/subscribeCreate.html" class="well well-small clearmarginbottom">筛选订阅</a></li>
                    <li <c:if test="${param.menuindex == '20'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/overhead/overheadCreate.html" class="well well-small clearmarginbottom">申请置顶</a></li>
                    <%--                     <li <c:if test="${param.menuindex == '23'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/companyInfo/companyInfoCreate.html" class="well well-small clearmarginbottom">填写公司信息</a></li> --%>
                </ul>
            </div>
        </div>
    </div>
    <div class="accordion-heading">
        <div class="accordion-toggle nav-header">我的信息</div>
    </div>
    <c:if test="${A_L || B_L}">
        <div class="accordion-group">
            <div class="accordion-heading">
                <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#${identify}_21">我的售卖发布</div>
            </div>
            <div id="${identify}_21" class="accordion-body collapse">
                <div class="accordion-inner">
                    <ul class="nav nav-list">
                        <li <c:if test="${param.menuindex == '9'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/product/productNormalList.html" class="well well-small clearmarginbottom">查看产品发布列表</a></li>
                        <li <c:if test="${param.menuindex == '10'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/product/productSalesList.html" class="well well-small clearmarginbottom">查看促销发布列表</a></li>
                        <c:if test="${A_L}">
                            <li <c:if test="${param.menuindex == '22'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/productGroup/productGroupList.html" class="well well-small clearmarginbottom">查看组团发布列表</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${C_L || B_L}">
        <div class="accordion-group">
            <div class="accordion-heading">
                <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#${identify}_31">我的购买发布</div>
            </div>
            <div id="${identify}_31" class="accordion-body collapse">
                <div class="accordion-inner">
                    <ul class="nav nav-list">
                        <li <c:if test="${param.menuindex == '13'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/purchase/purchaseList.html" class="well well-small clearmarginbottom">查看求购发布列表</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
    <div class="accordion-group">
        <div class="accordion-heading">
            <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#${identify}_41">我的配套服务</div>
        </div>
        <div id="${identify}_41" class="accordion-body collapse">
            <div class="accordion-inner">
                <ul class="nav nav-list">
                    <c:if test="${A_L || B_L}">
                        <li <c:if test="${param.menuindex == '24'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/delivery/deliveryCreate.html" class="well well-small clearmarginbottom">查看物流配送列表</a></li>
                        <li <c:if test="${param.menuindex == '17'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/adbanner/adbannerList.html" class="well well-small clearmarginbottom">查看我的广告列表</a></li>
                        <li <c:if test="${param.menuindex == '19'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/overhead/overheadList.html" class="well well-small clearmarginbottom">查看顶置申请列表</a></li>
                    </c:if>
                    <li <c:if test="${param.menuindex == '18'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/subscribe/subscribeList.html" class="well well-small clearmarginbottom">查看我的订阅列表</a></li>
                    <c:if test="${C_L || B_L}">
                        <li <c:if test="${param.menuindex == '11'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/product/productGroupsList.html" class="well well-small clearmarginbottom">查看组团预定列表</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
<!--
//jQuery(function(){
    var x = $(".accordion-group .active")
//    var y = x.closest(".accordion-group");
    var z = x.closest(".accordion-body");
    z.addClass("in");
//    y.collapse();
//});
//-->
</script>
