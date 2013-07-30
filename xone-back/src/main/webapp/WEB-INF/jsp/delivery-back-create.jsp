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
                        <li class="active">创建物流配送</li>
                    </ul>
                </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/delivery/deliverySave.html">
                    <input type="hidden" name="delivery.id">
                    <div class="control-group">
                        <label class="control-label" for="productId">产品编号</label>
                        <div class="controls">
                            <input type="text" id="productId" name="delivery.productId" maxlength="20" placeholder="产品编号">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="marketarea">市场区域</label>
                        <div class="controls">
                            <input type="text" id="marketarea" name="delivery.marketarea" maxlength="255" placeholder="市场区域">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="determini">目的地点</label>
                        <div class="controls">
                            <input type="text" id="determini" name="delivery.determini" maxlength="255" placeholder="目的地点">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="loadtime">上货时间</label>
                        <div class="controls">
                            <input type="text" id="loadtime" name="delivery.loadtime" maxlength="255" placeholder="上货时间">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="loadaddress">上货地点</label>
                        <div class="controls">
                            <input type="text" id="loadaddress" name="delivery.loadaddress" maxlength="255" placeholder="上货地点">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="boxNum">箱数</label>
                        <div class="controls">
                            <input type="text" id="boxNum" name="delivery.boxNum" maxlength="20" placeholder="箱数">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="unitNum">单位重量</label>
                        <div class="controls">
                            <input type="text" id="unitNum" name="delivery.unitNum" maxlength="20" placeholder="单位重量">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="boxTotal">总箱数</label>
                        <div class="controls">
                            <input type="text" id="boxTotal" name="delivery.boxTotal" maxlength="20" placeholder="总箱数">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="totalWeight">总重</label>
                        <div class="controls">
                            <input type="text" id="totalWeight" name="delivery.totalWeight" maxlength="20" placeholder="总重">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="flagPass">通过标识</label>
                        <div class="controls">
                            <input type="text" id="flagPass" name="delivery.flagPass" maxlength="1" placeholder="通过标识">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="remark">备注</label>
                        <div class="controls">
                            <input type="text" id="remark" name="delivery.remark" maxlength="1023" placeholder="备注">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn">提交创建</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
<script>
    jQuery(function() {
        jQuery("#X_menu_li_delivery").addClass("active");
    });
</script>
</html>
