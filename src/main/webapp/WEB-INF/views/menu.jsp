<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script type="text/javascript">
	function logout() {
		if (confirm('您确定要退出系统吗？')) {
			window.location.href = '${APP_PATH }/login/loginout';
		}
	}
</script>
 <style>
ul li{
margin: 5px 9% 5px 9%;
float:left;
}
</style>
<body>
	<div>
		<ul style="list-style-type:none">
			<li><a href="${APP_PATH }/paper/paperlist"><font
					color="blue" size="4px">在线考试</font></a></li>
			
			<li><a href="${APP_PATH }/exam/studentselect"><font
					color="blue" size="4px">成绩查询</font></a></li>
			
			<li><a href="${APP_PATH }/student/updatestudent"><font
					color="blue" size="4px">修改个人信息</font></a></li>
			
			<li><a href="javascript:logout()"><font color="blue"
					size="4px">退出系统</font></a></li>
		</ul>
	</div>
</body>
</html>