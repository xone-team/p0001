<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="topbar box-shadow blue-gradiant gradient">
    <div class="container">
        <div class="row-fluid">
            <div class="span4">
                <div class="logo box-shadow">
                    <div id="inner-logo">
                        <center>
                            <a href="#">
                                <h1 style='font-family: "Microsoft YaHei";'>恒&nbsp;&nbsp;鑫&nbsp;&nbsp;科&nbsp;&nbsp;技</h1>
                            </a>
                        </center>
                    </div>
                    <div class="logo-right"></div>
                </div>
            </div>
            <div class="span3">
                <h3 style="margin-top: 50px !important; color: #ffffff;">水产品交易平台</h3>
            </div>
            <div class="span5">
                <div class="login-area">
                    <c:choose>
                        <c:when test="${not empty userMap}">
                            <p class="logined-message">
                                欢迎您 ${username} !
                                <a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a>
                                <a href="<c:url value="/j_spring_security_logout"/>">退出登录</a>
                            </p>
                        </c:when>
                        <c:otherwise>
                            <form class="form-inline inline" method="post" action="${pageContext.request.contextPath}/j_spring_security_check">
                                <input type="text" name="username" class="input-small" value="15800000000" placeholder="用户名">
                                <input type="password" name="password" class="input-small" value="hunny@admin" placeholder="密码">
                                <button type="submit" class="btn btn-warning inline">登录</button>
                                <a href="${pageContext.request.contextPath}/user/register.html" class="btn btn-warning inline">注册</a>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="row-fluid">
                    <div class="span6 text-right">
                        <span class="label label-success">手机客户端下载</span>
                    </div>
                    <div class="span6 down-area">
                        <div class="down-to-drop">
                            <a href="javascript:void(0)" class="banner-down-android" id="downBtnAndroid" title="Android下载"></a>
                            <a href="javascript:void(0)" class="banner-down-ios" id="downBtnIphone" title="iOS下载"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="container">

    <div class="navbar-locale row-fluid no-bottom">
        <div class="pull-right">
            <br>
        </div>
    </div>
    <div class="navbar-contentpage">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <ul class="nav">
                        <li<c:if test="${ param.offset == 1 }"> class="active"</c:if>><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
                        <li class="divider-vertical"></li>
                        <li<c:if test="${ param.offset == 2 }"> class="active"</c:if>><a href="${pageContext.request.contextPath}/product/list.html">售卖</a></li>
                        <li class="divider-vertical"></li>
                        <li<c:if test="${ param.offset == 3 }"> class="active"</c:if>><a href="${pageContext.request.contextPath}/purchase/list.html">购买</a></li>
                        <li class="divider-vertical"></li>
                        <li<c:if test="${ param.offset == 4 }"> class="active"</c:if>><a href="${pageContext.request.contextPath}/about.html">关于</a></li>
                    </ul>
                    <div class="pull-right">
                        <form method="post" id="navSearchForm" action="${pageContext.request.contextPath}/product/list.html" enctype="application/x-www-form-urlencoded">
                            <div class="input-append">
                                <input type="hidden" name="searchType" value="${searchType}" />
                                <input type="text" name="searchKey" value="${searchKey}" class="span4" role="textbox" aria-disabled="false" aria-readonly="false" aria-multiline="false" placeholder="请输入搜索关键字">
                                <a href="javascript:void(0);" onclick="navSearch(1, this);" rel="tooltip" title="" class="btn btn-custom-blue" data-original-title="搜索售卖信息">
                                    <i class="icon-search"></i>售卖
                                </a>
                                <a href="javascript:void(0);" onclick="navSearch(2, this);" class="btn btn-custom-blue" rel="tooltip" title="" data-original-title="搜索求购信息">
                                    <i class="icon-search"></i>求购
                                </a>
                            </div>
                            <input type="submit" name="search" value="" style="display: none;">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
                    function navSearch(type, eventSrc) {
                        $form = $(eventSrc).closest("form");
                        $("input[name='searchType']", $form).val(type);
                        if ("2" == type) {
                            $form.attr("action", "${pageContext.request.contextPath}/purchase/list.html");
                        }
                        $form.submit();
                    }
                </script>

    <div class="navbar-floatingpage" style="display: none;">
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner blue-gradiant gradient">
                <div class="container">
                    <ul class="nav">
                        <li><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/product/list.html">售卖</a></li>
                        <li><a href="${pageContext.request.contextPath}/purchase/list.html">购买</a></li>
                        <li><a href="${pageContext.request.contextPath}/about.html">关于</a></li>
                    </ul>
                    <form method="post" id="navSearchForm" action="${pageContext.request.contextPath}/product/list.html" enctype="application/x-www-form-urlencoded">
                        <div class="input-append pull-right">
                            <input type="hidden" name="searchType" value="${searchType}" />
                            <input type="text" name="searchKey" value="${searchKey}" class="span4" role="textbox" aria-disabled="false" aria-readonly="false" aria-multiline="false" placeholder="请输入搜索关键字">
                            <a href="javascript:void(0);" onclick="navSearch(1, this);" rel="tooltip" title="" class="btn btn-custom-blue" data-original-title="搜索售卖信息">
                                <i class="icon-search"></i>售卖
                            </a>
                            <a href="javascript:void(0);" onclick="navSearch(2, this);" class="btn btn-custom-blue" rel="tooltip" title="" data-original-title="搜索求购信息">
                                <i class="icon-search"></i>求购
                            </a>
                        </div>
                        <input type="submit" name="search" value="" style="display: none;">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
