<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/mainAside.jsp"%>
<%@ include file="/views/common/rightAside.jsp"%>
<%@ page import='java.util.*, atom.task.model.vo.Task' %>
<%
	List<Task> demandedlist = (List)request.getAttribute("demandedlist");
	List<Task> reportedlist = (List)request.getAttribute("reportedlist");

%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<style>
	.panel {
		border-radius: 0;
	}
</style>



<section class="dashboard" style="height: 100%; min-height: 900px; margin-right: 250px; padding-top:9px; border: 0; background: #eaeaea;">
	<div class="content">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading"><i class="fas fa-bullhorn"></i> 공지사항</div>
					<div class="panel-body" style="height: 200px">
						<table class="table table-condensed" style="font-size: 13px; margin: 0;">
							<tr>
								<td><a>ATOM 프로젝트 발표</a></td>
								<td>관리자</td>
								<td>2018.08.03.</td>
							</tr>
							<tr>
								<td><a>8월 식당 메뉴</a></td>
								<td>관리자</td>
								<td>2018.08.01.</td>
							</tr>
							<tr>
								<td><a>사내 공지사항</a></td>
								<td>관리자</td>
								<td>2018.08.01.</td>
							</tr>
							<tr>
								<td><a>2018년 1분기, 승진 축하합니다.</a></td>
								<td>관리자</td>
								<td>2018.07.01.</td>
							</tr>
							<tr>
								<td><a>2017년 창립 기념 행사</a></td>
								<td>관리자</td>
								<td>2017.11.15.</td>
							</tr>
							<tr>
								<td><a>사내 공지사항</a></td>
								<td>관리자</td>
								<td>2017.11.01.</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading"><i class="fa fa-archive"></i> 자원 신청 현황</div>
					<div class="panel-body" style="height: 200px">
						신청하신 [2F 회의실] 대여가 지금 [대기]상태 입니다
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading"><i class="fas fa-tasks"></i> 수신 업무요청</div>
					<div class="panel-body" style="height: 200px">
						<table class="table table-condensed" style="font-size: 13px; margin: 0;" id="table1">
							<% if(demandedlist!=null) {
								for(Task t : demandedlist) { %>
								<tr>
									<td><%=t.getTaskTitle() %></td>
									<td><%=t.getEmpName() %></td>
									<td><%=t.getTaskStatus() %></td>
									<td><%=t.getDeadline() %></td>
								</tr>
					        	<% }
				        	} %>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading"><i class="fas fa-tasks"></i> 수신 업무보고</div>
					<div class="panel-body" style="height: 200px">
						<table class="table table-condensed" style="font-size: 13px; margin: 0;" id="table1">
							<% if(reportedlist!=null) {
								for(Task t : reportedlist) { %>
								<tr>
									<td><%=t.getTaskTitle() %></td>
									<td><%=t.getEmpName() %></td>
									<td><%=t.getTaskStatus() %></td>
									<td><%=t.getDeadline() %></td>
								</tr>
					        	<% }
				        	} %>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%-- <script type="text/javascript" language="javascript">

	$(document).ready(function(){
	    $.ajax({
	        type : "GET",
	        url : "<%=request.getContextPath()%>/task/mainTaskList",
	        dataType : "json",
	        error : function(){
	            alert('통신실패!!');
	        },
	        success : function(data){
	        	alert(date);
	        	console.log(data.length);
	        	/* var temp = "<table><tr>";
				for(Task t : demandedlist) {
					temp += "<td>"+t.getTaskTitle()+"</td>";
					temp += "<td>"+t.getEmpName()+"</td>";
					temp += "<td>"+t.getTaskStatus()+"</td>";
					temp += "<td>"+t.getDeadline()+"</td>";
	        	}
	        	temp += "</tr></table>";
	        	$('#table1').html(temp); */
	        }
	    });
	});

</script> --%>

<%@ include file="/views/common/footer.jsp"%>
