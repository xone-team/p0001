<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach var="item" items="${list}">
 <tr>
  <td>${item.name}</td>
  <td>${item.remark}</td>
  <td><input type="checkbox" name="selectRolesId" value="${item.id}">
   <div class="X-select-result hide">
     <input type="hidden" class="X-select-hidden-value" value="${item.id}">
     <span class="label label-default">${item.name}</span>
   </div>
  </td>
 </tr>
</c:forEach>
