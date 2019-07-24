<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH }/static/bootstrap-dist/css/bootstrap.min.css"
	rel="stylesheet">
<div align="center">
	<h2>成绩列表</h2>
</div>
<div>
	<table class="table table-hover">
		<tr class="active">
			<th>成绩编号</th>
			<th>试卷名称</th>
			<th>考试日期</th>
			<th>总分</th>
		</tr>
		<c:forEach var="exam" items="${studentexams}">
			<tr class="success">
				<td>${exam.id }</td>
				<td>${exam.paper.papername }</td>
				<td><fmt:formatDate value="${exam.examdate }" type="date"
						pattern="yyyy-MM-dd" /></td>
				<td>${exam.score }</td>
			</tr>
		</c:forEach>
	</table>
</div>