<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>后台</title>
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
                        <li class="active">首页</li>
                    </ul>
                </div>

                <div class="row－fluid" id="X_count_container">
                    <div class="span4">
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>新产品发布</h3>
                                <p>
                                    有 ${productCount} 个新产品需要审核，<a href="${pageContext.request.contextPath}/product/productList.html?product.checkStatus=0">点击进入</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>新求购发布</h3>
                                <p>
                                    有 ${purchaseCount} 个新求购需要审核，<a href="${pageContext.request.contextPath}/purchase/purchaseList.html?purchase.checkStatus=0">点击进入</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>新物流发布</h3>
                                <p>
                                    有 ${deliveryCount } 个新物流需要审核，<a href="${pageContext.request.contextPath}/delivery/deliveryList.html?delivery.checkStatus=0">点击进入</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
<script>
    jQuery(function() {
        var x = <%=com.xone.model.utils.Constants.BACK_INDEX_REFRESH_TIME%>;
        setInterval(getnums, 1000 * 60 * x);
        getNums();
    });
    function getNums(){
        $.ajax({
			url : "${pageContext.request.contextPath}/console/count.html",
			success : function(text){
			    $("#X_count_container").html(text);
			}
        });
    }
</script>
</html>
