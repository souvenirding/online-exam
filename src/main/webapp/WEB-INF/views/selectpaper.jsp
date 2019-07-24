<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${APP_PATH }/static/bootstrap-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript">
	function checkForm() {
		var paperId = $("#paperId").val();
		var levle = $("#levle").val();
		var knowledge = $("#knowledge").val();
		
		if (levle == null || levle == "") {
			alert("请选择题目难易程度！");
			return false;
		}
		if (paperId == null || paperId == "") {
			alert("请选择考试试卷！");
			return false;
		}
		if (knowledge == null || knowledge == "") {
			alert("请选择考察知识点！");
			return false;
		}
		return true;
	}
	
	/* 二级下拉菜单 */
	/**
	当第一个下拉框选择有值时，发送ajax请求，向数据库查询
	得到第二个下拉选择框的值并填入。
	*/
	$(function(){
		$("#paperId").change(function(){
			$("#knowledge option:not(:first)").remove();
			var paperid = $("#paperId").val();
			//alert(paperid);
			if(paperid != ""){
				var url = "${APP_PATH }/q_p/selectknow";
				var args = {"paperid":paperid}; 
				
				 $.getJSON(url,args,function(data){
					if(data.length==0){
						alert("此试卷上没有题目");
					}else{
						for(var i = 0;i<data.length;i++){
							var knowledge = data[i];
							$("#knowledge").append("<option value="+knowledge+">"+knowledge+"</option>")
						}
					}
				})
			}
		});
	})
</script>
<body>
	<div align="center" style="height:530px">
		<form action="${APP_PATH }/paper/getdetail" method="post"
			onsubmit="return checkForm()">
			<table class="table table-hover">
				<tr class="active" align="center">
					<td><label><strong>请选择考试信息：</strong></label>
					<select style="width:160px;height:35px;" id="levle" name="levle">
					<option value="">请选择题目难易程度</option>
					<option value="1">简单</option>
					<option value="2">正常</option>
					<option value="3">复杂</option>
					</select>
					&nbsp;&nbsp;
					<select
						style="width:160px;height:35px;" id="paperId" name="paperId">
							<option value="">请选择考试科目试卷</option>
							<c:forEach var="paper" items="${papers }">
								<option value="${paper.id}">${paper.papername}</option>
							</c:forEach>
					</select>
					&nbsp;&nbsp;
					<select style="width:160px;height:35px;" id="knowledge" name="knowledge">
					<option value="">请选择考察知识点</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"
						class="btn btn-success" value="确定"></td>
				</tr>
			</table>
		</form>
	</div>
</body>