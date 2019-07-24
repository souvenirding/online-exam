<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<link href="${APP_PATH }/static/bootstrap-dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script type="text/javascript">
	function checkForm() {
		var name = document.getElementById("name").value;
		var cardno = document.getElementById("cardno").value;
		var password = document.getElementById("password").value;
		var prefession = document.getElementById("prefession").value;
		var sex = document.getElementById("sex").value;
		var sex1 = "男";
		var sex2 = "女";

		if (name == null || name == "") {
			alert("姓名不能为空！");
			return false;
		}
		if (cardno == null || cardno == "") {
			alert("身份证不能为空！");
			return false;
		}
		if (password == null || password == "") {
			alert("密码不能为空！");
			return false;
		}
		if (prefession == null || prefession == "") {
			alert("专业不能为空！");
			return false;
		}
		if (sex == null || sex == "") {
			alert("性别不能为空！");
			return false;
		}
		if (sex === sex1 || sex === sex2) {
		}else{
			alert("性别需为男或者女！");
			return false;
		}
		return true;
	}
</script>
<body>
	<div class="modal-body">
		<form class="form-horizontal"
			action="${APP_PATH }/student/update_student"
			onsubmit="return checkForm()">
			<c:forEach var="student" items="${student}">
				<div class="form-group">
					<label for="inputStudentID" class="col-sm-2 control-label">准考证号</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="id"
							value="${student.id }" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="inputStudentName" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name"
							value="${student.name }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputStudentCardno" class="col-sm-2 control-label">身份证</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cardno" name="cardno"
							value="${student.cardno }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputStudentPassword" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="password"
							name="password" value="${student.password }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputStudentPrefession" class="col-sm-2 control-label">专业</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="prefession"
							name="prefession" value="${student.prefession }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputStudentSex" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="sex" name="sex"
							value="${student.sex }">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">保存</button>
				</div>
			</c:forEach>
			<h2 align="center">${requestScope.supdate}</h2>
		</form>
	</div>
</body>
</html>