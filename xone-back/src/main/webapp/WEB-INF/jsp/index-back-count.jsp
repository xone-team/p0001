<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row－fluid">
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
<div class="row－fluid">
<div class="span4">
    <div class="thumbnail">
        <div class="caption">
            <h3>广告到期</h3>
            <p>
                有 ${adbannerCount } 个广告即将到期，需要处理，<a href="${pageContext.request.contextPath}/adbanner/adbannerList.html?adbanner.ltAdEnd=${adbannerAlertDate}">点击进入</a>
            </p>
        </div>
    </div>
</div>
<div class="span4">
    <div class="thumbnail">
        <div class="caption">
            <h3>新置顶发布</h3>
            <p>
                有 ${overheadCount} 个新置顶需要审核，<a href="${pageContext.request.contextPath}/overhead/overheadList.html?overhead.checkStatus=0">点击进入</a>
            </p>
        </div>
    </div>
</div>
</div>
