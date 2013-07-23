<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="/mytaglib" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>后台</title>
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
						<ul class="breadcrumb" id="X_breadcrumbs_ul"><li>后台 <span class="divider">/</span></li><li>用户管理 <span class="divider">/</span></li><li class="active">${tableName}列表</li></ul>
					</div>
					<div class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<div class="accordion-toggle nav-header" data-toggle="collapse" data-target="#queryConditions">查询条件</div>
							</div>
							<div id="queryConditions" class="accordion-body in collapse" style="height: auto;">
								<div class="accordion-inner">
								<#list tableProperties as p>
									<#if p_index % 2 == 0 >
									<div class="row-fluid">
									</#if>
										<div class="span5 form-horizontal">
											<div class="control-group">
												<label class="control-label" for="${p.javaVarName}">${p.columnComments}</label>
												<div class="controls">
													<input type="text" id="${p.javaVarName}" name="${tableVarName}.${p.javaVarName}" maxlength="${p.columnDisplaySize}" placeholder="${p.columnComments}">
												</div>
											</div>
										</div>
									<#if p_index % 2 == 1 && (p_has_next)>
									</div>
									</#if>
									<#if !(p_has_next)>
									</div>
									</#if>
								</#list>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<p class="text-right">
							<a class="btn btn-small" href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}Create.html"> <iclass="icon-plus"></i>创建 </a>
							<button class="btn btn-small">
								<span class="icon-search"></span>查询
							</button>
						</p>
					</div>
					<div class="row-fluid">
						<table class="table table-bordered" style="width:100%">
							<thead>
							<#list tableProperties as p>
								<th>${p.columnComments}</th>
							</#list>
							</thead>
							<tbody>
							<c:forEach var="item" items="${r"${pagination.list}"}">
							<tr>
							<#list tableProperties as p>
								<td>${r"${"}item.${p.javaVarName}}</td>
							</#list>
								<td>
									<a href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}Edit.html?${tableVarName}.id=${r"${item.id}"}" class="btn btn-mini">编辑</a>
									<a href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}Item.html?${tableVarName}.id=${r"${item.id}"}" class="btn btn-mini">详细</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<x:page href="${r"${pageContext.request.contextPath}"}/${packageName}/${tableVarName}List.html" pagination="${r"${pagination}"}"/>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</body>
</html>
