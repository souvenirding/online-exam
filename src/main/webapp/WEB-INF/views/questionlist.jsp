<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-dist/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<!-- 添加题目Modal -->
	<div class="modal fade" id="question_add" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加题目</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="contentForm">
						<div class="form-group">
							<label for="inputQuestionName" class="col-sm-2 control-label">试题名称</label>
							<div class="col-sm-10">
								<input type="text" name="subject" id="subject"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="inputoptionA" class="col-sm-2 control-label">选项A</label>
							<div class="col-sm-10">
								<input type="text" name="optiona" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="inputoptionB" class="col-sm-2 control-label">选项B</label>
							<div class="col-sm-10">
								<input type="text" name="optionb" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="inputoptionC" class="col-sm-2 control-label">选项C</label>
							<div class="col-sm-10">
								<input type="text" name="optionc" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="inputoptionD" class="col-sm-2 control-label">选项D</label>
							<div class="col-sm-10">
								<input type="text" name="optiond" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="inputanswer" class="col-sm-2 control-label">答案</label>
							<div class="col-sm-10">
								<input type="text" name="answer" id="answer"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="inputknowledge" class="col-sm-2 control-label">知识点</label>
							<div class="col-sm-10">
								<input type="text" name="knowledge" id="knowledge"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="inputlevle" class="col-sm-2 control-label">难易水平</label>
							<div class="col-sm-10">
								<select class="form-control" name="levle" id="levle">
									<option value="">请选择...</option>
									<option value="1">简单</option>
									<option value="2">正常</option>
									<option value="3">复杂</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputQuestionType" class="col-sm-2 control-label">试题类型</label>
							<div class="col-sm-10">
								<select class="form-control" name="type" id="type">
									<option value="">请选择...</option>
									<option value="1">单选题</option>
									<option value="2">多选题</option>
									<option value="3">判断题</option>
									<option value="4">填空题</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						id="question_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加题目说明 -->
	<div class="modal fade" id="question_addinfo" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加试题说明</h4>
				</div>
				<div class="modal-body">
					<p>
						选择题请填入题目、选项、答案，答案填入ABCD，多个<font color="red">以英文逗号“,”分割</font>
					</p>
					<br>
					<p>填空题请填入题目和答案</p>
					<br>
					<p>判断题请填入题目，A选项为√，B选项为×，答案为A或者B</p>
					<br>
					<p>
						添加题目到试卷，若有多个题目，编号之间<font color="red">以英文逗号“,”分割</font>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加题目到试卷 -->
	<div class="modal fade" id="q_add_p" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加题目到试卷</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="contentForm">
						<div class="form-group">
							<label for="inputquestionid" class="col-sm-2 control-label">题目编号</label>
							<div class="col-sm-10">
								<input type="text" name="questionid" id="questionid"
									class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label for="inputpaperid" class="col-sm-2 control-label">所属试卷</label>
							<div class="col-sm-10">
								<select class="form-control" name="paperid"
									id="paper_add_select">
									<option value="">请选择...</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="qaddp_savebtn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div align="center">
			<h2>试题信息管理</h2>
		</div>
		<div align="right">
			<button type="button" class="btn btn-primary" id="questionadd_info">功能说明</button>
			<button type="button" class="btn btn-primary"
				id="questionadd_modal_btn">添加题目</button>
			<button type="button" class="btn btn-primary" id="qaddp">添加题目到试卷</button>
		</div>
		<br>
		<div>
			<table class="table table-hover">
				<tr class="active">
					<th>题目编号</th>
					<th>加入题目</th>
					<th>加入时间</th>
					<th>题目类型</th>
					<th>知识点</th>
					<th>难易水平</th>
					<th>操作</th>
				</tr>
				<c:forEach var="questionlist" items="${questionlist}">
					<tr class="success">
						<td>${questionlist.id}</td>
						<td>${questionlist.subject }</td>
						<td><fmt:formatDate value="${questionlist.jointime }"
								type="date" pattern="yyyy-MM-dd" /></td>
						<c:choose>
							<c:when test="${questionlist.type==1 }">
								<td>单选题</td>
							</c:when>
							<c:when test="${questionlist.type==2 }">
								<td>多选题</td>
							</c:when>
							<c:when test="${questionlist.type==3 }">
								<td>判断题</td>
							</c:when>
							<c:otherwise>
								<td>填空题</td>
							</c:otherwise>
						</c:choose>
						<td>${questionlist.knowledge }</td>
						<c:choose>
							<c:when test="${questionlist.levle==1 }">
								<td>简单</td>
							</c:when>
							<c:when test="${questionlist.levle==2 }">
								<td>正常</td>
							</c:when>
							<c:otherwise>
								<td>复杂</td>
							</c:otherwise>
						</c:choose>
						<td><button type="button" class="btn btn-success"
								onclick="javascript:window.location='${APP_PATH }/question/questionupdate?questionid=${questionlist.id }'">修改</button>&nbsp;&nbsp;
							<button type="button" class="btn btn-danger"
								onclick="javascript:window.location='${APP_PATH }/question/questiondelete?questionid=${questionlist.id }'">删除</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<script>
		/* 添加试卷详细说明 */
		$("#questionadd_info").click(function() {
			$("#question_addinfo").modal({
				backdrop : "static"
			});
		});

		/* 添加题目到试卷 */
		$("#qaddp").click(function() {
			$("#q_add_p select option:not(:first)").remove();
			getPapers();
			$("#q_add_p").modal({
				backdrop : "static"
			});
		});

		/* 添加题目 */
		$("#questionadd_modal_btn").click(function() {
			$("#question_add").modal({
				backdrop : "static"
			});
		});

		//查询所有试卷信息，并显示在添加题目到试卷的下拉列表中
		function getPapers() {
			$.ajax({
				url : "${APP_PATH }/paper/getpapers",
				success : function(result) {
					$.each(result.extend.paperlist, function() {
						var optionEle = $("<option></option>").append(
								this.papername).attr("value", this.id);
						optionEle.appendTo("#paper_add_select");
					});
				}
			});
		};

		//保存题目信息
		$("#question_save_btn").click(
				function() {
					var answer = document.getElementById("answer").value;
					var subject = document.getElementById("subject").value;
					var levle = document.getElementById("levle").value;
					var knowledge = document.getElementById("knowledge").value;
					var QuestionType = document.getElementById("type").value;
					if (answer == "" || answer == null || subject == ""
							|| subject == null || levle == "" || levle == null
							|| knowledge == "" || knowledge == null
							|| QuestionType == null || QuestionType == "") {
						alert("题目名称、答案、知识点、类型、难易水平不能为空！");
					} else {
						$.ajax({
							url : "${APP_PATH }/question/questionsave",
							data : $("#question_add form").serialize(),
							success : function(result) {
								alert(result.msg);
								$("#question_add").modal('hide');
							}
						});
					}
				});

		//将题目添加到试卷的信息保存
		$("#qaddp_savebtn")
				.click(
						function() {
							var questionid = document
									.getElementById("questionid").value;
							var paper_add_select = document
									.getElementById("paper_add_select").value;
							if (questionid == "" || questionid == null
									|| paper_add_select == ""
									|| paper_add_select == null) {
								alert("题目编号和试卷名称不能为空！");
							} else {
								$.ajax({
									url : "${APP_PATH }/q_p/q_psave",
									data : $("#q_add_p form").serialize(),
									success : function(result) {
										alert(result.extend.result);
										$("#q_add_p").modal('hide');
									}
								});
							}
						});

		//清空模态框表单中上次的数据
		$('#question_add').on('hidden.bs.modal', function() {
			document.getElementById("contentForm").reset();
		});

		$('#q_add_p').on('hidden.bs.modal', function() {
			document.getElementById("contentForm").reset();
		});
	</script>
</body>
</html>
