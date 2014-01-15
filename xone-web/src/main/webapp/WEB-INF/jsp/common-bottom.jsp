<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div style="background: #333333; margin-top: 20px;">
    <!--帮助开始-->
    <div id="help">
        <ul>
            <li>
                <h3>关于我们</h3> <a href="#">掌畅简介</a><br /> <a href="#">加入我们</a> <br /> <a href="#">联系我们</a>
            </li>
            <li>
                <h3>网站条款</h3> <a href="#">版权说明</a><br /> <a href="#">隐私条款</a><br />
            </li>
            <li>
                <h3>帮助中心</h3> <a href="#">如何注册</a><br /> <a href="#">如何发布</a>
            </li>
            <li>
                <h3>移动应用</h3> <a href="#">下载苹果软件</a><br /> <a href="#">下载安卓软件</a>
            </li>
            <li>
                <h3>热线电话</h3> <span class="b">400-897-9727</span>
            </li>
        </ul>
        <div class="cb"></div>
    </div>
    <!--帮助结束-->
    <!--版权开始-->
    <div id="footer">
        Copyright © 2013-2018, All Rights Reserved<br /> 联系邮箱：alexhuang0906@hotmail.com
    </div>
    <!--版权结束-->
</div>
<script type="text/javascript">
    $(document).ready(function() {
        客服('xixi', 100, -152);

        (function() {
            function initHead() {
                setTimeout(showSubSearch, 0)
            }
            ;
            function showSubSearch() {
                $$("pt1").onmouseover = function() {
                    $$("pt2").style.display = "";
                    $$("pt1").className = "select select_hover"
                };
                $$("pt1").onmouseout = function() {
                    $$("pt2").style.display = "none";
                    $$("pt1").className = "select"
                };
                $$("s1").onclick = function() {
                    selSubSearch(1);
                    $$("q").focus()
                };
                $$("s2").onclick = function() {
                    selSubSearch(2);
                    $$("q").focus()
                };

            }
            ;

            function selSubSearch(iType) {
                hbb = [];
                hbb = {
                    1 : [ "大家在卖", "1" ],
                    2 : [ "大家想买", "2" ],

                };
                $$("s0").innerHTML = hbb[iType][0];
                $$("pt2").style.display = "none";
                SetCookie('sousuosss', iType);
                $$("catid").value = hbb[iType][1];
            }
            ;
            initHead();
        })();

        hbb = [];
        hbb = {
            1 : [ "大家在卖", "1" ],
            2 : [ "大家想买", "2" ],

        };

        if (GetCookie('sousuosss')) {
            var sss = GetCookie('sousuosss');
            $$("s0").innerHTML = hbb[sss][0];
            $$("catid").value = hbb[sss][1];
        }

        $(".iphone").hover(function() {
            $(this).find(".c_iphone").show();
        }, function() {
            $(this).find(".c_iphone").hide();
        });
        $(".android").hover(function() {
            $(this).find(".c_android").show();
        }, function() {
            $(this).find(".c_android").hide();
        });

    });
    function bottomForm(search_form) {
        if (search_form.catid.value == 2) {
            search_form.action = "${pageContext.request.contextPath}/purchase/list.html";
            document.search_form.submit();
            return false;
        } else if (search_form.catid.value == 1) {
            search_form.action = "${pageContext.request.contextPath}/product/list.html";
            document.search_form.submit();
            return false;
        } else {
            search_form.action = "${pageContext.request.contextPath}/product/list.html";
            document.search_form.submit();
            return false;
        }
    }
</script>
<<script type="text/javascript">
<!--
function correctPNG() 
{
    for(var i=0; i<document.images.length; i++)
    {
    var img = document.images[i]
    var LW=img.width
    var LH=img.height
    var imgName = img.src.toUpperCase()
    if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
    { 
          img.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src="+img.src+", sizingmethod=scale);" 
          img.src="${STATIC_ROOT}/new-style/js/transparent.gif"//transparent.gif为1px*1px的透明gif图片
          img.width=LW
          img.height=LH
    }
    }
}
if (isIE()) {window.attachEvent("onload", correctPNG);}
-->
</script>
