<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript">
	var examTime = 20 * 60;
	var useTime = 0, remainTime = examTime;

	// 显示使用时间和剩余时间
	function showCount() {
		if (remainTime == 0) {
			document.getElementById("myForm").submit();
		}
		useTime += 1;
		remainTime -= 1;
		var hourU = Math.floor(useTime / 3600);
		var minuteU = Math.floor((useTime - hourU * 3600) / 60);
		var secondU = Math.floor(useTime - hourU * 3600 - minuteU * 60);
		document.getElementById("useTime").innerHTML = format(hourU) + ":"
				+ format(minuteU) + ":" + format(secondU);

		var hourR = Math.floor(remainTime / 3600);
		var minuteR = Math.floor((remainTime - hourR * 3600) / 60);
		var secondR = Math.floor(remainTime - hourR * 3600 - minuteR * 60);
		document.getElementById("remainTime").innerHTML = format(hourR) + ":"
				+ format(minuteR) + ":" + format(secondR);
	}

	// 格式化日期数字
	function format(timeNumber) {
		if (timeNumber == 0) {
			return "00";
		} else if (timeNumber < 10) {
			return "0" + timeNumber;
		} else {
			return timeNumber;
		}
	}

	window.setInterval("showCount()", 1000);
</script>
<style>
body {
	font-family: 'Montserrat', 'Helvetica Neue', Arial, sans-serif;
	font-weight: 700;
}
</style>
</head>
<body>
	<div style="position: relative; left: 200px">
		<div>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考试时间：<strong>20分钟</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				计时：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="useTime"
					style="font-weight: bold;"></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				剩余时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="remainTime"
					style="font-weight: bold;"></font>
			</p>
			<hr />
			<p>${paper.papername}</p>
			<p>(&nbsp;满分120&nbsp;)</p>
		</div>
		<div>
			<strong>一，单选题</strong>（每题10分，答错不得分）<br /> <br />
			<form id="myForm" method="post" action="${APP_PATH }/exam/insert">
				<c:forEach var="s" items="${squestionList }">
					<strong>${s.subject }</strong>
					<br />
					<br />
					<input type="radio" name="${s.id }" value="A"> ${s.optiona }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="${s.id }" value="B"> ${s.optionb }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="${s.id }" value="C"> ${s.optionc }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="${s.id }" value="D"> ${s.optiond }
					<br />
					<br />
				</c:forEach>
				<strong>二，多选题</strong>（每题10分，答错不得分）<br /> <br />
				<c:forEach var="m" items="${mquestionList }">
					<strong>${m.subject }</strong>
					<br />
					<br />
					<input type="checkbox" name="${m.id }" value="A"> ${m.optiona }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="${m.id }" value="B"> ${m.optionb }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="${m.id }" value="C"> ${m.optionc }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="${m.id }" value="D"> ${m.optiond }
					<br />
					<br />
				</c:forEach>
				<strong>二，判断题</strong>（每题10分，答错不得分）<br /> <br />
				<c:forEach var="j" items="${jquestionList }">
					<strong>${j.subject }</strong>
					<br />
					<br />
					<input type="radio" name="${j.id }" value="A"> ${j.optiona }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="${j.id }" value="B"> ${j.optionb }
					<br />
					<br />
				</c:forEach>
				<strong>二，填空题</strong>（每题10分，答错不得分）<br /> <br />
				<c:forEach var="c" items="${cquestionList }">
					<strong>${c.subject }</strong>
					<input type="text" name="${c.id }" value="">
					<br />
					<br />
				</c:forEach>
				<button class="btn btn-primary" type="submit">交卷</button>
			</form>
		</div>
	</div>
</body>
</html>