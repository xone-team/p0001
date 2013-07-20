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
              <div id="queryConditions" class="accordion-body collapse">
                <div class="accordion-inner">
                  <div class="row-fluid">
                    <div class="span5 form-horizontal">
                      <div class="control-group">
                        <label class="control-label" for="inputUsername">用户名</label>
                        <div class="controls">
                          <input type="text" name="username" id="inputUsername" placeholder="用户名">
                        </div>
                      </div>
                    </div>
                    <div class="span5 form-horizontal">
                      <div class="control-group">
                        <label class="control-label" for="inputNickName">呢称</label>
                        <div class="controls">
                          <input type="text" name="nickName" id="inputNickName" placeholder="呢称">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="span5 form-horizontal">
                      <div class="control-group">
                        <label class="control-label" for="inputUsername">手机</label>
                        <div class="controls">
                          <input type="text" name="username" id="inputUsername" placeholder="手机，如13612345">
                        </div>
                      </div>
                    </div>
                    <div class="span5 form-horizontal">
                      <div class="control-group">
                        <label class="control-label" for="inputNickName">QQ</label>
                        <div class="controls">
                          <input type="text" name="nickName" id="inputNickName" placeholder="QQ号码，如5236">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="span5 form-horizontal">
                      <div class="control-group">
                        <label class="control-label" for="inputUsername">联系人</label>
                        <div class="controls">
                          <input type="text" name="username" id="inputUsername" placeholder="联系人姓名，如 张三">
                        </div>
                      </div>
                    </div>
                    <div class="span5 form-horizontal">
                      <div class="control-group">
                        <label class="control-label" for="inputNickName">邮箱</label>
                        <div class="controls">
                          <input type="text" name="nickName" id="inputNickName" placeholder="邮箱,如 zhee@sina.com">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="form-horizontal">
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
                          </select> <input type="text" class="span4" placeholder="详细地址">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="form-horizontal">
                      <div class="control-group">
                        <label class="control-label" for="inputUsername">注册日期</label>
                        <div class="controls">
                          <div class="input-prepend input-append">
                            <input class="span4 Wdate" type="text" placeholder="最小日期" onclick="WdatePicker()"> <span class="add-on">~</span> <input class="span4 Wdate" type="text" placeholder="最大日期" onclick="WdatePicker()">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- query conditions end -->
          <div class="row-fluid">
            <p class="text-right">
              <a class="btn btn-small" href="input.html"> <i class="icon-plus"></i>创建
              </a>
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
                  <th rowspan="2">序号</th>
                  <th rowspan="2">用户名</th>
                  <th rowspan="2">密码</th>
                  <th rowspan="2">呢称</th>
                  <th rowspan="2">手机</th>
                  <th rowspan="2">联系人</th>
                  <th rowspan="2">QQ</th>
                  <th rowspan="2">邮箱</th>
                  <th colspan="3">所在地</th>
                  <th rowspan="2">认证<br />状态
                  </th>
                  <th rowspan="2" style="width: 9em">操作</th>
                </tr>
                <tr>
                  <th>省</th>
                  <th>市</th>
                  <th>区</th>
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
                XONE.ajax({
                    url : "/person/list.html",
                    dataType : "JSON",
                    success : function(data, textStatus, jqXHR) {
                        var list = data.list;
                        var html = "";
                        for ( var i = 0; i < list.length; i++) {
                            html += getRowHtml(i, list[i]);
                        }
                        jQuery("#tbodyList").html(html);
                    }
                });
            });

            function getRowHtml(i, o) {
                var h = "";
                h += '<tr>';
                h += '	<td class="table-col-index">' + (i + 1) + '</td>';
                h += '	<td>' + XONE.null2blank(o.username) + '</td>';
                h += '	<td>' + XONE.null2blank(o.password) + '</td>';
                h += '	<td>' + XONE.null2blank(o.nickName) + '</td>';
                h += '	<td class="table-col-number">' + XONE.null2blank(o.cellphone) + '</td>';
                h += '	<td>' + XONE.null2blank(o.contactor) + '</td>';
                h += '	<td class="table-col-number">' + XONE.null2blank(o.qq) + '</td>';
                h += '	<td>' + XONE.null2blank(o.email) + '</td>';
                h += '	<td>' + XONE.null2blank(o.province) + '</td>';
                h += '	<td>' + XONE.null2blank(o.city) + '</td>';
                h += '	<td>' + XONE.null2blank(o.district) + '</td>';
                h += '	<td>' + XONE.null2blank(o.credit) + '</td>';
                h += '	<td class="table-col-operation"><a class="btn btn-mini"';
                h += '		href="input.html?person.id=' + XONE.null2blank(o.id) + '"> <i class="icon-pencil"></i>编辑';
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

