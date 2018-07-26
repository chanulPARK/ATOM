<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/aside.jsp" %>
<%@ page import='java.util.*, atom.task.model.vo.Task, java.lang.*' %>
<%
	Employee emp = (Employee)request.getSession().getAttribute("empLoggedIn");
	Task t = (Task)request.getAttribute("task");
%>

<style>
		.tableTL {
            margin: 0;
        }
        .tableTL thead tr th {
            font-weight: bold;
            font-size: 13px;
            text-align: center;
        }
        .tableTL tbody tr td {
            font-size: 13px;
            text-align: center;
        }
        .float-right {
        	float: right;
        }
</style>

<section>
    <div class="content">
        <div class="col-md-12">
            <h4>업무 세부사항</h4>
        	<form action="<%=request.getContextPath()%>/task/taskWriteEnd" method="post" enctype="multipart/form-data">
        		<input type="hidden" name="userId" value="<%=emp.getEmpId() %>">
        		<input type="hidden" name="userName" value="<%=emp.getEmpName() %>">
        		<input type="hidden" name="deptCode" value="<%=emp.getDeptCode() %>">
        		<input type="hidden" name="jopCode" value="<%=emp.getJobCode() %>">
        	</form>
        		
	            <table class="tableTR table table-condensed">
                    <tr>
                        <th>제목</th>
                        <td><%=t.getTaskTitle() %></td>
                    </tr>
                    <tr>
                        <th>업무 상태</th>
                        <td><%=t.getTaskStatus() %></td>
                    </tr>
                    <tr>
                        <th>업무 기한</th>
                        <td><%=t.getEnrollDate()%> ~ <%=t.getDeadline() %></td>
                    </tr>
                    <tr>
                        <th>담당자</th>
                        <td><%=t.getReceiver() %></td>
                    </tr>
                    <tr>
                        <th>업무 보관함</th>
                        <td><button type="button" class="btn btn-default btn-xs">없음</button></td>
                    </tr>
                    <tr>
						<th>첨부파일</th>
						<td><%=t.getOriginalFile() %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=t.getTaskContent() %></td>
					</tr>
	            </table>
	            <div class="inform-wrap" style="border: 5px solid #eaeaea">
	            	<h5>&nbsp;&nbsp;업무 처리내역</h5>
	            	<table class="tableTR table table-condensed">
	            		<tr>
						    <th>담당자</th>
						    <td><%=t.getReceiver() %></td>
						    <th>상태</th>
						    <td><button class="btn btn-info btn-sm">미완료</button></td>
						</tr>
						<tr>
						    <th>진행도</th>
						    <td>
						    	<div class="progress">
									<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%"></div>
								</div>
						    </td>
						    <td></td>
						    <td></td>
						</tr>
						<tr>
						    <th>업무 내용</th>
						    <td colspan="3"><textarea class="form-control" placeholder="업무 내용을 입력하세요." style="height: 150px;"></textarea></td>
						</tr>
					</table>
					<div class="btn-wrap float-right">
		                <button type="submit" class="btn btn-sm btn-primary">저장</button>
		                <button type="button" class="btn btn-sm btn-default">임시저장</button>
		                <button type="reset" class="btn btn-sm btn-default">취소</button>
		                <button type="reset" class="btn btn-sm btn-default">목록</button>
		            </div>
	            </div>
        </div>
    </div>
</section>

<%@ include file="/views/common/footer.jsp" %>