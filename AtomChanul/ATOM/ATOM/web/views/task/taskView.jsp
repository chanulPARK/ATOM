<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/taskAside.jsp" %>
<%@ page import='java.util.*, atom.task.model.vo.Task' %>
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
<script>
	function taskDelete() {
		var frm = $('#task-details');
		var name = "<%=t.getTaskTitle() %>";
		var url = "<%=request.getContextPath()%>/task/taskDelete?taskNo=<%=t.getTaskNo()%>";
		var bool = confirm("["+name+"]을 정말 삭제하시겠습니까?");
		if(bool) {
			frm.attr("action",url);
			frm.submit();
		}
		else alert("삭제가 취소되었습니다.")
	}
</script>

<section>
    <div class="content">
        <div class="col-md-12">
            <h4>업무 세부사항</h4>
        	<form id="task-details">
        		<input type="hidden" name="taskNo" value="<%=t.getTaskNo() %>">
        		
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
		                <button type="button" class="btn btn-sm btn-default">수정</button>
		                <button type="button" class="btn btn-sm btn-default" onclick="taskDelete()">삭제</button>
		                <button type="button" class="btn btn-sm btn-default" onclick="history.back()">목록</button>
		            </div>
	            </div>
            </form>
        </div>
    </div>
</section>

<%@ include file="/views/common/footer.jsp" %>