<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--head start-->
<div class="head">
    <div class="ht">
        <div class="las"></div>
        <div class="login">
            <form method="post" action="${pageContext.request.contextPath}/j_spring_security_check">
                <div>用户名</div>
                <div>
                    <input type="text" name="username" class="textbox" style="-webkit-border-radius: 0px;" value="" placeholder="用户名">
                </div>
                <div>密码</div>
                <div>
                    <input type="text" name="password" class="textbox" style="-webkit-border-radius: 0px;" value="" placeholder="密码">
                </div>
                <div>
                    <input type="submit" value="登录" />
                </div>
            </form>
        </div>
        <div class="ras">
            <c:choose>
                <c:when test="${not empty userMap}">
                    <span id="ras_membername">欢迎 ${username} 登录！ <a href="${pageContext.request.contextPath}/admin/welcome.html">[后台管理]</a> <a href="<c:url value="/j_spring_security_logout"/>">[退出]</a>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>
            </span><span id="ras_register"><a href="${pageContext.request.contextPath}/user/register.html">[15秒免费注册]</a> </span>
        </div>
    </div>
    <div class="hm">
        <div class="logo">
            <a href="${pageContext.request.contextPath}">
                <div style="width: 182px; height: 85px; line-height: 85px; color: #fdb56d; font-family: 'Microsoft YaHei'; font-size: 3.5em;">掌畅科技</div>
            </a>
        </div>
        <div class="city"></div>
        <div class="search">
            <form method="post" id="navSearchForm" action="${pageContext.request.contextPath}/product/list.html" enctype="application/x-www-form-urlencoded">
                <input type="hidden" name="searchType" value="${searchType}" />
                <div class="cominfosel">
                    <a href="javascript:void(0)" onclick="navSearch(1, this);" id="categ_1" class="current">大家在卖</a>
                    <a href="javascript:void(0)" onclick="navSearch(2, this);" id="categ_2">大家想买</a>
                </div>
                <div class="seabox">
                    <input type="text" name="searchKey" value="${searchKey}" class="textbox" autocomplete="off" style="margin-bottom:0px;-webkit-border-radius: 0px;" />
                    <input type="submit" value="搜索" class="button">
                </div>
                <div class="infocount">
                    <a href="${pageContext.request.contextPath}/product/list.html">查看所有</a>
                </div>
            </form>
        </div>
        <div class="rld">
            <a href="${pageContext.request.contextPath}/admin/login.html">免费发布信息</a>
            <a href="${STATIC_ROOT}/xone.apk" class="wap">
                <img src="${STATIC_ROOT}/lx/head_12.png">
            </a>
        </div>
    </div>
    <div class="navk">
        <div class="navl">
            <a href="${pageContext.request.contextPath}/index.html">首页</a>
            <a href="${pageContext.request.contextPath}/product/list.html">大家在卖</a>
            <a href="${pageContext.request.contextPath}/purchase/list.html">大家想买</a>
        </div>
        <div class="navr" id="rnav">
            <a href="${pageContext.request.contextPath}/about.html">关于</a>
        </div>
    </div>
</div>
<!--head end-->

<div class="container">

    <div class="navbar-locale row-fluid no-bottom" style="display: none;">
        <div class="pull-right">
            <br>
        </div>
    </div>
    <script>
                    function navSearch(type, eventSrc) {
                        $form = $(eventSrc).closest("form");
                        $("input[name='searchType']", $form).val(type);
                        if ("2" == type) {
                            $("#categ_1").removeClass("current");
                            $("#categ_2").addClass("current");
                            $form.attr("action", "${pageContext.request.contextPath}/purchase/list.html");
                        } else {
                            $("#categ_2").removeClass("current");
                            $("#categ_1").addClass("current");
                            $form.attr("action", "${pageContext.request.contextPath}/product/list.html");
                        }
                    }
                </script>

    <div class="navbar-floatingpage" style="display: none;">
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner blue-gradiant gradient">
                <div class="container">
                    <ul class="nav">
                        <li><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/product/list.html">大家在卖</a></li>
                        <li><a href="${pageContext.request.contextPath}/purchase/list.html">大家想买</a></li>
                        <li><a href="${pageContext.request.contextPath}/about.html">关于</a></li>
                    </ul>
                    <form method="post" id="navSearchForm" action="${pageContext.request.contextPath}/product/list.html" enctype="application/x-www-form-urlencoded">
                        <div class="input-append pull-right">
                            <input type="hidden" name="searchType" value="${searchType}" />
                            <input type="text" name="searchKey" value="${searchKey}" class="span4" role="textbox" aria-disabled="false" aria-readonly="false" aria-multiline="false" placeholder="请输入搜索关键字">
                            <a href="javascript:void(0);" onclick="navSearch(1, this);" rel="tooltip" title="" class="btn btn-custom-blue" data-original-title="搜索售卖信息">
                                <i class="icon-search"></i>大家在卖
                            </a>
                            <a href="javascript:void(0);" onclick="navSearch(2, this);" class="btn btn-custom-blue" rel="tooltip" title="" data-original-title="搜索求购信息">
                                <i class="icon-search"></i>大家想买
                            </a>
                        </div>
                        <input type="submit" name="search" value="" style="display: none;">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
