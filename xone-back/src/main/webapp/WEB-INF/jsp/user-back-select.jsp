<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach var="item" items="${list}">
 <tr>
  <td>${item.username}</td>
  <td>${item.nickName}</td>
  <td>${item.cellphone}</td>
  <td>${item.credit}</td>
  <td>${item.userLevel}</td>
  <td><input type="radio" name="selectPersonId" value="${item.id}">
   <div class="X-select-result hide">
     <input type="hidden" name="person.userApply" value="${item.id}">
     <span class="label label-default">${item.username}</span>
   </div>
  </td>
 </tr>
</c:forEach>
