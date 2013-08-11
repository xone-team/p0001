<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${STATIC_ROOT}/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${STATIC_ROOT}/bootstrap/css/bootstrap-responsive.min.css" />
<style type="text/css">
	body {
		padding-top: 60px;
		padding-bottom: 40px;
	}
	.mynavheaderbar {
		min-width:680px;
	}
	.navbar .nav {
	  margin: 0;
	  display: table;
 	  width: 100%;
	}
	.navbar .nav li.mynav {
	  display:inline;
	  float: none;
	  display: table-cell;
	  border:1px solid #beceeb; 
	  text-align:center; 
	  vertical-align:middle;
	}
	.navbar .nav li.mynav a {
	  font-weight: bold;
	  text-align: center;
	  border-left: 1px solid rgba(255,255,255,.75);
	  border-right: 1px solid rgba(0,0,0,.1);
	}
	.navbar .nav li.mynav:first-child a {
		border-left: 0;
		border-radius: 3px 0 0 3px;
	}
	.navbar .nav li.mynav:last-child a {
		border-right: 0;
		border-radius: 0 3px 3px 0;
	}
	.mymiddleimage {
		width:90px;
		height:90px;
	}
	.mybigimage {
		width:200px;
		height:200px;
	}
</style>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="${STATIC_ROOT}/js/html5shiv.js"></script>
    <![endif]-->
<!-- Fav and touch icons -->
<!-- 		<link rel="shortcut icon" href="../assets/ico/favicon.png"> -->

