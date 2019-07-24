<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script type="text/javascript">
	function checkForm() {
		var subject = document.getElementById("subject").value;
		var optiona = document.getElementById("optiona").value;
		var optionb = document.getElementById("optionb").value;
		var optionc = document.getElementById("optionc").value;
		var optiond = document.getElementById("optiond").value;
		var answer = document.getElementById("answer").value;
		var knowledge = document.getElementById("knowledge").value;
		var levle = document.getElementById("levle").value;

		if (subject == null || subject == "") {
			alert("试题名称不能为空！");
			return false;
		}
		if (optiona == null || optiona == "") {
			alert("选项A不能为空！");
			return false;
		}
		if (optionb == null || optionb == "") {
			alert("选项B不能为空！");
			return false;
		}
		if (optionc == null || optionc == "") {
			alert("选项C不能为空！");
			return false;
		}
		if (optiond == null || optiond == "") {
			alert("选项D不能为空！");
			return false;
		}
		if (answer == null || answer == "") {
			alert("答案不能为空！");
			return false;
		}
		if (knowledge == null || knowledge == "") {
			alert("知识点不能为空！");
			return false;
		}
		if (levle == null || levle == "") {
			alert("难易水平不能为空！");
			return false;
		}
		return true;
	}
</script>
<body>
	<form class="form-horizontal"
		action="${APP_PATH }/question/question_update">
		<c:forEach var="qList" items="${qList}">
			<div class="form-group">
				<label for="inputQuestionid" class="col-sm-2 control-label">试题编号</label>
				<div class="col-sm-10">
					<input type="text" name="id" class="form-control"
						value="${qList.id}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="inputQuestionName" class="col-sm-2 control-label">试题名称</label>
				<div class="col-sm-10">
					<input type="text" name="subject" id="subject" class="form-control"
						value="${qList.subject}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputoptionA" class="col-sm-2 control-label">选项A</label>
				<div class="col-sm-10">
					<input type="text" name="optiona" id="optiona" class="form-control"
						value="${qList.optiona}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputoptionB" class="col-sm-2 control-label">选项B</label>
				<div class="col-sm-10">
					<input type="text" name="optionb" id="optionb" class="form-control"
						value="${qList.optionb}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputoptionC" class="col-sm-2 control-label">选项C</label>
				<div class="col-sm-10">
					<input type="text" name="optionc" id="optionc" class="form-control"
						value="${qList.optionc}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputoptionD" class="col-sm-2 control-label">选项D</label>
				<div class="col-sm-10">
					<input type="text" name="optiond" id="optiond" class="form-control"
						value="${qList.optiond}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputanswer" class="col-sm-2 control-label">答案</label>
				<div class="col-sm-10">
					<input type="text" name="answer" id="answer" class="form-control"
						value="${qList.answer}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputQuestionType" class="col-sm-2 control-label">试题类型</label>
				<div class="col-sm-10">
					<input type="text" name="type" class="form-control"
						value="${qList.type}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="inputknowledge" class="col-sm-2 control-label">知识点</label>
				<div class="col-sm-10">
					<input type="text" name="knowledge" class="form-control"
						value="${qList.knowledge}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputlevle" class="col-sm-2 control-label">难易水平</label>
				<div class="col-sm-10">
					<input type="text" name="levle" class="form-control"
						value="${qList.levle}">
				</div>
			</div>

		</c:forEach>
		<div class="modal-footer">
			<button type="submit" class="btn btn-primary">保存</button>
		</div>
	</form>
</body>
</html>