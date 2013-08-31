<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<footer class="blue-gradiant box-shadow gradient">
    <div class="container">
        <center>
            <p>联系邮箱：hello123@163.net 服务热线：400-800-1234</p>
            <p>沪 ICP 证 070598 号</p>
            <p>Copyright &copy; 2013-2018, All Rights Reserved</p>
        </center>
    </div>
</footer>
<script type="text/javascript" src="${STATIC_ROOT}/js/jquery-1.10.0.min.js"></script>
<script type="text/javascript" src="${STATIC_ROOT}/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        var aboveHeight = $('.topbar').outerHeight() + 50;
        $(window).scroll(function() {
            if ($(window).scrollTop() > aboveHeight) {
                $('.navbar-floatingpage').fadeIn('fast');
            } else {
                $('.navbar-floatingpage').fadeOut('fast');
            }
        });
    });
</script>
