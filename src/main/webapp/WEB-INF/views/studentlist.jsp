<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
	http://localhost:3306/crud
 -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-dist/js/bootstrap.min.js"></script>
<title>student</title>
</head>
<body>
	<!-- 学生添加模态框 -->
	<div class="modal fade" id="studentAdd" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加学生</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputStudentID" class="col-sm-2 control-label">准考证</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="id" id="id">
							</div>
						</div>
						<div class="form-group">
							<label for="inputStudentName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="name" id="name">
							</div>
						</div>
						<div class="form-group">
							<label for="inputStudentCardno" class="col-sm-2 control-label">身份证号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="cardno" id="cardno">
							</div>
						</div>
						<div class="form-group">
							<label for="inputStudentPassword" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="password" id="password">
							</div>
						</div>
						<div class="form-group">
							<label for="inputStudentPrefession"
								class="col-sm-2 control-label">专业</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="prefession" id="prefession">
							</div>
						</div>
						<div class="form-group">
							<label for="inputStudentSex" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="sex" id="sex1" checked="checked" value="男"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="sex" id="sex2" value="女"> 女
								</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="student_add">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div align="center">
			<h2>学生信息</h2>
		</div>
		<div align="right">
			<button type="button" class="btn btn-primary" id="student_add_btn">添加学生</button>
		</div>
		<br>
		<div class="col-md-12">
			<table class="table table-hover">
				<tr class="active">
					<th>准考证号</th>
					<th>身份证</th>
					<th>姓名</th>
					<th>密码</th>
					<th>专业</th>
					<th>性别</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${studentlist }" var="student">
					<tr class="success">
						<td>${student.id }</td>
						<td>${student.cardno }</td>
						<td>${student.name }</td>
						<td>${student.password }</td>
						<td>${student.prefession }</td>
						<td>${student.sex }</td>
						<td>
							<button type="button" class="btn btn-info btn-sm"
								onclick="javascript:window.location='${APP_PATH }/student/studentupdate?studentid=${student.id}'">编辑</button>
							<button type="button" class="btn btn-danger btn-sm"
								onclick="javascript:window.location='${APP_PATH }/student/studentdelete?studentid=${student.id}'">删除</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<script>
		//添加学生
		$("#student_add_btn").click(function() {
			$("#studentAdd").modal({
				backdrop : "static"
			});
		});

		//保存学生信息
		$("#student_add").click(function() {
			var s_id = document.getElementById("id").value;
			var s_name = document.getElementById("name").value;
			var s_cardno = document.getElementById("cardno").value;
			var s_password = document.getElementById("password").value;
			var s_prefession = document.getElementById("prefession").value;
			if (s_id == null || s_id == "" || s_name == null || s_name == "" || s_cardno == null || s_cardno == "" || s_password == null || s_password == "" || s_prefession == null || s_prefession == "" ) {
				alert("学生信息不能有空！");
			}else{
				$.ajax({
					url : "${APP_PATH }/student/studentsave",
					data : $("#studentAdd form").serialize(),
					contentType : "application/x-www-form-urlencoded; charset=utf-8",
					success : function(result) {
						alert(result.extend.result);
						$("#studentAdd").modal('hide');
					}
				});
			}
		});
	</script>
</body>
</html>