<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>欢迎使用</title>
<jsp:include page="common-header.jsp"></jsp:include>
<script src="${STATIC_ROOT}/new-style/js/jquery.KinSlideshow-1.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${STATIC_ROOT}/new-style/js/jquery.pagination.js"></script>
<script type="text/javascript">
    $(function() {
        $("#KinSlideshow").KinSlideshow({
            moveStyle : "up",
            isHasTitleFont : false,
            isHasTitleBar : false,
            btn : {
                btn_bgColor : "#FFFFFF",
                btn_bgHoverColor : "#c80f0f",
                btn_fontColor : "#000000",
                btn_fontHoverColor : "#FFFFFF",
                btn_borderColor : "#cccccc",
                btn_borderHoverColor : "#FFFFFF",
                btn_borderWidth : 1
            }
        });
    })
</script>
<script type="text/javascript">
    function pageselectCallback(page_id, jq) {
        $('#Searchresult').text("Showing search results " + ((page_id * 10) + 1) + "-" + ((page_id * 10) + 10));
    }

    $(document).ready(function() {
        // Create pagination element
        $("#Pagination").pagination(300, {
            num_edge_entries : 2,
            num_display_entries : 8,
            callback : pageselectCallback
        });

        // Set handler for setting pagination options via form
        $("#setoptions").click(function() {
            var opt = {
                callback : pageselectCallback
            };
            // Collect options from the text fields - the fields are named like their option counterparts
            $("input[@type=text]").each(function() {
                opt[this.name] = this.className.match(/numeric/) ? parseInt(this.value) : this.value;
            });
            // extract maxitems
            var maxitems = opt.maxitems;
            delete opt.maxitems;
            // Avoid html injections in this demo
            var htmlspecialchars = {
                "&" : "&amp;",
                "<":"&lt;", ">" : "&gt;",
                '"' : "&quot;"
            }
            $.each(htmlspecialchars, function(k, v) {
                opt.prev_text = opt.prev_text.replace(k, v);
                opt.next_text = opt.next_text.replace(k, v);
            })
            $("#Pagination").pagination(maxitems, opt);
        });

    });
</script>
</head>
<body>
    <jsp:include page="common-nav.jsp"><jsp:param value="3" name="offset" /></jsp:include>


    <!--主体-->
    <div id="container">

        <!--位置导航-->
        <div class="wzdh">首页&nbsp;&gt;&nbsp;大家想买</div>
        <!--位置导航 end-->

        <!--左侧-->
        <div class="fl" style="width: 230px;">
            <div class="list_left">
                <h2>&nbsp;&nbsp;热卖产品</h2>
                <ul>
                    <c:forEach var="item" items="${adList}">
                        <c:if test="${item.adType=='0'}">
                            <li><a href="${pageContext.request.contextPath}/product/item.html?product.id=${item.refId}">
                                    <img src="${pageContext.request.contextPath}/assistant/image.html?id=${item.adRefId}" style="width: 200px;" alt="">
                                </a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>

            <div class="list_left" style="margin-top: 10px;">
                <h2>&nbsp;&nbsp;最旺求购</h2>
                <ul>
                    <c:forEach var="item" items="${adList}">
                        <c:if test="${item.adType=='1'}">
                            <li><a href="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.refId}">
                                    <img src="${pageContext.request.contextPath}/assistant/image.html?id=${item.adRefId}" style="width: 200px;" alt="">
                                </a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <!--左侧 end-->
        <!--右侧-->
        <div class="fr">
            <div id="KinSlideshow" style="visibility: hidden;">
                <a href="#" target="_blank">
                    <img src="${STATIC_ROOT}/new-style/upfile/banner0.jpg" width="729" height="172" />
                </a>
                <a href="#" target="_blank">
                    <img src="${STATIC_ROOT}/new-style/upfile/banner0.jpg" width="729" height="172" />
                </a>
            </div>

            <div class="list_cp">
                <h2>&nbsp;&nbsp;大家想买</h2>
                <ul>
                    <c:forEach var="item" items="${pagination.list}">
                        <li>
                            <p class="sell_pic">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/image.html?id=${item.ids[0]}" width="100" height="100" border="0">
                                </a>
                            </p>
                            <dl>
                                <dt>${item.purchaseName}</dt>
                                <dd>
                                    更新日期:
                                    <fmt:formatDate value="${item.lastUpdated}" pattern="yyyy-MM-dd" />
                                </dd>
                                <p>产品地址:${item.purchaseAddress},产品属地:${item.purchaseLocation},产品类型:${item.purchaseTypeName},产品描述:${item.purchaseDesc}</p>
                                <a href="${pageContext.request.contextPath}/purchase/item.html?purchase.id=${item.id}" class="more" target="_blank">查看详情</a>
                            </dl>
                            <div class="cl"></div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!--分页开始-->
            <x:page href="${pageContext.request.contextPath}/product/list.html" pagination="${pagination}" />
            <!--分页结束-->
        </div>
        <!--右侧 end-->
        <div class="cb"></div>

    </div>
    <!--主体结束-->

    <jsp:include page="common-bottom.jsp"></jsp:include>
</body>
</html>
