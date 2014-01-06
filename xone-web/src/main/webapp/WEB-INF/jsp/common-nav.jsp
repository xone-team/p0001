<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${STATIC_ROOT}/new-style/js/common.js"></script>
<!--在线客服-->
<DIV id=xixi onmouseover=toBig() onmouseout=toSmall() style="z-index: 999;">
    <TABLE style="FLOAT: left" border=0 cellSpacing=0 cellPadding=0 width=157>
        <TBODY>
            <TR>
                <TD class=main_head height=39 vAlign=top>&nbsp;</TD>
            </TR>
            <TR>
                <TD class=info vAlign=top>
                    <TABLE class=qqtable border=0 cellSpacing=0 cellPadding=0 width=120 align=center>
                        <TBODY>
                            <TR>
                                <TD align=middle><a href="http://www.alixixi.com/" target="_blank">
                                        <IMG border=0 src="${STATIC_ROOT}/new-style/zxkf/images/kefu_head.gif">
                                    </a></TD>
                            </TR>
                            <TR>
                                <TD height=5></TD>
                            </TR>
                            <TR>
                                <TD height=30 align=middle><img style="CURSOR: pointer" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=2836966897&o=掌畅科技&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');" border="0" SRC=http://wpa.qq.com/pa?p=1:2836966897:7 alt="点击这里给我发消息"></TD>
                            </TR>
                            <TR>
                                <TD height=30 align=middle></TD>
                            </TR>
                            <TR>
                                <TD height=5></TD>
                            </TR>

                            <TR>
                                <TD align=middle height="70"></TD>
                            </TR>
                            <TR>
                                <TD align=middle height="30"></TD>
                            </TR>
                            <TR>
                                <TD align=middle>&nbsp;</TD>
                            </TR>
                        </TBODY>
                    </TABLE>
                </TD>
            </TR>
            <TR>
                <TD class=down_kefu vAlign=top></TD>
            </TR>
        </TBODY>
    </TABLE>
    <DIV class=Obtn></DIV>
</DIV>
<SCRIPT language=javascript>
    客服 = function(id, _top, _left) {
        var me = id.charAt ? document.getElementById(id) : id, d1 = document.body, d2 = document.documentElement;
        d1.style.height = d2.style.height = '100%';
        me.style.top = _top ? _top + 'px' : 0;
        me.style.left = _left + "px";//[(_left>0?'left':'left')]=_left?Math.abs(_left)+'px':0;
        me.style.position = 'absolute';
        //me.style.z-index='999';
        setInterval(function() {
            me.style.top = parseInt(me.style.top) + (Math.max(d1.scrollTop, d2.scrollTop) + _top - parseInt(me.style.top)) * 0.1 + 'px';
        }, 10 + parseInt(Math.random() * 20));
        return arguments.callee;
    };

</SCRIPT>

<SCRIPT language=javascript>
    lastScrollY = 0;

    var InterTime = 1;
    var maxWidth = -1;
    var minWidth = -152;
    var numInter = 8;

    var BigInter;
    var SmallInter;

    var o = document.getElementById("xixi");
    var i = parseInt(o.style.left);
    function Big() {
        if (parseInt(o.style.left) < maxWidth) {
            i = parseInt(o.style.left);
            i += numInter;
            o.style.left = i + "px";
            if (i == maxWidth)
                clearInterval(BigInter);
        }
    }
    function toBig() {
        clearInterval(SmallInter);
        clearInterval(BigInter);
        BigInter = setInterval(Big, InterTime);
    }
    function Small() {
        if (parseInt(o.style.left) > minWidth) {
            i = parseInt(o.style.left);
            i -= numInter;
            o.style.left = i + "px";

            if (i == minWidth)
                clearInterval(SmallInter);
        }
    }
    function toSmall() {
        clearInterval(SmallInter);
        clearInterval(BigInter);
        SmallInter = setInterval(Small, InterTime);

    }
</SCRIPT>
<!--在线客服-->

<!--顶部-->
<div id="head">
    <div class="head_m">
        <div class="fl">
            您好，欢迎光临掌畅水产品批发网&nbsp;&nbsp;
            <c:choose>
                <c:when test="${not empty userMap}">
                    <span>欢迎 ${username} 登录！ <a href="${pageContext.request.contextPath}/admin/welcome.html">[后台管理]</a> <a href="<c:url value="/j_spring_security_logout"/>">[退出]</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/admin/login.html" class="blue">请登录</a>
                    &nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/user/register.html" class="blue">免费注册</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="fr blue">热线电话：400-897-9727</div>
        <div class="cb"></div>
    </div>
</div>
<!--顶部结束-->
<!--顶部-->
<div id="head_logo">
    <div class="head_logo_m">
        <div class="fl">
            <img src="${STATIC_ROOT}/new-style/images/logo.png" width="220" height="100" />
        </div>
        <div class="fl" id="search">
            <!--搜索框-->
            <div class="search_box">
                <span class="left l_bg"></span> <span class="right r_bg"></span>
                <div class="search">
                    <form name=search_form onSubmit="return bottomForm(this);" action="${pageContext.request.contextPath}/product/list.html" target="_blank" method=post>
                        <div id="pt1" class="select">
                            <a id="s0">大家在卖</a>
                            <div style="display: none;" id="pt2" class="part">
                                <p>
                                    <a id="s1">大家在卖</a>
                                    <a id="s2">大家想买</a>
                                </p>
                            </div>
                        </div>
                        <input id="catid" name="searchType" type="hidden" value="${ searchType }">
                        <input id="q" class="enter" name="searchKey" onFocus="if(this.value=='请输入关键字'){this.value='';}else{this.select();}this.style.color='black';" value="${ empty searchKey ? '请输入关键字' : searchKey }">
                        <input class="sb" name="Input" type="submit" value="" style="width: 72px;">
                    </form>
                </div>
            </div>
            <!--搜索框 end-->
        </div>
        
        <div class="fl iphone">
            <div class="c_iphone">
                <img src="${STATIC_ROOT}/new-style/images/iphone_b.gif" />
            </div>
            <img src="${STATIC_ROOT}/new-style/images/iphone.gif" border="0" /><br />
            <a href="#">iphone</a>
        </div>
        <div class="fr android">
            <div class="c_android">
                <img src="${STATIC_ROOT}/new-style/images/android_b.gif" />
            </div>
            <img src="${STATIC_ROOT}/new-style/images/android.gif" border="0" /><br />
            <a href="#">Android</a>
        </div>
        <div class="cb"></div>
    </div>
</div>
<!--顶部结束-->
<!--menu-->
<div id="menu">
    <div class="main_center">
        <ul>
            <li><a href="${pageContext.request.contextPath}/index.html"<c:if test="${param.offset == '1'}"> class="a-dq"</c:if>>首页</a></li>
            <li><a href="${pageContext.request.contextPath}/product/list.html"<c:if test="${param.offset == '2'}"> class="a-dq"</c:if>>大家在卖</a></li>
            <li><a href="${pageContext.request.contextPath}/purchase/list.html"<c:if test="${param.offset == '3'}"> class="a-dq"</c:if>>大家想买</a></li>
            <li><a href="${pageContext.request.contextPath}/product/list.html?product.saleType=1"<c:if test="${param.offset == '4'}"> class="a-dq"</c:if>>促销产品</a></li>
            <li><a href="${pageContext.request.contextPath}/product/list.html?product.saleType=2"<c:if test="${param.offset == '6'}"> class="a-dq"</c:if>>组团产品</a></li>
            <li><a href="${pageContext.request.contextPath}/product/productNormalCreate.html"<c:if test="${param.offset == '5'}"> class="a-dq"</c:if>>发布产品</a></li>
        </ul>
    </div>
</div>
<!--menu end-->