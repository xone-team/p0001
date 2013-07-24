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
     <!-- query conditions -->
     <div class="accordion">
      <div class="accordion-group">
       <div class="accordion-heading">
        <div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
       </div>
       <form id="queryForm">
        <div id="queryConditions" class="accordion-body collapse">
         <div class="accordion-inner">
          <div class="row-fluid">
           <div class="span5 form-horizontal">
            <div class="control-group">
             <label class="control-label" for="queryUsername">用户名</label>
             <div class="controls">
              <input type="text" name="q.username" id="queryUsername" placeholder="用户名">
             </div>
            </div>
           </div>
           <div class="span5 form-horizontal">
            <div class="control-group">
             <label class="control-label" for="queryNickName">呢称</label>
             <div class="controls">
              <input type="text" name="q.nickName" id="queryNickName" placeholder="呢称">
             </div>
            </div>
           </div>
          </div>
          <div class="row-fluid">
           <div class="span5 form-horizontal">
            <div class="control-group">
             <label class="control-label" for="queryCellphone">手机</label>
             <div class="controls">
              <input type="text" name="q.cellphone" id="queryCellphone" placeholder="手机，如13612345">
             </div>
            </div>
           </div>
           <div class="span5 form-horizontal">
            <div class="control-group">
             <label class="control-label" for="queryQq">QQ</label>
             <div class="controls">
              <input type="text" name="q.qq" id="queryQq" placeholder="QQ号码，如5236">
             </div>
            </div>
           </div>
          </div>
          <div class="row-fluid">
           <div class="span5 form-horizontal">
            <div class="control-group">
             <label class="control-label" for="queryContactor">联系人</label>
             <div class="controls">
              <input type="text" name="q.Contactor" id="queryContactor" placeholder="联系人姓名，如 张三">
             </div>
            </div>
           </div>
           <div class="span5 form-horizontal">
            <div class="control-group">
             <label class="control-label" for="queryEmail">邮箱</label>
             <div class="controls">
              <input type="text" name="q.email" id="queryEmail" placeholder="邮箱,如 zhee@sina.com">
             </div>
            </div>
           </div>
          </div>
          <div class="row-fluid">
           <div class="form-horizontal">
            <div class="control-group">
             <label class="control-label" for="queryAddress">所在地</label>
             <div class="controls">
              <input type="text" name="q.address" id="queryAddress" placeholder="所在地,如 上海">
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </form>
      </div>
     </div>
     <!-- query conditions end -->
     <div class="row-fluid">
      <p class="text-right">
       <a class="btn btn-small" href="input.html"> <i class="icon-plus"></i>创建
       </a>
       <button class="btn btn-small" onclick="query()">
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
         <th>用户名</th>
         <th>密码</th>
         <th>呢称</th>
         <th>手机</th>
         <th>联系人</th>
         <th>QQ</th>
         <th>邮箱</th>
         <th>所在地</th>
         <th>认证<br />状态
         </th>
         <th style="width: 9em">操作</th>
        </tr>
       </thead>
       <tbody id="tbodyList">
       </tbody>
      </table>
      <div class="pagination text-right">
       <ul>
        <li class="disabled"><a href="#">&laquo;</a></li>
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">&raquo;</a></li>
       </ul>
      </div>
     </div>
     <!-- query result end -->
    </div>
    <!-- content end -->
   </div>
  </div>
 </div>
 <script src="${STATIC_ROOT}/js/jquery.min.js"></script>
 <script src="${STATIC_ROOT}/bootstrap/js/bootstrap.js"></script>
 <script src="${STATIC_ROOT}/js/My97DatePicker/WdatePicker.js"></script>
 <script src="${pageContext.request.contextPath}/js/base.js"></script>
 <script type="text/javascript">
        jQuery(function() {
            XONE.initConsoleMenu("person");
            XONE.initModal("confirm2delete");
            query();
        });
        function query(){
            XONE.queryAction("/person/list.html", renderRow);
        }
        function renderRow(index, rowData) {
            var h = "";
            h += '<tr>';
            h += '	<td class="table-col-index">' + (index + 1) + '</td>';
            h += '	<td>' + XONE.null2blank(rowData.username) + '</td>';
            h += '	<td>' + XONE.null2blank(rowData.password) + '</td>';
            h += '	<td>' + XONE.null2blank(rowData.nickName) + '</td>';
            h += '	<td class="table-col-number">' + XONE.null2blank(rowData.cellphone) + '</td>';
            h += '	<td>' + XONE.null2blank(rowData.contactor) + '</td>';
            h += '	<td class="table-col-number">' + XONE.null2blank(rowData.qq) + '</td>';
            h += '	<td>' + XONE.null2blank(rowData.email) + '</td>';
            h += '	<td>' + XONE.null2blank(rowData.address) + '</td>';
            h += '	<td>' + XONE.null2blank(rowData.credit) + '</td>';
            h += '	<td class="table-col-operation"><a class="btn btn-mini"';
            h += '		href="input.html?f.id=' + XONE.null2blank(rowData.id) + '"> <i class="icon-pencil"></i>编辑';
            h += '	</a>';
            h += '		<button class="btn btn-mini btn-danger" data-toggle="modal"';
			    h += '			data-target="#X_model_confirm2delete">';
            h += '			<i class="icon-trash icon-white"></i>删除';
            h += '		</button></td>';
            h += '</tr>';
            return h;
        }
    </script>
</body>
</html>

