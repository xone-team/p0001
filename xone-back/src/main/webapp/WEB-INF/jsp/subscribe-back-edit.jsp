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
                        <li>用户管理 <span class="divider">/</span></li>
                        <li><a href="${pageContext.request.contextPath}/subscribe/subscribeList.html">subscribe列表</a> <span class="divider">/</span></li>
                        <li class="active">subscribe编辑</li>
                    </ul>
                </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/subscribe/subscribeUpdate.html">
                    <div class="control-group">
                        <label class="control-label" for="id">编号</label>
                        <div class="controls">
                            <input type="text" id="id" name="subscribe.id" value="${subscribe.id}" maxlength="20" placeholder="编号">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="marketarea">市场区域</label>
                        <div class="controls">
                            <input type="text" id="marketarea" name="subscribe.marketarea" value="${subscribe.marketarea}" maxlength="20" placeholder="市场区域">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="productNameKey">产品名称</label>
                        <div class="controls">
                            <input type="text" id="productNameKey" name="subscribe.productNameKey" value="${subscribe.productNameKey}" maxlength="20" placeholder="产品名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="saleType">销售类型</label>
                        <div class="controls">
                            <input type="text" id="saleType" name="subscribe.saleType" value="${subscribe.saleType}" maxlength="2" placeholder="销售类型">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="credit">公司信誉</label>
                        <div class="controls">
                            <input type="text" id="credit" name="subscribe.credit" value="${subscribe.credit}" maxlength="2" placeholder="公司信誉">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="refId">相关编号</label>
                        <div class="controls">
                            <input type="text" id="refId" name="subscribe.refId" value="${subscribe.refId}" maxlength="20" placeholder="相关编号">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userApply">申请人</label>
                        <div class="controls">
                            <input type="text" id="userApply" name="subscribe.userApply" value="${subscribe.userApply}" maxlength="20" placeholder="申请人">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="dateApply">申请时间</label>
                        <div class="controls">
                            <input type="text" id="dateApply" name="subscribe.dateApply" value="<fmt:formatDate value="${subscribe.dateApply}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="申请时间">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userCheck">审核人</label>
                        <div class="controls">
                            <input type="text" id="userCheck" name="subscribe.userCheck" value="${subscribe.userCheck}" maxlength="20" placeholder="审核人">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="dateCheck">审核时间</label>
                        <div class="controls">
                            <input type="text" id="dateCheck" name="subscribe.dateCheck" value="<fmt:formatDate value="${subscribe.dateCheck}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="审核时间">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="flagDeleted">删除标识</label>
                        <div class="controls">
                            <input type="text" id="flagDeleted" name="subscribe.flagDeleted" value="${subscribe.flagDeleted}" maxlength="1" placeholder="删除标识">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userCreated">创建人</label>
                        <div class="controls">
                            <input type="text" id="userCreated" name="subscribe.userCreated" value="${subscribe.userCreated}" maxlength="20" placeholder="创建人">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="dateCreated">创建时间</label>
                        <div class="controls">
                            <input type="text" id="dateCreated" name="subscribe.dateCreated" value="<fmt:formatDate value="${subscribe.dateCreated}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="创建时间">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userUpdated">更新人</label>
                        <div class="controls">
                            <input type="text" id="userUpdated" name="subscribe.userUpdated" value="${subscribe.userUpdated}" maxlength="20" placeholder="更新人">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="lastUpdated">更新时间</label>
                        <div class="controls">
                            <input type="text" id="lastUpdated" name="subscribe.lastUpdated" value="<fmt:formatDate value="${subscribe.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="Wdate" onclick="WdatePicker()" maxlength="19" placeholder="更新时间">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn" onclick="return confirm('确定更新本条记录?');">提交更新</button>
                            <button type="submit" name="delete" value="delete" class="btn" onclick="return confirm('确定删除本条记录?');">删除记录</button>
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
        jQuery("#X_menu_li_subscribe").addClass("active");
    });
</script>
</html>
