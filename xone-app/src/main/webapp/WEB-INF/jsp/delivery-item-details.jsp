<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <li>
   	<table style="width:100%">
   		<tr>
   			<td class="mylabel">编　　号:</td>
   			<td style="text-align:left;">${delivery.id}</td>
   		</tr>
   	</table>
   </li>
   <li>
   	<table style="width:100%">
   		<tr>
   			<td class="mylabel">市场区域:</td>
   			<td>${delivery.marketarea}</td>
   		</tr>
   	</table>
   </li>
   <li>
   	<table style="width:100%">
   		<tr>
   			<td class="mylabel">目&nbsp;&nbsp;的&nbsp;&nbsp;地:</td>
   			<td>${delivery.determini}</td>
   		</tr>
   	</table>
   </li>
   <li>
   	<table style="width:100%">
   		<tr>
   			<td class="mylabel">上货时间:</td>
   			<td>${delivery.loadtime}</td>
   		</tr>
   	</table>
   </li>
   <li>
   	<table style="width:100%">
   		<tr>
   			<td class="mylabel">上货地点:</td>
   			<td>${delivery.loadaddress}</td>
   		</tr>
   	</table>
   </li>
   <li>
   	<table style="width:100%">
   		<tr>
   			<td class="mylabel">流程状态:</td>
   			<td>${delivery.handleStatus}</td>
   		</tr>
   	</table>
   </li>
   <li>
   	<table style="width:100%">
   		<tr>
   			<td class="mylabel">创建时间:</td>
   			<td><fmt:formatDate value="${delivery.dateCreated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
   		</tr>
   	</table>
   </li>
   <li>
   	<table style="width:100%">
   		<tr>
   			<td class="mylabel">更新时间:</td>
   			<td><fmt:formatDate value="${delivery.lastUpdated}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
   		</tr>
   	</table>
   </li>
   <li style="padding-right:0px;">
   	<table style="width:100%">
   		<tr>
   			<td rowspan="3" class="mylabel" style="border-right:1px solid gray;">货　　量:</td>
  			<td style="width:40px;text-align:right;">共</td>
   			<td>${delivery.boxNum}&nbsp;箱</td>
  			<td style="text-align:right;">${delivery.unitNum}&nbsp;</td>
  			<td style="width:50px;">kg/箱</td>
   		</tr>
   		<tr>
  			<td  style="text-align:right;">总共</td>
  			<td colspan="2" style="text-align:right;">${delivery.boxTotal}</td>
  			<td>kg</td>
   		</tr>
   		<tr>
  			<td style="border-top:1px solid gray;text-align:right;">或者</td>
   			<td colspan="2" style="border-top:1px solid gray;text-align:right;">${delivery.totalWeight}</td>
  			<td style="border-top:1px solid gray;">kg</td>
   		</tr>
   	</table>
   </li>
