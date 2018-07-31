<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp" %> --%>
<%@ include file="/views/common/taskAside.jsp" %>
<%@ page import='java.util.*, atom.task.model.vo.Task, atom.task.model.vo.TaskProcess' %>
<%
	Task t = (Task)request.getAttribute("task");
	List<TaskProcess> processList = (List)request.getAttribute("list");
%>
<style>
	.tableTR {
		margin: 0;
  	}
	.inform-wrap h4 {
		margin: 10px
	}
	.inform-wrap h4 span {
		margin-right: 20px
	}
	.btn-wrap {
		margin: 10px 0;
		text-align: right;
	}
</style>
<script>

	function taskUpdate() {
		var frm = $('#task-details');
		var name = "<%=t.getTaskTitle() %>";
		var url = "<%=request.getContextPath()%>/task/taskUpdate?taskNo=<%=t.getTaskNo()%>";
		frm.attr("action",url);
		frm.submit();
	}
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
	
	// 진행도 바 처리
	/* function fn_per20(){
		$('.progress-bar').prop({
			value: 20
		});
	}; */
	
    checkProgress = function(strProgress) {
        $("#progressBar").attr("style", "width:"+strProgress+"%;");
        
        /* if(strProgress < 100){
            $("#saveButton").show();
            $("#completeButton").hide(); 
        } else {
            $("#saveButton").hide();
            $("#completeButton").show();
        } */
        $('input[name=progress2]').val(strProgress);
    };

</script>

<section>
    <div class="content">
        <div class="col-md-12">
            <h4>업무 세부사항</h4>
        	<form id="task-details">
        		<input type="hidden" name="taskNo" value="<%=t.getTaskNo() %>">
        		
	            <table class="tableTR table table-condensed" style="border-bottom: 1px solid #eaeaea">
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
						<td><%=t.getOriginalFile()==null?"첨부파일 없음":"" %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=t.getTaskContent() %></td>
					</tr>
	            </table>
            </form>
            
            <%if(t.getTaskType().equals("1-1") || t.getTaskType().equals("2-1")) {%>
            <div class="inform-wrap" style="border: 5px solid #eaeaea">
	            <form action="<%=request.getContextPath()%>/processInsert" method="post">
	            <input type="hidden" name="taskNo" value="<%=t.getTaskNo() %>">
	            <input type="hidden" name="processWriter" value="<%=t.getReceiver() %>">
	            <input type="hidden" name="progress2" value="0"/>
	            
	            <!-- 데이터가 있으면 받아오고 없으면 빈양식 출력 -->
	            	<h4>업무 처리내역<span class="btn-info btn-xs float-right">미완료</span></h4>
	            	<table class="tableTR table table-condensed">
	            		<tr>
						    <th>담당자</th>
						    <td><%=t.getReceiver() %></td>
						    <th>최종수정일</th>
						    <td></td>
						</tr>
						<tr>
						    <th>진행도</th>
						    <td>
						    	<div class="form-inline">
	                                 <a class="btn btn-default" href="javascript:checkProgress('0');" role="button"><span>0%</span></a>
	                                 <a class="btn btn-default" href="javascript:checkProgress('20');" role="button"><span>20%</span></a>
	                                 <a class="btn btn-default" href="javascript:checkProgress('40');" role="button"><span>40%</span></a>
	                                 <a class="btn btn-default" href="javascript:checkProgress('60');" role="button"><span>60%</span></a>
	                                 <a class="btn btn-default" href="javascript:checkProgress('80');" role="button"><span>80%</span></a>
	                                 <a class="btn btn-default" href="javascript:checkProgress('100');" role="button"><span>100%</span></a>
	                             </div>
                                 <div class="progress" style="width:448px;">
                                     <div class="progress-bar" id="progressBar" class="bar" style="width:0%;">
                                     </div>
                                 </div>
						    </td>
						    <td></td>
						    <td></td>
						</tr>
						<tr>
						    <th>업무 내용</th>
						    <td colspan="3"><textarea name="processContent" class="form-control" placeholder="업무 내용을 입력하세요." style="height: 150px;"></textarea></td>
						</tr>
					</table>
					<div class="btn-wrap">
		                <button type="submit" class="btn btn-sm btn-primary">저장</button>
		            </div>
				</form>
            </div>
            <%} %>
            
           	<%if(processList.equals("")) { %>
           	<div class="inform-wrap" style="border: 5px solid #eaeaea">
           		<%for(TaskProcess tp : processList) {
           			if(tp.getProcessWriter()!=empLoggedIn.getEmpName()) { %>
           		<h4>업무 처리내역<span class="btn-info btn-xs float-right"><%=tp.getProgress() %>%</span></h4>
           	
	            <table class="tableTR table table-condensed" style="border-bottom: 5px solid #eaeaea">
	            	<tr>
					    <th>담당자</th>
					    <td><%=tp.getProcessWriter() %></td>
					    <th>최종수정일</th>
					    <td><%=tp.getLastReformDate() %></td>
					</tr>
					<tr>
					    <th>진행도</th>
					    <td><%=tp.getProgress()%>%</td>
					    <td></td>
					    <td></td>
					</tr>
					<tr>
					    <th>업무 내용</th>
					    <td colspan="3"><%=tp.getProcessContent() %></td>
					</tr>
	            </table>
	            
				 <%} // if
				} //for %> 
			</div>
			<!-- ./inform-wrap -->
			<%} //if %>
			<div class="btn-wrap">
                <button type="button" class="btn btn-sm btn-default" onclick="taskUpdate()">수정</button>
                <button type="button" class="btn btn-sm btn-default" onclick="taskDelete()">삭제</button>
                <button type="button" class="btn btn-sm btn-default" onclick="history.back()">목록</button>
            </div>
        </div>
        <!-- ./col-md-12 -->
    </div>
</section>

<%@ include file="/views/common/footer.jsp" %>