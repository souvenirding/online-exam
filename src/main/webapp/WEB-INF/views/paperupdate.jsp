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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script type="text/javascript">
	function checkForm() {
		var papername = document.getElementById("papername").value;

		if (papername == null || papername == "") {
			alert("试卷名称不能为空！");
			return false;
		}
		return true;
	}
</script>
<body>
	<div class="modal-body">
		<form class="form-horizontal" action="${APP_PATH }/paper/paper_update" onsubmit="return checkForm()">
			<c:forEach var="paper" items="${paper}">
				<div class="form-group">
					<label for="inputPaperID" class="col-sm-2 control-label">试卷编号</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="id"
							value="${paper.id }" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPaperName" class="col-sm-2 control-label">试卷名称</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="papername" name="papername"
							value="${paper.papername }">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">保存</button>
				</div>
			</c:forEach>
		</form>
	</div>
</body>
</html>