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
                        <li><a href="${pageContext.request.contextPath}/companyInfo/companyInfoList.html">公司信息列表</a> <span class="divider">/</span></li>
                        <li class="active">公司信息编辑</li>
                    </ul>
                </div>
                <c:if test="${!empty actionErrors }">
                    <div class="alert">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach items="${actionErrors }" var="error">
                            <p>${error }</p>
                        </c:forEach>
                    </div>
                </c:if>
                <form class="form-horizontal" enctype="multipart/form-data" id="companyInfoSaveForm${myidentify}" method="post" action="${pageContext.request.contextPath}/companyInfo/companyInfoUpdate.html">
                    <input type="hidden" name="companyInfo.id" value="${companyInfo.id}" />
                    <div class="control-group">
                        <label class="control-label" for="name">公司名称</label>
                        <div class="controls">
                            <input type="text" id="name" name="companyInfo.name" value="${companyInfo.name}" maxlength="255" placeholder="公司名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="address">公司地址</label>
                        <div class="controls">
                            <input type="text" id="address" name="companyInfo.address" value="${companyInfo.address}" maxlength="255" placeholder="公司地址">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="tel">公司电话</label>
                        <div class="controls">
                            <input type="text" id="tel" name="companyInfo.tel" value="${companyInfo.tel}" maxlength="25" placeholder="公司电话">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="mobile">移动电话</label>
                        <div class="controls">
                            <input type="text" id="mobile" name="companyInfo.mobile" value="${companyInfo.mobile}" maxlength="15" placeholder="移动电话">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="contact">联系人</label>
                        <div class="controls">
                            <input type="text" id="contact" name="companyInfo.contact" value="${companyInfo.contact}" maxlength="15" placeholder="联系人">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="fax">公司传真</label>
                        <div class="controls">
                            <input type="text" id="fax" name="companyInfo.fax" value="${companyInfo.fax}" maxlength="25" placeholder="公司传真">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="intro">公司简介</label>
                        <div class="controls">
                            <input type="text" id="intro" name="companyInfo.intro" value="${companyInfo.intro}" maxlength="25" placeholder="公司简介">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="companyInfoDesc">产品图片</label>
                        <div class="controls">
                            <div class="span4">
                                <div class="control-group uploadimagesdiv1" style="margin-bottom: 0px;">
                                    <c:forEach items="${companyInfo.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 0 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removeCompanyInfoDynamicImage1('${it}');" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadcompanyInfodynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile1').click();">上传图片</button>
                            </div>
                            <div class="span4">
                                <div class="control-group uploadimagesdiv2" style="margin-bottom: 0px;">
                                    <c:forEach items="${companyInfo.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 1 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removeCompanyInfoDynamicImage2('${it}');" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadcompanyInfodynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile2').click();">上传图片</button>
                            </div>
                            <div class="span4">
                                <div class="control-group uploadimagesdiv3" style="margin-bottom: 0px;">
                                    <c:forEach items="${companyInfo.ids}" var="it" varStatus="status">
                                        <c:if test="${ status.index == 2 }">
                                            <div class="well well-small" style="margin-bottom: 0px;">
                                                图片预览
                                                <button class="close pull-right" onclick="removeCompanyInfoDynamicImage3('${it}');" value="删除图片">&times;</button>
                                            </div>
                                            <div class="well well-small">
                                                <img class="uploadcompanyInfodynamicimage" src="${pageContext.request.contextPath}/image.html?id=${it}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn" onclick="$('#uploadImageFile3').click();">上传图片</button>
                            </div>
                        </div>
                    </div>
                    <div class="control-group fileupload" style="display: none;">
                        <input type="file" id="uploadImageFile1" name="uploadFile1" value="">
                        <input type="file" id="uploadImageFile2" name="uploadFile2" value="">
                        <input type="file" id="uploadImageFile3" name="uploadFile3" value="">
                        <c:forEach items="${companyInfo.ids}" var="it" varStatus="status">
                            <input type="hidden" id="imageId${status.index + 1}" name="companyInfo.ids" value="${it}">
                        </c:forEach>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" name="update" value="update" class="btn" onclick="return confirm2('update', '确定更新本条记录?');">提交更新</button>
                            <button type="submit" name="delete" value="delete" class="btn" onclick="return confirm2('delete', '确定删除本条记录?');">删除记录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="common-footer.jsp"></jsp:include>
</body>
<script src="${STATIC_ROOT}/js/fileupload.js"></script>
<script>
window.submitButtonName = "update";
function confirm2(buttonName, msg){
    window.submitButtonName = buttonName;
    return confirm(msg);
}
    jQuery(function() {
        jQuery("#X_menu_li_companyInfo").addClass("active");
        $('#uploadImageFile1[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeCompanyInfoDynamicImage1();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadcompanyInfodynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv1').html('').append(div);
                $('#imageId1').remove();
            }
        });
        $('#uploadImageFile2[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeCompanyInfoDynamicImage2();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadcompanyInfodynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv2').html('').append(div);
                $('#imageId2').remove();
            }
        });
        $('#uploadImageFile3[type="file"]').fileupload({
            onload : function(it, e) {
                var div = document.createElement('div');
                var result = it.data('base64source');
                div.innerHTML = [ '<div class="well well-small" style="margin-bottom:0px;">图片预览<button class="close pull-right" onclick="removeCompanyInfoDynamicImage3();" value="删除图片">&times;</button></div>', '<div class="well well-small"><img class="uploadcompanyInfodynamicimage" src="', result, '"/></div>' ].join('');
                $('div.uploadimagesdiv3').html('').append(div);
                $('#imageId3').remove();
            }
        });

        $('#companyInfoEditForm${myidentify}').submit(function() {
            if('delete' == window.submitButtonName){
                return true;
            }
            var $form = $(this);
            var validate = [ {
                name : 'name',
                text : '请输入公司名称'
            } ];

            var pass = XONE.valid(validate, $form, "companyInfo.");
            return pass;
        });
    });
    function removeCompanyInfoDynamicImage1(id) {
        $('div.uploadimagesdiv1').html('');
        $('#uploadImageFile1').val('');
        if (id != null)
            $('input[name="companyInfo.ids"][value="' + id + '"]').remove();
        ;
        return false;
    }
    function removeCompanyInfoDynamicImage2(id) {
        $('div.uploadimagesdiv2').html('');
        $('#uploadImageFile2').val('');
        if (id != null)
            $('input[name="companyInfo.ids"][value="' + id + '"]').remove();
        return false;
    }
    function removeCompanyInfoDynamicImage3(id) {
        $('div.uploadimagesdiv3').html('');
        $('#uploadImageFile3').val('');
        if (id != null)
            $('input[name="companyInfo.ids"][value="' + id + '"]').remove();
        return false;
    }
</script>
<c:if test="${!empty fieldErrors }">
    <script>
                    <c:forEach items="${fieldErrors }" var="fieldError">
                    XONE.renderFieldMessage('${fieldError.value }', "error", $('input[name="${fieldError.key}"]'));
                    </c:forEach>
                </script>
</c:if>
</html>
