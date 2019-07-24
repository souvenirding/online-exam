<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH }/static/bootstrap-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript">
	function checkForm() {
		var id = document.getElementById("id").value.trim();
		var password = document.getElementById("password").value.trim();
		var yzm = document.getElementById("yzm").value.trim();
		if (id == null || id == "") {
			alert("准考证号不能为空！");
			return false;
		}
		if (password == null || password == "") {
			alert("登录密码不能为空！");
			return false;
		}
		if (yzm == null || yzm == "") {
			alert("验证码不能为空！");
			return false;
		}
		return true;
	}

	function resetValue() {
		document.getElementById("id").value = "";
		document.getElementById("password").value = "";
	}
	
	function ghyzm(){
		location.reload(true);
	}

</script>
<body style="background:url(${APP_PATH }/static/img/bg.jpg) ;background-size:cover; ">
	<div align="center">
		<form method="post" action="${APP_PATH }/student/login"
			onsubmit="return checkForm()">
			<table>
				<tr height="230">
					<td colspan="4"></td>
				</tr>
				<tr height="10">
					<td width="35%"></td>
					<td width="10%"><label>准考证号：</label></td>
					<td>&nbsp;&nbsp;<input type="text" id="id" name="id" /></td>
					<td width="30%"></td>
				</tr>
				<tr height="10"></tr>
				<tr height="10">
					<td width="35%"></td>
					<td width="10%"><label>登录密码：</label></td>
					<td>&nbsp;&nbsp;<input type="password" id="password" name="password" /></td>
					<td width="30%"></td>
				</tr>
				<tr height="10"></tr>
				<tr height="10">
					<td width="35%"></td>
					<td width="10%"><button type="button" class="btn btn-default btn-sm"
							onclick="ghyzm()">验证码：<%=session.getAttribute("verifyCodeValue")%></button></td>
					<td>&nbsp;&nbsp;<input type="text" id="yzm" name="yzm" value="" /></td>
					<td width="30%"></td>
				</tr>
				<tr height="10"></tr>
				<tr height="10">
					<td width="35%"></td>
					<td width="10%"><button type="submit" class="btn btn-primary">登录</button></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger"
							onclick="resetValue()">重置</button></td>
					<td width="30%"></td>
				</tr>
			</table>
			<h1>${requestScope.nouser}</h1>
		</form>
	</div>
</body>
<script type="text/javascript">

/* 网页鼠标点击特效（爱心）*/
!function (e, t, a) {function r() {for (var e = 0; e < s.length; e++) s[e].alpha <= 0 ? (t.body.removeChild(s[e].el), s.splice(e, 1)) : (s[e].y--, s[e].scale += .004, s[e].alpha -= .013, s[e].el.style.cssText = "left:" + s[e].x + "px;top:" + s[e].y + "px;opacity:" + s[e].alpha + ";transform:scale(" + s[e].scale + "," + s[e].scale + ") rotate(45deg);background:" + s[e].color + ";z-index:99999");requestAnimationFrame(r)}function n() {var t = "function" == typeof e.onclick && e.onclick;e.onclick = function (e) {t && t(), o(e)}}function o(e) {var a = t.createElement("div");a.className = "heart", s.push({el: a,x: e.clientX - 5,y: e.clientY - 5,scale: 1,alpha: 1,color: c()}), t.body.appendChild(a)}function i(e) {var a = t.createElement("style");a.type = "text/css";try {a.appendChild(t.createTextNode(e))} catch (t) {a.styleSheet.cssText = e}t.getElementsByTagName("head")[0].appendChild(a)}function c() {return "rgb(" + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + ")"}var s = [];e.requestAnimationFrame = e.requestAnimationFrame || e.webkitRequestAnimationFrame || e.mozRequestAnimationFrame || e.oRequestAnimationFrame || e.msRequestAnimationFrame || function (e) {setTimeout(e, 1e3 / 60)}, i(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"), n(), r()}(window, document);

</script>
</html>