<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<style type="text/css">
div {
	position: absolute;
	top: 50%;
	left: 50%; 
	margin: -150px 0 0 -200px;
}

html, body {
	overflow: hidden;
	margin: 0;
	background: #000;
}

body {
	font-family: 'Open Sans', 'Helvetica Neue', 'Hiragino Sans GB',
		'LiHei Pro', Arial, sans-serif;
	color: #333;
}

h1 {
	font-family: 'Montserrat', 'Helvetica Neue', Arial, sans-serif;
	font-weight: 700;
	letter-spacing: 9px;
	text-transform: uppercase;
	color: #eee;
	margin: 12px 0;
}

a {
	color: black;
}

a:hover {
	color: blue;
}
</style>
</head>
<body>
	<div align="center">
		<h1>在线考试系统</h1>
		<a class="btn btn-link" href="${APP_PATH }/login/studentlogin"
			role="button"><span style="color: blue; font-size: 25px">学生登陆</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="btn btn-link" href="${APP_PATH }/login/managerlogin"
			role="button"><span style="color: blue; font-size: 25px">管理员登陆</span></a>
	</div>
</body>
<script type="text/javascript">
var snow = function() {
if(1==1) {
$("body").append('<canvas id="christmasCanvas" style="top: 0px; left: 0px; z-index: 5000; position: fixed; pointer-events: none;"></canvas>');
var b = document.getElementById("christmasCanvas"), a = b.getContext("2d"), d = window.innerWidth, c = window.innerHeight;
b.width = d;
b.height = c;
for(var e = [], b = 0;b < 70;b++) {
e.push({x:Math.random() * d, y:Math.random() * c, r:Math.random() * 4 + 1, d:Math.random() * 70})
}
var h = 0;
window.intervral4Christmas = setInterval(function() {
a.clearRect(0, 0, d, c);
a.fillStyle = "rgba(255, 255, 255, 0.6)";
a.shadowBlur = 5;
a.shadowColor = "rgba(255, 255, 255, 0.9)";
a.beginPath();
for(var b = 0;b < 70;b++) {
var f = e[b];
a.moveTo(f.x, f.y);
a.arc(f.x, f.y, f.r, 0, Math.PI * 2, !0)
}
a.fill();
h += 0.01;
for(b = 0;b < 70;b++) {
if(f = e[b], f.y += Math.cos(h + f.d) + 1 + f.r / 2, f.x += Math.sin(h) * 2, f.x > d + 5 || f.x < -5 || f.y > c) {
e[b] = b % 3 > 0 ? {x:Math.random() * d, y:-10, r:f.r, d:f.d} : Math.sin(h) > 0 ? {x:-5, y:Math.random() * c, r:f.r, d:f.d} : {x:d + 5, y:Math.random() * c, r:f.r, d:f.d}
}
}
}, 70)
}
}
snow();
</script>

</html>