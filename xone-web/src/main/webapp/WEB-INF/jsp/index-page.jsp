<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>欢迎使用</title>
<jsp:include page="common-header-no-bootstrap.jsp"></jsp:include>
<script src="${STATIC_ROOT}/new-style/js/iepng.js"></script>
</head>
<body>
    <jsp:include page="common-nav.jsp"><jsp:param value="1" name="offset" /></jsp:include>

    <!--banner开始-->
    <div id="slide-index">
        <div class=slides>
            <div class="slide autoMaxWidth">
                <div id=bi_0 class=image>
                    <img src="${STATIC_ROOT}/new-style/upfile/banner.jpg" border="0">
                </div>
                <div id=bt_0 class=text></div>
                <div id=bb_0 class=button></div>
            </div>
            <div class="slide autoMaxWidth">
                <div id=bi_0 class=image>
                    <img src="${STATIC_ROOT}/new-style/upfile/banner2.jpg" border="0">
                </div>
                <div id=bt_0 class=text></div>
                <div id=bb_0 class=button></div>
            </div>
            <div class="slide autoMaxWidth">
                <div id=bi_0 class=image>
                    <img src="${STATIC_ROOT}/new-style/upfile/banner.jpg" border="0">
                </div>
                <div id=bt_0 class=text></div>
                <div id=bb_0 class=button></div>
            </div>
            <div class="slide autoMaxWidth">
                <div id=bi_0 class=image>
                    <img src="${STATIC_ROOT}/new-style/upfile/banner2.jpg" border="0">
                </div>
                <div id=bt_0 class=text></div>
                <div id=bb_0 class=button></div>
            </div>
        </div>
        <div class=control>
            <A href="#"></A>
            <A href="#"></A>
            <A href="#"></A>
            <A href="#"></A>
        </div>
    </div>
    <script type=text/javascript>
                    $(function() {
                        indexSlides.ini();
                    });
                    var indexSlides = {};
                    indexSlides.timer = false;
                    indexSlides.total = $('#slide-index .control a').length;
                    indexSlides.current = -1;
                    indexSlides.offScreenLeft = 2000;
                    indexSlides.leaveScreenLeft = 4000;
                    indexSlides.animating = false;
                    indexSlides.obj = $('#slide-index .slide');
                    indexSlides.style = [];
                    indexSlides.style[0] = {
                        text : {
                            left : '30px',
                            top : '81px'
                        },
                        button : {
                            left : '30px',
                            top : '244px'
                        },
                        direction : 'tb'
                    };

                    indexSlides.style[1] = {
                        text : {
                            left : '30px',
                            top : '81px'
                        },
                        button : {
                            left : '30px',
                            top : '244px'
                        },
                        direction : 'tb'
                    };

                    indexSlides.style[2] = {
                        text : {
                            left : '30px',
                            top : '81px'
                        },
                        button : {
                            left : '30px',
                            top : '244px'
                        },
                        direction : 'tb'
                    };
                    indexSlides.style[3] = {
                        text : {
                            left : '30px',
                            top : '81px'
                        },
                        button : {
                            left : '30px',
                            top : '244px'
                        },
                        direction : 'tb'
                    };
                </script>
    <script type=text/javascript src="${STATIC_ROOT}/new-style/js/slide.js"></script>
    <!--banner结束-->


    <!--主体-->
    <div id="container">

        <!--第一层-->
        <div id="inone">
            <div class="fl">
                <a href="${pageContext.request.contextPath}/product/productNormalCreate.html" target="_blank">
                    <img src="${STATIC_ROOT}/new-style/images/in_one_01.gif" />
                </a>
                <div style="margin-top: 4px;">
                    <a href="${pageContext.request.contextPath}/delivery/deliveryCreate.html" target="_blank">
                        <img src="${STATIC_ROOT}/new-style/images/in_one_02.gif" />
                    </a>
                </div>
                <div style="margin-top: 4px;">
                    <img style="CURSOR: pointer" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=2836966897&o=掌畅科技&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');" src="${STATIC_ROOT}/new-style/images/in_one_03.gif" width="222" height="62" />
                </div>
            </div>
            <div class="fr oneright">
                <div class="fl">
                    <img src="${STATIC_ROOT}/new-style/images/in_tuijian.gif" />
                </div>
                <div class="fl" id="ajaxLoading1">加载中...</div>
                <div class="cb"></div>
            </div>
            <div class="cb"></div>
        </div>
        <!--第一层 end-->

        <!--第二层-->
        <div id="intwo">
            <!--左侧组团产品-->
            <div class="fl" style="width: 222px;">
                <img src="${STATIC_ROOT}/new-style/images/ztcp.gif" width="222" height="46" />
                <div class="twoleft" id="ajaxLoading2">加载中...</div>
            </div>
            <!--左侧组团产品 end-->

            <!--中间大家在卖-->
            <div class="fl" id="sell">
                <h2>&nbsp;&nbsp;大家在卖</h2>
                <div id="ajaxLoading3">加载中...</div>
                <div style="padding-left: 20px; height: 50px;">
                    <a href="${pageContext.request.contextPath}/product/list.html" class="a_sell">查看大家在卖的全部产品</a>
                </div>
            </div>
            <!--中间大家在卖 end-->
            <!--中间大家想买-->
            <div class="fr" id="buy">
                <h2>&nbsp;&nbsp;大家想买</h2>
                <div id="ajaxLoading4">加载中...</div>
                <div style="padding-left: 20px; height: 50px; padding-top: 20px;">
                    <a href="${pageContext.request.contextPath}/purchase/list.html" class="a_sell">查看大家想买的全部产品</a>
                </div>
            </div>
            <!--中间大家想买 end-->
            <div class="cb"></div>
        </div>
        <!--第二层 end-->


    </div>
    <!--主体结束-->

    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(document).ready(function() {
        for ( var i = 1; i < 5; i++) {
            (function(i) {
            	window.setTimeout(function() {
                    $.ajax({
                        type : 'get',
                        url : '${pageContext.request.contextPath}/indexAjax' + i + '.html',
                        success : function(html) {
                            $("#ajaxLoading" + i).html(html);
                        }
                    });
            	}, 0);
            })(i);
        }
	});
</script>
</html>
