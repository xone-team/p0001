<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>后台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${STATIC_ROOT}/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${STATIC_ROOT}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${STATIC_ROOT}/css/base.css" rel="stylesheet">
<style type="text/css">
</style>
</head>
<body>
 <div class="container-fluid">
  <div class="row-fluid" id="X_bodyContainer">
   <div class="span10" id="X_contentContainer">
    <!-- content -->
    <div>
     <strong>录入表单</strong>
     <form id="mainForm">
      <input type="hidden" name="f.id">
      <div class="row-fluid form-horizontal">
       <div class="control-group success">
        <label class="control-label" for="inputUsername">用户名</label>
        <div class="controls">
         <input type="text" name="f.username" id="inputUsername" placeholder="用户名"> <span class="X-field-message success">sdfasdfa</span>
        </div>
       </div>
       <div class="control-group success">
        <label class="control-label" for="inputPassword">密码</label>
        <div class="controls">
         <input type="password" name="f.password" id="inputPassword" placeholder="密码"><span class="X-field-message success">sdfasdfa</span> <span class="X-field-message badge badge-success">OK</span>
        </div>
       </div>
       <div class="control-group">
        <label class="control-label" for="inputRepassword">重复密码</label>
        <div class="controls">
         <input type="password" name="f.repassword" id="inputRepassword" placeholder="重复录入一次密码">
        </div>
       </div>
       <div class="control-group">
        <label class="control-label" for="inputNickName">呢称</label>
        <div class="controls">
         <input type="text" name="f.nickName" id="inputNickName" placeholder="呢称">
        </div>
       </div>
       <div class="control-group">
        <label class="control-label" for="inputUsername">手机</label>
        <div class="controls">
         <input type="text" name="f.cellphone" id="inputUsername" placeholder="手机，如13612345">
        </div>
       </div>
       <div class="control-group">
        <label class="control-label" for="inputNickName">QQ</label>
        <div class="controls">
         <input type="text" name="f.qq" id="inputNickName" placeholder="QQ号码，如5236">
        </div>
       </div>
       <div class="control-group">
        <label class="control-label" for="inputUsername">联系人</label>
        <div class="controls">
         <input type="text" name="f.contactor" id="inputUsername" placeholder="联系人姓名，如 张三">
        </div>
       </div>
       <div class="control-group">
        <label class="control-label" for="inputNickName">邮箱</label>
        <div class="controls">
         <input type="text" name="f.email" id="inputNickName" placeholder="邮箱,如 zhee@sina.com">
        </div>
       </div>
       <div class="control-group">
        <label class="control-label" for="inputUsername">所在地</label>
        <div class="controls">
         <select class="span2">
          <option>上海</option>
          <option>浙江</option>
          <option>江西</option>
         </select> <select class="span2">
          <option>上海市</option>
          <option>杭州市</option>
          <option>景德镇</option>
         </select> <select class="span2">
          <option>徐汇区</option>
          <option>萧山区</option>
          <option>清水县</option>
         </select><br /> <input type="text" class="span4" placeholder="详细地址">
        </div>
       </div>
       <div class="control-group">
        <label class="control-label" for="inputNickName">是否认证</label>
        <div class="controls">
         <label class="radio inline"> <input type="radio" name="f.credit"> 是
         </label> <label class="radio inline"> <input type="radio" name="f.credit" checked> 否
         </label>
        </div>
       </div>
       <div class="control-group">
        <label class="control-label" for="inputNickName">角色</label>
        <div class="controls">
         <a href="#"><span class="label label-default">注册用户</span></a> <a href="#"><span class="label label-default">后台用户</span></a>
         <button class="btn btn-mini" data-toggle="modal" data-target="#myModal">
          <i class="icon-pencil"></i>编辑
         </button>
        </div>
       </div>
      </div>
     </form>
     <div class="row-fluid">
      <p class="text-center">
       <button class="btn btn-small" onclick="saveForm();">
        <i class="icon-hdd"></i>保存
       </button>
      </p>
     </div>

    </div>
    <!-- /content -->
   </div>
  </div>
 </div>
 <!-- modal to select role -->
 <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   <h3 id="myModalLabel">选择角色</h3>
  </div>
  <div class="modal-body">
   <!-- query conditions -->
   <div class="row-fluid">
    <div class="span5 form-horizontal">
     <div class="control-group">
      <label class="control-label" for="inputUsername">名称</label>
      <div class="controls">
       <input type="text" name="username" id="inputUsername" placeholder="角色名称">
      </div>
     </div>
    </div>
   </div>
   <!-- /query conditions -->
   <div class="row-fluid">
    <p class="text-right">
     <button class="btn btn-small">
      <i class="icon-search"></i>查询
     </button>
    </p>
   </div>
   <!-- query result -->
   <div class="row-fluid">
    <table class="table table-hover table-bordered table-condensed">
     <thead>
      <tr>
       <th>序号</th>
       <th>名称</th>
       <th>编码</th>
       <th><label class="checkbox"> <input type="checkbox">
       </label></th>
      </tr>
     </thead>
     <tbody>
      <tr>
       <td class="table-col-index">1</td>
       <td>注册用户</td>
       <td>register</td>
       <td><label class="checkbox"> <input type="checkbox">
       </label></td>
      </tr>
      <tr>
       <td class="table-col-index">2</td>
       <td>后台用户</td>
       <td>console_user</td>
       <td><label class="checkbox"> <input type="checkbox">
       </label></td>
      </tr>
      <tr>
       <td class="table-col-index">3</td>
       <td>管理员</td>
       <td>administrator</td>
       <td><label class="checkbox"> <input type="checkbox">
       </label></td>
      </tr>
     </tbody>
    </table>
   </div>
   <!-- /query result -->
  </div>
  <div class="modal-footer">
   <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
   <button class="btn btn-primary">完成</button>
  </div>
 </div>
 <!-- /modal to select role -->
 <script src="${STATIC_ROOT}/js/jquery.min.js"></script>
 <script src="${STATIC_ROOT}/bootstrap/js/bootstrap.js"></script>
 <script src="${STATIC_ROOT}/js/My97DatePicker/WdatePicker.js"></script>
 <script src="${STATIC_ROOT}/js/purl.js"></script>
 <script src="${pageContext.request.contextPath}/js/base.js"></script>
 <script type="text/javascript">
        jQuery(function() {
            XONE.initConsoleMenu("person");
            XONE.ajax({
                url : "/person/get.html",
                type : "POST",
                data : jQuery.url().param(),
                success : function(data, textStatus, jqXHR) {
                    renderForm(data.person);
                }
            });
            renderValidation();
        });
        function renderForm(o) {
			var prefix = "f.";
			var container = jQuery("#mainForm");
            if (o == null)
                return;
            var formObj = o.f;
            var vc = o.validationContext;
            jQuery('#mainForm input[name="f.id"]').val(XONE.null2blank(formObj.id));
            jQuery('#mainForm input[name="f.username"]').val(XONE.null2blank(formObj.username));
            jQuery('#mainForm input[name="f.password"]').val(XONE.null2blank(formObj.password));
            jQuery('#mainForm input[name="f.nickName"]').val(XONE.null2blank(formObj.nickName));
            //TODO
            renderValidation(validationContext, prefix, container);
        }

        function renderValidation(validationContext, prefix, container) {
			if(validationContext == null)
			    return;
			if(validationContext.fieldErrors != null){
				for(var i = 0; i < validationContext.fieldErrors.length; i++){
				    var fieldError = validationContext.fieldErrors[i];
				    renderField(fieldError.name, fieldError.value, "error", prefix, container);
				}
			}
        }
        function renderField(fieldName, fieldText, status, prefix, container){
			var inputEl = jQuery('input[name="'+prefix+fieldName+'"]', container);
			if(inputEl.size() < 1)
			    return;
			var controlEl = inputEl.parent();
			var controlGroupEl = controlEl.parent();
			controlGroupEl.removeClass("warning error info success")
			controlGroupEl.addClass(status);
			controlEl.children().remove(".X-field-message");
			controlEl.append('<span class="X-field-message help-inline">'+fieldText+'</span>');
        }

        function saveForm() {
            var d = jQuery("#mainForm").serializeObject();
            XONE.ajax({
                url : "/person/save.html",
                type : "POST",
                data : d,
                success : function(data, textStatus, jqXHR) {
                    renderForm(data.person);
                    alert("操作成功");
                }
            })
        }
    </script>
</body>
</html>
