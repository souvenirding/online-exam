<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script type="text/javascript">
	function logout() {
		if (confirm('您确定要退出系统吗？')) {
			window.location.href = '${APP_PATH }/login/loginout';
		}
	}
</script>
<style>
ul li {
	margin: 5px 6% 5px 6%;
	float: left;
}
</style>
<body>
	<div>
		<ul style="list-style-type:none">
			<li><a href="${APP_PATH }/student/studentlist"><font
					color="red" size="4px">考生信息管理</font></a></li>
			<li><a href="${APP_PATH }/exam/managerselect"><font
					color="red" size="4px">考生成绩查询</font></a></li>
			<li><a href="${APP_PATH }/paper/managerselect"><font
					color="red" size="4px">试卷管理</font></a></li>
			<li><a href="${APP_PATH }/question/questionlist"><font
					color="red" size="4px">题目管理</font></a></li>
			<li><a href="javascript:logout()"><font color="red"
					size="4px">退出系统</font></a></li>
		</ul>
	</div>
</body>
</html>