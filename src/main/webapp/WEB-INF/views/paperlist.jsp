<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<link href="${APP_PATH }/static/bootstrap-dist/css/bootstrap.min.css"
	rel="stylesheet">
<body>
	<!-- 试卷添加模态框 -->
	<div class="modal fade" id="paperAdd" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加试卷</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputPaperName" class="col-sm-2 control-label">试卷名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="papername"
									id="papername">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="paper_add_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div align="center">
			<h2>试卷管理</h2>
		</div>
		<div align="right">
			<button type="button" class="btn btn-primary" id="paper_add">添加试卷</button>
		</div>
		<br>
		<div>
			<table class="table table-hover">
				<tr class="active">
					<th>试卷编号</th>
					<th>试卷名称</th>
					<th>添加日期</th>
					<th>操作</th>
				</tr>
				<c:forEach var="paper" items="${papers}">
					<tr class="success">
						<td>${paper.id }</td>
						<td>${paper.papername }</td>
						<td><fmt:formatDate value="${paper.joindate }" type="date"
								pattern="yyyy-MM-dd" /></td>
						<td>
							<button type="button" class="btn btn-info"
								onclick="javascript:window.location='${APP_PATH }/q_p/selectquestion?paperId=${paper.id}'">查看题目</button>&nbsp;&nbsp;
							<button type="button" class="btn btn-info"
								onclick="javascript:window.location='${APP_PATH }/paper/paperupdate?paperId=${paper.id}'">修改</button>&nbsp;&nbsp;
							<button type="submit" class="btn btn-danger"
								onclick="javascript:window.location='${APP_PATH }/paper/paperdelete?paperId=${paper.id}'">删除</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<script>
		//添加试卷
		$("#paper_add").click(function() {
			$("#paperAdd").modal({
				backdrop : "static"
			});
		});
		$("#paper_add_btn").click(function() {
			var papername = document.getElementById("papername").value;
			if (papername == "" || papername == null) {
				alert("试卷名称不能有空！");
			} else {
				$.ajax({
					url : "${APP_PATH }/paper/papersave",
					data : $("#paperAdd form").serialize(),
					success : function(result) {
						alert(result.extend.result);
						$("#paperAdd").modal('hide');
					}
				});
			}
		});
	</script>
</body>
</html>