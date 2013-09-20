<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="toper">
    <div class="toperinner">
        <c:choose>
            <c:when test="${not empty userMap}">
                <div class="">
                    欢迎您 ${username} !
                    <a href="${pageContext.request.contextPath}/admin/welcome.html">用户中心</a>
                    <a href="<c:url value="/j_spring_security_logout"/>">退出登录</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="">
                    <form class="form-inline inline" method="post" action="${pageContext.request.contextPath}/j_spring_security_check">
                        <input type="text" name="username" class="input-small" style="height: 14px;" value="" placeholder="用户名">
                        <input type="password" name="password" class="input-small" style="height: 14px;" value="" placeholder="密码">
                        <button type="submit" class="btn btn-mini btn-warning inline">登录</button>
                        <a href="${pageContext.request.contextPath}/user/register.html" class="btn btn-mini btn-warning inline">注册</a>
                    </form>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</div>
<div class="mainwap">
    <div class="header_v3">
        <div class="fl left">
            <div class="fl logoDiv">
                <div style="padding: 2em 2em;">
                    <a href="#" style="font-family: 'Microsoft YaHei'; font-size: 2.4em;"> 掌畅科技 </a>
                </div>
            </div>
            <label class="line"></label>
            <div class="fl">
                <div class="input">
                    <div class="inner_input">
                        <form method="post" id="navSearchForm" action="${pageContext.request.contextPath}/product/list.html" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="searchType" value="${searchType}" />
                            <input type="text" name="searchKey" value="${searchKey}" class="keyword colorgrey" style="width: 300px;" value="" autocomplete="off" maxlength="25" jqac="on" jqriempty="true" style="z-index: 10000000;" />
                            <a href="javascript:void(0);" class="submit" onclick="navSearch(1, this);" value="售卖">&nbsp;&nbsp;&nbsp;&nbsp;售卖</a>
                            <a href="javascript:void(0);" class="submit" onclick="navSearch(2, this);" style="margin-left: 2px;">&nbsp;&nbsp;&nbsp;&nbsp;购卖</a>
                            <input type="submit" name="search" value="" style="display: none;">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <label class="line"></label>
        <div class="other_channel">
            <a href="#">手机版</a>
            <div class="down-to-drop">
                <a href="javascript:void(0)" class="banner-down-android" id="downBtnAndroid" title="Android下载"></a>
                <a href="javascript:void(0)" class="banner-down-ios" id="downBtnIphone" title="iOS下载"></a>
            </div>
        </div>
    </div>
    <div class="topMenu" id="_header_channel">
        <a href="${pageContext.request.contextPath}/index.html" <c:if test="${ param.offset == 1 }"> class="cur"</c:if>>
            <span class="home">首页</span>
        </a>
        <label class="line01"></label>
        <a href="${pageContext.request.contextPath}/product/list.html" <c:if test="${ param.offset == 2 }"> class="cur"</c:if>>
            <span class="gujia">售卖</span><img src="${STATIC_ROOT}/fj/hot.gif">
        </a>
        <label class="line01"></label>
        <a href="${pageContext.request.contextPath}/purchase/list.html" class="daikuan <c:if test="${ param.offset == 3}">cur</c:if>">
            <span class="daikuan">购卖</span><img src="${STATIC_ROOT}/fj/new.gif">
        </a>
        <label class="line01"></label>
        <a href="${pageContext.request.contextPath}/about.html" class="baogao <c:if test="${ param.offset == 4 }">cur</c:if>">
            <span class="gjAna">关于</span>
        </a>
    </div>

</div>
<div class="topbar box-shadow blue-gradiant gradient" style="display: none;">
    <div class="container">
        <div class="row-fluid">
            <div class="span4">
                <div class="logo box-shadow">
                    <div id="inner-logo">
                        <center>
                            <a href="#">
                                <h1 style="font-family: 'Microsoft YaHei'; font-size: 3.4em;">掌&nbsp;&nbsp;畅&nbsp;&nbsp;科&nbsp;&nbsp;技</h1>
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
                                <input type="text" name="username" class="input-small" value="" placeholder="用户名">
                                <input type="password" name="password" class="input-small" value="" placeholder="密码">
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
                            <a href="${STATIC_ROOT}/xone.apk" target="_blank" class="banner-down-android" id="downBtnAndroid" title="Android下载"></a>
                            <a href="${STATIC_ROOT}/xOne.ipa" target="_blank" class="banner-down-ios" id="downBtnIphone" title="iOS下载"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="container">

    <div class="navbar-locale row-fluid no-bottom" style="display: none;">
        <div class="pull-right">
            <br>
        </div>
    </div>
    <div class="navbar-contentpage" style="display: none;">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <ul class="nav">
                        <li <c:if test="${ param.offset == 1 }"> class="active"</c:if>><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
                        <li class="divider-vertical"></li>
                        <li <c:if test="${ param.offset == 2 }"> class="active"</c:if>><a href="${pageContext.request.contextPath}/product/list.html">售卖</a></li>
                        <li class="divider-vertical"></li>
                        <li <c:if test="${ param.offset == 3 }"> class="active"</c:if>><a href="${pageContext.request.contextPath}/purchase/list.html">购买</a></li>
                        <li class="divider-vertical"></li>
                        <li <c:if test="${ param.offset == 4 }"> class="active"</c:if>><a href="${pageContext.request.contextPath}/about.html">关于</a></li>
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
