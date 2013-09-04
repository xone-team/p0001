<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${STATIC_ROOT}/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/css/docs.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/css/listview.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/css/all.css" />
<style type="text/css">
* {
    font-family: "Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif
}

;
li {
    display: list-item;
    list-style-type: none;
}

.list_gq .gq {
    color: #FFF;
    background: #FF6C00;
    line-height: 25px;
}

.txt_date {
    color: #999;
    float: right;
}

.accordion .accordion-group,table {
    background-color: #fcfcfc;
}

*.inline {
    display: inline !important;
}

.logined-message {
    color: #ffffff;
}

.logined-message a {
    color: #f89406;
}

.banner-down-btn {
    width: 239px;
    height: 78px;
    display: block;
    background: url("${STATIC_ROOT}/image/banner-icons.png") no-repeat;
}

.down-to-drop a {
    float: left;
    width: 26px;
    height: 28px;
    margin-left: 20px;
}

.banner-down-android,.banner-down-ios,.banner-down-win {
    background: url("${STATIC_ROOT}/image/banner-icons.png") no-repeat;
}

.banner-down-android {
    background-position: -239px -125px;
}

.banner-down-android:hover {
    background-position: -239px -158px;
}

.banner-down-ios {
    background-position: -265px -125px;
}

.banner-down-ios:hover {
    background-position: -265px -158px;
}
</style>
<script src="${STATIC_ROOT}/js/My97DatePicker/WdatePicker.js"></script>
