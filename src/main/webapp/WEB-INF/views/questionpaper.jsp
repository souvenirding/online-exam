<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<link href="${APP_PATH }/static/bootstrap-dist/css/bootstrap.min.css"
	rel="stylesheet">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script type="text/javascript">
	function checkForm() {
		var questionid = document.getElementById("questionid").value;

		if (questionid == null || questionid == "") {
			alert("试卷编号不能为空！");
			return false;
		}
		return true;
	}
</script>
<body>
	<div class="modal-body">
		<form class="form-horizontal" action="${APP_PATH }/q_p/update"
			onsubmit="return checkForm()">
			<c:forEach var="question_papers" items="${question_papers}">
				<div class="form-group">
					<label for="input" class="col-sm-2 control-label">编号</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="id"
							value="${question_papers.id }" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="input" class="col-sm-2 control-label">试卷编号</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="paperid"
							value="${question_papers.paperid }" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="input" class="col-sm-2 control-label">题目编号</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="questionid"
							id="questionid" value="${question_papers.questionid }">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">更新</button>
				</div>
			</c:forEach>
		</form>
	</div>
</body>
</html>