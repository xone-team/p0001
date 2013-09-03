<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC 
	"-//W3C//DTD XHTML 1.1 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>Index</title>
	</head>
	<body>
<% 
	String browserInfo = request.getHeader("User-Agent");
	String browserName = "";
	String browserVersion = "";
	if (browserInfo.contains("MSIE")) {
		String substring = browserInfo.substring(browserInfo.indexOf("MSIE"));
		String info[] = (substring.split(";")[0]).split(" ");
		browserName = info[0];
		browserVersion = info[1];
	} else if (browserInfo.contains("Firefox")) {
		String substring = browserInfo.substring(browserInfo.indexOf("Firefox"));
		String info[] = (substring.split(" ")[0]).split("/");
		browserName = info[0];
		browserVersion = info[1];
	} else if (browserInfo.contains("Chrome")) {
		String substring = browserInfo.substring(browserInfo.indexOf("Chrome"));
		String info[] = (substring.split(" ")[0]).split("/");
		browserName = info[0];
		browserVersion = info[1];
	} else if (browserInfo.contains("Opera")) {
		String substring = browserInfo.substring(browserInfo.indexOf("Opera"));
		String info[] = (substring.split(" ")[0]).split("/");
		browserName = info[0];
		browserVersion = info[1];
	} else if (browserInfo.contains("Safari")) {
		String substring = browserInfo.substring(browserInfo.indexOf("Safari"));
		String info[] = (substring.split(" ")[0]).split("/");
		browserName = info[0];
		browserVersion = info[1];
	}
%>
<% 
	out.println("User-Agent: " + browserInfo + "<br>");
	out.println("BrowserName: " + browserName + "<br>");
	out.println("BrowserVersion: " + browserVersion + "<br>");
%>
<div>
	<a href="http://www.google.com/chrome/eula.html?hl=zh-CN" target="_blank">谷歌(Chrome)浏览器在线安装</a>
</div>
<div>
	<a href="http://www.google.com/chrome/eula.html?hl=zh-CN" target="_blank">谷歌(Chrome)浏览器在线安装</a>
</div>
<div>
	<a href="http://www.google.com/chrome/eula.html?hl=zh-CN&standalone=1" target="_blank">谷歌(Chrome)离线安装包(仅 Windows可用)</a>
</div>
<div>
	<a href="http://www.mozilla.org/en-US/firefox/all/" target="_blank">火狐(Firefox)浏览器下载安装</a>
</div>
<div>
	<a href="http://www.opera.com/zh-cn" target="_blank">Opera浏览器下载安装</a>
</div>
<div>
	<a href="http://safari.softonic.cn/" target="_blank">Safari浏览器(Windows)下载安装</a>
</div>
	</body>
</html>
