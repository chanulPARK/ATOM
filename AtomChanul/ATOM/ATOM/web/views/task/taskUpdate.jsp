<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp" %> --%>
<%@ include file="/views/common/taskAside.jsp" %>
<%@ page import='java.util.*, atom.task.model.vo.Task' %>
<%
	Task t = (Task)request.getAttribute("task");
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
</style>
<script>
	// 제목 작성여부
	$(function(){
		$('#title1').blur(function(){
			var title = $('#title1').val().trim();
			if(title.length==0)
			{
				alert("제목을 입력하세요.");
				event.preventDefault();
				/* $('#title1').focus(); */
			}
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		nicEditors.allTextAreas()
	});
	
    $(function(){
        $('#reservation').datepicker({
        	format: 'yyyy-mm-dd',
        	months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            days: ['일', '월', '화', '수', '목', '금', '토'],
            daysShort: ['일', '월', '화', '수', '목', '금', '토'],
            daysMin: ['일', '월', '화', '수', '목', '금', '토'],
            yearSuffix: '년',
            autoHide: true
        });
	});
</script>

<style>
		.tableTR {
			table-layout: fixed;
            margin: 0;
        }
        .tableTR thead tr th {
            font-weight: bold;
            font-size: 13px;
            text-align: left;
        }
        .tableTR tbody tr td {
            font-size: 13px;
            text-align: left;
        }
        .float-right {
        	float: right;
        }
</style>

<section>
    <div class="content">
        <div class="col-md-12">
            <h4>업무 수정</h4>
        	<form action="<%=request.getContextPath()%>/task/taskWriteEnd" method="post" enctype="multipart/form-data">
        		<input type="hidden" name="userId" value="<%=empLoggedIn.getEmpId() %>">
        		<input type="hidden" name="userName" value="<%=empLoggedIn.getEmpName() %>">
        		<input type="hidden" name="deptCode" value="<%=empLoggedIn.getDeptCode() %>">
        		<input type="hidden" name="jopCode" value="<%=empLoggedIn.getJobCode() %>">
        		
	            <table class="tableTR table table-condensed">
	                <tbody>
	                    <tr>
	                        <th>
	                            <span style="color: red">* </span>제목</th>
	                        <td>
	                            <div>
	                                <input type="text" class="form-control input-sm" name="title" id="title1" value="<%=t.getTaskTitle() %>" placeholder="제목을 입력하세요." required>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>
	                            <span style="color: red">* </span>업무 형태</th>
	                        <td>
	                            <div class="label-group">
	                                <label class="radio-inline">
	                                    <input type="radio" class="fnone valid" id="type1" name="taskType" title="업무 요청" value="1" checked='<%=t.getTaskType()=="1"?"checked":"" %>'> 업무 요청</label>
	                                <label class="radio-inline">
	                                    <input type="radio" class="fnone valid" id="type2" name="taskType" title="업무 보고" value="2" checked='<%=t.getTaskType()=="2"?"checked":"" %>'> 업무 보고</label>
	                                <label class="radio-inline">
	                                    <input type="radio" class="fnone valid" id="type3" name="taskType" title="업무 일지" value="3" checked='<%=t.getTaskType()=="3"?"checked":"" %>'> 업무 일지</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr id="isTermlessTR">
	                        <th>
	                            <span style="color: red">* </span>업무 기한
	                        </th>
	                        <td>
	                            <div class="form-inline">
	                            <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon2">
                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control input-sm" id="reservation" name="enrollDate"  value="<%=t.getEnrollDate() %>">
                                    </div> ~
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon2">
                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control input-sm" id="reservation2" name="deadline" value="<%=t.getDeadline() %>">
                                    </div>
                                    <span class="form-group" style="margin: 0 0 0 4px">
                                       	<input type="checkbox" id="isTermless" title="기한없음" name="isTermless" value="0" style="margin: 0 4px 0 0">
                                        <label style="margin: 0">기한없음</label>
                                    </span>
                                </div>
	                        </td>
	                    </tr>
	                    <tr id="workerTR">
	                        <th id="workerTH1">담당자</th>
	                        <td>
	                            <div>
	                                <input type="text" class="form-control input-sm" placeholder="사용자" aria-required="true" name="receiver"  value="<%=t.getReceiver() %>">
	                            </div>
	                        </td>
	                    </tr>
	                    <tr id="folderTR">
	                        <th>
	                            <label for="folderI">업무 보관함</label>
	                        </th>
	                        <td id="selectFolder">
	                            <input type="hidden" id="folderId" name="folderId" value="">
	                            <input type="hidden" id="folderNmae" name="folderName" value="">
	                            <button type="button" class="btn btn-default btn-sm">업무 보관함</button>
	                        </td>
	                    </tr>
	                    <tr>
							<th>첨부파일</th>
							<td><input type="file" name="up_file"><%=t.getOriginalFile()==null?"첨부파일 없음":"" %></td>
						</tr>
	                </tbody>
	            </table>
	            <div>
		            <textarea name="area2" style="width: 100%; height: 250px"><%=t.getTaskContent() %></textarea>
	            </div>
	            
				<div class="btn-wrap float-right">
		            <button type="submit" class="btn btn-sm btn-primary">저장</button>
		            <button type="reset" class="btn btn-sm btn-default">취소</button>
				</div>
			</form>
       	</div>
    </div>
</section>

<%@ include file="/views/common/footer.jsp" %>